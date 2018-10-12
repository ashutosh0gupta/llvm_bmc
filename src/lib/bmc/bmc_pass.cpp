#include "bmc_pass.h"
#include "witness.h"
#include "lib/utils/solver_utils.h"
// TODO : remove reference to heap model and access of public class variables
#include "include/heap_model.h"

//todo: remove reference to bmc_obj which is due to global variables

#define BMC_UNSUPPORTED_INSTRUCTIONS( InstTYPE, Inst )                  \
  if(llvm::isa<llvm::InstTYPE>(Inst) ) {                                \
    std::cerr << "Occuring in block:\n";                                \
    LLVM_DUMP( Inst->getParent() )                                      \
    LLVM_DUMP( Inst )                                                   \
    llvm_bmc_error( "bmc", "Unsupported instruction!!");                   \
  }

bmc_pass::bmc_pass( options& o_, solver_context& sol_ctx_, bmc& b_)
    : o(o_)
    , solver_ctx(sol_ctx_)
    , bmc_obj(b_)
{}

bmc_pass::~bmc_pass() {
  // if( bmc_ds_ptr )
  //   delete bmc_ds_ptr;
}


//----------------------------------------------------------------------------
// translate parts of functions

void bmc_pass::translateParams(llvm::Function &f) {
  //  for (auto& f_arg : f.getArgumentList()) {
  for( auto ab = f.arg_begin(), ae = f.arg_end(); ab != ae; ab++) {
    bmc_ds_ptr->m.get_term( &(*ab) );
  }
}


void bmc_pass::translateBinOp( unsigned bidx, const llvm::BinaryOperator* bop){
  assert( bop );
  auto op0 = bop->getOperand( 0 );
  auto op1 = bop->getOperand( 1 );
  expr a = bmc_ds_ptr->m.get_term( op0 );
  expr b = bmc_ds_ptr->m.get_term( op1 );
  unsigned op = bop->getOpcode();
  switch( op ) {
  case llvm::Instruction::Add : bmc_ds_ptr->m.insert_term_map( bop, bidx, a+b     ); break;
  case llvm::Instruction::Sub : bmc_ds_ptr->m.insert_term_map( bop, bidx, a-b     ); break;
  case llvm::Instruction::Mul : bmc_ds_ptr->m.insert_term_map( bop, bidx, a*b     ); break;
  case llvm::Instruction::And : bmc_ds_ptr->m.insert_term_map( bop, bidx, a && b  ); break;
  case llvm::Instruction::Or  : bmc_ds_ptr->m.insert_term_map( bop, bidx, a || b  ); break;
  case llvm::Instruction::Xor : bmc_ds_ptr->m.insert_term_map( bop, bidx,_xor(a,b)); break;
  case llvm::Instruction::SDiv: bmc_ds_ptr->m.insert_term_map( bop, bidx, a/b     ); break;
  case llvm::Instruction::UDiv: bmc_ds_ptr->m.insert_term_map( bop, bidx, a/b     ); break;
  case llvm::Instruction::SRem: bmc_ds_ptr->m.insert_term_map( bop, bidx, rem(a,b)); break;
  case llvm::Instruction::URem: bmc_ds_ptr->m.insert_term_map( bop, bidx, rem(a,b)); break;
  case llvm::Instruction::FAdd:
  case llvm::Instruction::FSub:
  case llvm::Instruction::FDiv:
  case llvm::Instruction::FRem:
  default: {
    const char* opName = bop->getOpcodeName();
    llvm_bmc_error("bmc", "unsupported instruction \"" << opName << "\" occurred!!");
  }
  }
}

void bmc_pass::translateCmpInst( unsigned bidx, const llvm::CmpInst* cmp) {
  assert( cmp );
  // todo: two cases of cmp ICmpInst and FCmpInst
  // figure out which one is actually supported
  llvm::Value* lhs = cmp->getOperand( 0 ),* rhs = cmp->getOperand( 1 );
  // expr l = get_term( solver_ctx, lhs, m ), r = get_term( solver_ctx, rhs, m );
  expr l = bmc_ds_ptr->m.get_term( lhs ), r = bmc_ds_ptr->m.get_term( rhs );
  // l and r may have different types, due to llvm does not record clearly
  // if something is bool or int. Our translation may incorrectly identify
  // sort of some constant number. The following code corrects the mismatch
  if( !matched_sort( l, r ) ) {
    if( is_const( l ) ) {
      auto s = r.get_sort();
      l = switch_sort(l, s );
    }else if( is_const( r ) ) {
      auto s = l.get_sort();
      r = switch_sort(r, s );
    }else llvm_bmc_error("bmc", "mismatched types in cmp instruction!!");
  }
  llvm::CmpInst::Predicate pred = cmp->getPredicate();

  expr cnd(solver_ctx);
  switch( pred ) {
  case llvm::CmpInst::ICMP_EQ  : cnd = (l==r); break;
  case llvm::CmpInst::ICMP_NE  : cnd = (l!=r); break;
  case llvm::CmpInst::ICMP_UGT : cnd = (l> r); break;
  case llvm::CmpInst::ICMP_UGE : cnd = (l>=r); break;
  case llvm::CmpInst::ICMP_ULT : cnd = (l< r); break;
  case llvm::CmpInst::ICMP_ULE : cnd = (l<=r); break;
  case llvm::CmpInst::ICMP_SGT : cnd = (l> r); break;
  case llvm::CmpInst::ICMP_SGE : cnd = (l>=r); break;
  case llvm::CmpInst::ICMP_SLT : cnd = (l< r); break;
  case llvm::CmpInst::ICMP_SLE : cnd = (l<=r); break;
  default: {
    llvm_bmc_error("bmc", "unsupported predicate in compare " << pred << "!!");
  }
  }
  bmc_ds_ptr->m.insert_term_map( cmp, bidx, cnd );
}

void bmc_pass::translatePhiNode( unsigned bidx, const llvm::PHINode* phi ) {
  assert( phi );

  unsigned num = phi->getNumIncomingValues();
  if( phi->getType()->isIntegerTy() ) {
    expr new_var = o.loop_aggr ? bmc_ds_ptr->m.get_term( phi ) :
      bmc_ds_ptr->m.insert_new_def( phi );
    if( std::find(bmc_ds_ptr->quant_elim_val.begin(), bmc_ds_ptr->quant_elim_val.end(), phi) != bmc_ds_ptr->quant_elim_val.end() ) {
      bmc_ds_ptr->quant_elim_vars.push_back(new_var);
    }

    std::vector<expr> phi_cons;
    for( unsigned i = 0 ; i < num ; i++ ) {
      const bb* prev = phi->getIncomingBlock(i);
      const llvm::Value* v_ = phi->getIncomingValue(i);

      // condition to skip??
      std::vector<unsigned> pre_bidxes;
      for( unsigned pre_b_local: bmc_ds_ptr->pred_idxs[bidx]) {
        if( prev == bmc_ds_ptr->bb_vec[pre_b_local] ) {
          pre_bidxes.push_back( pre_b_local );
        }
      }
      //todo: check if this works
      for( unsigned pre_bidx : pre_bidxes) {
        expr prev_var = bmc_ds_ptr->m.get_earlier_term( v_, pre_bidx );
        // expr prev_var = bmc_ds_ptr->m.get_term( v_ );
        expr path_cond = extend_path( bidx, pre_bidx );
        phi_cons.push_back( implies(path_cond, new_var == prev_var) );
      }
    }

    bmc_ds_ptr->bmc_vec.push_back( _and(phi_cons, solver_ctx) );
  }else{
    llvm_bmc_error("bmc", "phi nodes with non integers not supported !!");
  }
}

void bmc_pass::assume_to_bmc(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  expr assume_path_bit = bmc_ds_ptr->get_path_bit(bidx);
  expr assume_term = bmc_ds_ptr->m.get_term( call->getArgOperand(0) );
  expr assume_bit = get_fresh_bool( solver_ctx, "assume");
  bmc_ds_ptr->set_path_bit( bidx, assume_bit );
  bmc_ds_ptr->bmc_vec.push_back( assume_bit == (assume_path_bit && assume_term) );
}

bool bmc_pass::is_assume(const llvm::CallInst* call) {
  assert( call );
  llvm::Function* fp = call->getCalledFunction();
  if( fp != NULL &&
      (fp->getName() == "_Z6assumeb" || fp->getName() == "assume" ) ) {
    return true;
  } else if (fp == NULL) {
    const llvm::Value * val = call->getCalledValue();
    if( auto CE = llvm::dyn_cast<llvm::ConstantExpr>(val) ) {
      if(CE->isCast()) {
        if(CE->getOperand(0)->getName() == "assume" ||
                  CE->getOperand(0)->getName() == "_Z6assumeb") {
          return true;
        }
      }
    }
  }
  return false;
}

void bmc_pass::assert_to_spec(unsigned bidx, const llvm::CallInst* call) {
  assert( call );

  expr assert_path_bit = bmc_ds_ptr->get_path_bit(bidx);
  expr assert_term = bmc_ds_ptr->m.get_term( call->getArgOperand(0) );
  spec_reason_t reason = spec_reason_t::ASSERT;
  src_loc loc = getLoc( call );
  if(assert_term.is_bool()) {
    bmc_ds_ptr->add_spec( !assert_path_bit || assert_term, reason, loc);
  } else {
    bmc_ds_ptr->add_spec( !assert_path_bit || (assert_term != 0), reason, loc);
  }
}

bool bmc_pass::is_assert(const llvm::CallInst* call ) {
  assert( call );

  llvm::Function* fp = call->getCalledFunction();
  if( fp != NULL &&
      (fp->getName() == "_Z6assertb" || fp->getName() == "assert" ) ) {
    return true;
  } else if (fp == NULL) {
    const llvm::Value * val = call->getCalledValue();
    if( auto CE = llvm::dyn_cast<llvm::ConstantExpr>(val) ) {
      if(CE->isCast()) {
        if(CE->getOperand(0)->getName() == "assert" ||
           CE->getOperand(0)->getName() == "_Z6assertb") {
          return true;
        }
      }
    }
  }
  return false;
}

void bmc_pass::translateNondet(unsigned bidx, const llvm::CallInst* call) {
  assert(call);

  llvm::Function* fp = call->getCalledFunction();
  if(fp!=NULL &&
     (fp->getReturnType()->isIntegerTy(32) ||
      fp->getReturnType()->isIntegerTy(64))) {
    expr nondet_int = get_fresh_int( solver_ctx, "nondet");
    bmc_ds_ptr->m.insert_term_map( call, bidx, nondet_int );
  } else if (fp!=NULL &&
             (fp->getReturnType()->isIntegerTy(1) ||
              fp->getReturnType()->isIntegerTy(8))) {
    expr nondet_bit = get_fresh_bool( solver_ctx, "nondet");
    bmc_ds_ptr->m.insert_term_map( call, bidx, nondet_bit );
  } else {
    llvm_bmc_error("bmc", "Unsupported nondet type!");
  }
}

void bmc_pass::translateDebugInfo( unsigned bidx,
                                   const llvm::DbgInfoIntrinsic* dbg ) {
  assert( dbg );

  if( auto dbg_val = llvm::dyn_cast<llvm::DbgValueInst>(dbg) ) {
    std::string name = getVarName( dbg_val );
    bmc_ds_ptr->locals.insert( name );
    auto val = dbg_val->getValue();
    if( val ) {
      // map debug val instruction to its value
      if( seen_dbg_val.find( val ) == seen_dbg_val.end() ) {
        bmc_ds_ptr->dbg_name_map[dbg_val] = name;
        bmc_ds_ptr->m.insert_term_map( dbg_val,  bidx, bmc_ds_ptr->m.get_term( val ) );
        seen_dbg_val.insert( val );
      }
    }else{
      llvm_bmc_warning( "bmc", " NULL debug value found!!");
    }
  }else if( auto dbg_var = llvm::dyn_cast<llvm::DbgDeclareInst>(dbg) ) {
    std::string name = getVarName( dbg_var );
    bmc_ds_ptr->locals.insert( name );
    // auto val = dbg_var->getAddress();
    // Ignore debug instructions
  }else{ assert(false); } // not possible
}

void bmc_pass::translateIntrinsicInst( unsigned bidx,
                                       const llvm::IntrinsicInst* I ) {
  assert( I );

  if( auto dbg = llvm::dyn_cast<llvm::DbgInfoIntrinsic>(I) ) {
    translateDebugInfo( bidx, dbg );
  }else if( I->getIntrinsicID() == llvm::Intrinsic::stacksave ) {
    // do nothing
  }else if( I->getIntrinsicID() == llvm::Intrinsic::stackrestore ) {
    // do nothing
  }else if( I->getIntrinsicID() == llvm::Intrinsic::lifetime_start ) {
    // do nothing
  }else if( I->getIntrinsicID() == llvm::Intrinsic::lifetime_end ) {
    // do nothing
  }else{
    BMC_UNSUPPORTED_INSTRUCTIONS( ConstrainedFPIntrinsic, I);
#ifndef LLVM_SVN
    BMC_UNSUPPORTED_INSTRUCTIONS( AtomicMemCpyInst, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( AtomicMemMoveInst, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( AtomicMemSetInst, I);
#endif
    BMC_UNSUPPORTED_INSTRUCTIONS( MemIntrinsic, I);
    // sub class
    // BMC_UNSUPPORTED_INSTRUCTIONS( MemSetInst, I);
    // BMC_UNSUPPORTED_INSTRUCTIONS( MemTransferInst, I);
    // BMC_UNSUPPORTED_INSTRUCTIONS( MemCpyInst, I);
    // BMC_UNSUPPORTED_INSTRUCTIONS( MemMoveInst, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( VAStartInst, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( VAEndInst, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( VACopyInst, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( InstrProfIncrementInst, I);
    // BMC_UNSUPPORTED_INSTRUCTIONS( InstrProfIncrementInstStep, I);
    BMC_UNSUPPORTED_INSTRUCTIONS( InstrProfValueProfileInst, I);
    I->print( llvm::outs() );
    llvm_bmc_error("bmc", "Unsupported intrinsics!");
  }
}

void bmc_pass::translateCallInst( unsigned bidx,
                                  const llvm::CallInst* call ) {
  assert(call);

  llvm::Function* fp = call->getCalledFunction();

  if( auto dbg_val = llvm::dyn_cast<llvm::IntrinsicInst>(call) ) {
    translateIntrinsicInst( bidx, dbg_val );
  } else if( fp != NULL && fp->getName().startswith("__VERIFIER") ) {
    if( fp->getName().startswith("__VERIFIER_nondet_") ) {
      translateNondet( bidx, call);
    } else if ( fp->getName().startswith("__VERIFIER_error") ) {
      //VERIFIER_error always has an unreachable instruction which is handled
    } else if ( fp->getName().startswith("__VERIFIER_assert") ) {
      assert_to_spec( bidx, call);
    } else if ( fp->getName().startswith("__VERIFIER_assume") ) {
      assume_to_bmc( bidx, call);
    } else { //only error and nondets handled
      llvm_bmc_error("bmc",
          "Only __VERIFIER_[assert,error,nondet_TY] functions are handled!");
    }
  } else if(is_assert(call)) {
    assert_to_spec(bidx, call);
  } else if (is_assume(call)) {
    assume_to_bmc( bidx, call);
  } else {
    llvm_bmc_error("bmc", "function call is not recognized !!");
  }
}

//--------------------------------------
// translate unary instructions

inline bool ok_cast( llvm::Type* n_ty, llvm::Type* o_ty,
                     unsigned n_w, unsigned o_w ) {
  unsigned new_width = n_ty->getIntegerBitWidth();
  unsigned old_width = o_ty->getIntegerBitWidth();
  return n_w == new_width && o_w == old_width;
}

// TODO : Try to remove warnings for empty bodies
void bmc_pass::translateCastInst( unsigned bidx,
                                  const llvm::CastInst* cast ) {
  assert( cast );

  auto v = cast->getOperand(0);
  auto c_ty = cast->getType();
  assert( v );
  auto v_ty = v->getType();
  if( llvm::isa<llvm::TruncInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if( ok_cast( c_ty, v_ty, 1, 8 ) ) {
    // if( v_ty->isIntegerTy(8) && c_ty->isIntegerTy(1) ) {
      if( o.bit_precise ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v.extract(0,0) );
      }else{
        expr ex_v = bmc_ds_ptr->m.get_term(v);
        // need to say that the integer was less than 1;
        bmc_ds_ptr->add_spec( ex_v <= 1 && ex_v >= 0,
                              spec_reason_t::OUT_OF_RANGE );
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      }
    }else{
      llvm_bmc_error("bmc", "unexpected sized TruncInst found!");
    }
  }else if( llvm::isa<llvm::ZExtInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if( o.bit_precise ) {
      unsigned new_size = c_ty->getIntegerBitWidth();
      bmc_ds_ptr->m.insert_term_map( cast, bidx, zext( ex_v, new_size ) );
    }else{
      // Current policy allow extensions [ 1 -> 8, 1->32, 32->64]
      if( ok_cast( c_ty, v_ty, 8, 1 ) || ok_cast( c_ty, v_ty, 32, 1 ) ||
          ok_cast( c_ty, v_ty, 64, 32 ) ) {
      // if( (v_ty->isIntegerTy(1) && c_ty->isIntegerTy(8)) ||
      //     (v_ty->isIntegerTy(1) && c_ty->isIntegerTy(32)) ||
      //     (v_ty->isIntegerTy(32) && c_ty->isIntegerTy(64)) ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      } else {
        llvm_bmc_error("bmc", "zero extn instruction of unsupported size");
      }
    }
  }else if( llvm::isa<llvm::SExtInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if( o.bit_precise ) {
      unsigned new_size = c_ty->getIntegerBitWidth();
      bmc_ds_ptr->m.insert_term_map( cast, bidx, sext( ex_v, new_size ) );
    }else{
      // Current policy allow extensions [ 1 -> 8, 1->32, 32->64]
      if( ok_cast( c_ty, v_ty, 8, 1 ) || ok_cast( c_ty, v_ty, 32, 1 ) ||
          ok_cast( c_ty, v_ty, 64, 32 ) ) {
      // if( (v_ty->isIntegerTy(1) && c_ty->isIntegerTy(8)) ||
      //     (v_ty->isIntegerTy(1) && c_ty->isIntegerTy(32)) ||
      //     (v_ty->isIntegerTy(32) && c_ty->isIntegerTy(64)) ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      } else {
        llvm_bmc_error("bmc", "sign extn instruction of unsupported size");
      }
    }
  }else if( auto bitCast = llvm::dyn_cast<llvm::BitCastInst>(cast) ) {
      
  }else{
    BMC_UNSUPPORTED_INSTRUCTIONS( FPTruncInst,       cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( FPExtInst,         cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( UIToFPInst,        cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( SIToFPInst,        cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( FPToUIInst,        cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( FPToSIInst,        cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( IntToPtrInst,      cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( PtrToIntInst,      cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( AddrSpaceCastInst, cast);
    LLVM_DUMP( cast );
    llvm_bmc_error("bmc", "cast instruction is not recognized !!");
  }
}

void bmc_pass::translateAllocaInst( const llvm::AllocaInst* alloca ) {
  assert( alloca );
  auto typ = alloca->getAllocatedType();
  if( llvm::isa<const llvm::IntegerType>(typ) ) {          
    auto val = alloca->getArraySize();
    if( auto constInt = llvm::dyn_cast<const llvm::ConstantInt>(val) ) {          
        int constIntValue = (int)constInt->getSExtValue();
        expr const_expr = get_expr_const(solver_ctx,constIntValue);
        array_lengths.push_back(const_expr);
    }
    else {
      auto val = alloca->getOperand(0);
      auto val_expr = bmc_ds_ptr->m.get_term( val );
      array_lengths.push_back(val_expr);
    }
  }
  else if( llvm::isa<const llvm::ArrayType>(typ) ) {
    int siz = (int)typ->getArrayNumElements();
    expr const_expr = get_expr_const(solver_ctx,siz);
    array_lengths.push_back(const_expr);
  }
  else {

  }
}

// TODO : Add src_loc for instructions in add_spec 
void bmc_pass::loadFromArrayHelper( unsigned bidx,
                          const llvm::LoadInst* load,
                          expr idx_expr ) {
  auto arr_rd = bmc_ds_ptr->array_read( bidx, load, idx_expr);
  if( o.include_out_of_bound_specs ) {
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    bmc_ds_ptr->add_spec( !path_bit || arr_rd.size_bound_guard, spec_reason_t::OUT_OF_BOUND );
  }
  bmc_ds_ptr->m.insert_term_map(load, bidx, arr_rd.return_val );
}

void bmc_pass::translateLoadInst( unsigned bidx,
                                  const llvm::LoadInst* load ) {
  assert( load );

  auto addr = load->getOperand(0);
  if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(addr) ) {
    // TODO : Add more general support to parse gep instruction when supporting 
    // objects (struct's) and multidimensional arrays
    llvm::Value * idx = NULL;
    // added cases to distinguish between constant or dynamic sized 1d arrays 
    if(gep->getNumOperands() == 2) idx = gep->getOperand(1);
    else if(gep->getNumOperands() == 3) idx = gep->getOperand(2);
    auto idx_expr = bmc_ds_ptr->m.get_term( idx );
    loadFromArrayHelper(bidx, load, idx_expr);   
  } else if(llvm::isa<const llvm::GlobalVariable>(addr)) {
    //    llvm_bmc_error("bmc", "non array global write/read not supported!");
    auto glb_rd = bmc_ds_ptr->m_model.read( bidx, load);
    bmc_ds_ptr->m.insert_term_map( load, bidx, glb_rd );
  } else if( auto alloc = llvm::dyn_cast<const llvm::AllocaInst>(addr) ) {
    // To handle a[0] when a is dynamic sized array
    expr idx_expr = get_expr_const(solver_ctx,0);
    loadFromArrayHelper(bidx, load, idx_expr);
  } else {
    LLVM_DUMP( load );
    llvm_bmc_error("bmc", "Only array and global write/read supported!");
  }
}

void bmc_pass::translateUnaryInst( unsigned bidx,
                                   const llvm::UnaryInstruction* I ) {
  assert( I );

  if( auto cast = llvm::dyn_cast<llvm::CastInst>(I) ) {
    translateCastInst( bidx, cast );
  } else if( auto alloca = llvm::dyn_cast<llvm::AllocaInst>(I) ) {
    translateAllocaInst(alloca);
  } else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
    translateLoadInst(bidx, load);
  } else {
    BMC_UNSUPPORTED_INSTRUCTIONS( VAArgInst,        I );
    BMC_UNSUPPORTED_INSTRUCTIONS( ExtractValueInst, I );
    LLVM_DUMP(I);
    llvm_bmc_error("bmc", "unsupported unary instruction!!");
  }
}

//--------------------------------------

void bmc_pass::storeToArrayHelper( unsigned bidx,
                         const llvm::StoreInst* store,
                         const llvm::Value* val,
                         expr idx_expr ) {
  auto val_expr = bmc_ds_ptr->m.get_term( val );
  auto arr_wrt = bmc_ds_ptr->array_write(bidx, store, idx_expr, val_expr);
  bmc_ds_ptr->bmc_vec.push_back( arr_wrt.updated_expr );
  if( o.include_out_of_bound_specs ) {
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    bmc_ds_ptr->add_spec( !path_bit || arr_wrt.size_bound_guard, spec_reason_t::OUT_OF_BOUND );
  }
  bmc_ds_ptr->m.insert_term_map( store, bidx, arr_wrt.new_name );
}

void bmc_pass::translateStoreInst( unsigned bidx,
                                   const llvm::StoreInst* store ) {
  assert( store );

  auto val = store->getOperand(0);
  auto addr = store->getOperand(1);
  if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(addr) ) {
    llvm::Value * idx = NULL;
    if(gep->getNumOperands() == 2) idx = gep->getOperand(1);
    else if(gep->getNumOperands() == 3) idx = gep->getOperand(2); 
    auto idx_expr = bmc_ds_ptr->m.get_term( idx );
    storeToArrayHelper(bidx, store, val, idx_expr);  
  } else if(llvm::isa<const llvm::GlobalVariable>(addr)) {
    //    llvm_bmc_error("bmc", "non array global write/read not supported!");
    auto val_expr = bmc_ds_ptr->m.get_term( val );
    auto glb_wrt = bmc_ds_ptr->m_model.write(bidx, store, val_expr);
    bmc_ds_ptr->bmc_vec.push_back( glb_wrt.first );
    bmc_ds_ptr->m.insert_term_map( store, bidx, glb_wrt.second );
  } else if( auto alloc = llvm::dyn_cast<const llvm::AllocaInst>(addr) ) {
    // To handle a[0] when a is dynamic sized array
    expr idx_expr = get_expr_const(solver_ctx,0);
    storeToArrayHelper(bidx, store, val, idx_expr);
  } else if( auto cons = llvm::dyn_cast<llvm::Constant>(addr) ) {
    llvm_bmc_error("bmc", "constant access to the memory!");
  }else {
    LLVM_DUMP( store );
    llvm_bmc_error("bmc", "Only local array and global write/read supported!");
  }
}

void bmc_pass::translateGetElementPtrInst(const llvm::GetElementPtrInst* gep) {
  assert( gep );
  // GEP processed inside load and store inst
  // as gep is always followed these inst
}

//--------------------------------------
// Terminator instructions

void bmc_pass::translateBranch( unsigned bidx,
                                const llvm::BranchInst* br ) {
  assert( br );

  auto& exit_bits = bmc_ds_ptr->get_exit_bits( bidx );
  if( !br->isUnconditional() ) {
    expr cond = bmc_ds_ptr->m.get_term( br->getCondition() );
    bmc_ds_ptr->bmc_vec.push_back( cond == exit_bits[0] );
  }else{
    // for unconditional branch, there is no need of constraints
    // bmc_ds_ptr->bmc_vec.push_back( exit_bit );
  }
}

void bmc_pass::translateRetInst(const llvm::ReturnInst *ret ) {
  assert( ret );

  llvm::Value* v = ret->getReturnValue();
  if( v ) {
    expr ret_term = bmc_ds_ptr->m.get_term( v );
    expr ret_val = get_fresh_const(solver_ctx, ret_term.get_sort(), "ret_val");
    bmc_ds_ptr->bmc_vec.push_back( ret_val == ret_term );
  } else {
    //todo : handle all cases
    //llvm_bmc_error("bmc", "return instruction without a return value!");
  }
}

void bmc_pass::translateSwitchInst( unsigned bidx,
                                    const llvm::SwitchInst *swch ) {
  assert( swch );

  auto& exit_bits = bmc_ds_ptr->get_exit_bits( bidx );
  auto num_succs = swch->getNumSuccessors();
  expr cond_val = bmc_ds_ptr->m.get_term( swch->getCondition() );
  std::vector<expr> neg_disj;
  for( unsigned i = 1; i < num_succs; i++ ) {
    auto val = bmc_ds_ptr->m.get_term( swch->getOperand(2*i) );
    auto cs = (val == cond_val);
    bmc_ds_ptr->bmc_vec.push_back( cs == exit_bits[i] );
    neg_disj.push_back( !cs );
  }
  expr exit_cond = ( _and( neg_disj, solver_ctx ) == exit_bits[0] );
  bmc_ds_ptr->bmc_vec.push_back( exit_cond );
}

void bmc_pass::translateUnreachableInst( unsigned bidx,
                                         const llvm::UnreachableInst *I) {
  expr unreach_path_bit = bmc_ds_ptr->get_path_bit(bidx);
  bmc_ds_ptr->add_spec(!unreach_path_bit);
}

void bmc_pass::translateTerminatorInst( unsigned bidx,
                                        const llvm::TerminatorInst *I ) {
  assert( I );

  if( auto br = llvm::dyn_cast<llvm::BranchInst>(I) ) {
    translateBranch( bidx, br );
  } else if( auto ret = llvm::dyn_cast<llvm::ReturnInst>(I) ) {
    translateRetInst( ret );
  } else if( auto swch = llvm::dyn_cast<llvm::SwitchInst>(I) ) {
    translateSwitchInst(bidx, swch);
  } else if( auto unreach = llvm::dyn_cast<llvm::UnreachableInst>(I) ) {
    translateUnreachableInst(bidx, unreach);
  } else {
    BMC_UNSUPPORTED_INSTRUCTIONS( IndirectBrInst,    I );
    BMC_UNSUPPORTED_INSTRUCTIONS( InvokeInst,        I );
    BMC_UNSUPPORTED_INSTRUCTIONS( ResumeInst,        I );
    BMC_UNSUPPORTED_INSTRUCTIONS( CatchSwitchInst,   I );
    BMC_UNSUPPORTED_INSTRUCTIONS( CatchReturnInst,   I );
    BMC_UNSUPPORTED_INSTRUCTIONS( CleanupReturnInst, I );
    llvm_bmc_error( "bmc", "unsupported terminator instruction!");
  }
}

void bmc_pass::translateCommentProperty( unsigned bidx, const bb* b ) {
  assert( b );

  if( bmc_obj.bb_comment_map.find(b) ==  bmc_obj.bb_comment_map.end() )
    return;
  auto& start_comments = bmc_obj.bb_comment_map.at(b).start_comments;
  auto& end_comments = bmc_obj.bb_comment_map.at(b).end_comments;
  if( start_comments.size() > 0 )
    llvm_bmc_error( "parse comment::", "comment at the start not supported");
  for( comment cmt : end_comments) {
    bool at_start = false;
    assert( bmc_ds_ptr->bb_vec[0] == bmc_ds_ptr->eb );
    rev_name_map& orig_n_map = bmc_obj.revEndLocalNameMap[bmc_ds_ptr->eb];
    rev_name_map& n_map = at_start ? bmc_obj.revStartLocalNameMap[b]
    : bmc_obj.revEndLocalNameMap[b];
    std::string type_decls;
    for( auto& name_pair : n_map ) {
      auto name = name_pair.first;
      auto* v = name_pair.second;
      std::string ty_str;
      if( auto glb = llvm::dyn_cast<llvm::GlobalVariable>(v) ) {
        llvm::Type* ty = glb->getType();
        if( auto pty = llvm::dyn_cast<llvm::PointerType>(ty) ) {
          auto el_ty = pty->getElementType();
          sort z_sort = llvm_to_sort( o, el_ty);
          ty_str = to_string(z_sort);
        }else{ llvm_bmc_error( "parse comment::", "unrecognized type!"); }
      }else{
        llvm::Type* ty = v->getType();
        if( auto pty = llvm::dyn_cast<llvm::PointerType>(ty) ) {
          auto el_ty = pty->getElementType();
          sort z_sort = llvm_to_sort( o, el_ty);
          ty_str = to_string( solver_ctx.array_sort( solver_ctx.int_sort(), z_sort ) );
        }else{
          sort z_sort = llvm_to_sort( o, ty);
          ty_str = to_string(z_sort);
        }
      }
      type_decls += "(declare-fun " + name + " () " + ty_str+")\n";
      type_decls += "(declare-fun __pre_" + name + " () " + ty_str +")\n";
    }
    for( auto txt : cmt.texts) {
      auto parse_str = type_decls + txt;
      expr e = smt2_parse_string( solver_ctx, parse_str.c_str() );
      // expr_vector es = solver_ctx.parse_string( parse_str.c_str() );
      // assert( es.size() == 1 );
      // expr e = es[0];
      expr_set vars;
      get_variables( e, vars );
      std::vector<expr> prog_names;
      std::vector<expr> ssa_names;
      for( expr v : vars ) {
        prog_names.push_back(v);
        std::string name = to_string(v);
        if( n_map.find(name) != n_map.end() ) {
          const llvm::Value* v = n_map[name];
          ssa_names.push_back( bmc_ds_ptr->get_expr( v ) );
        }else{
          std::string  prefix = name.substr( 0,6 );
          name = name.substr(6);
          if( prefix == "__pre_" && orig_n_map.find(name) != orig_n_map.end()){
            const llvm::Value* v = orig_n_map[name];
            ssa_names.push_back( bmc_ds_ptr->get_expr( v ) );
          }else{
            llvm_bmc_error( "parse comment::",
                            "proerty comment refers to unknown " << name );
          }
        }
      }
      expr prop = substitute( e, prog_names, ssa_names);
      bmc_ds_ptr->add_spec( prop, spec_reason_t::COMMENT, cmt.start );
    }
  }
}

void bmc_pass::translateBlock( unsigned bidx, const bb* b ) {
  assert( b );

  for( const llvm::Instruction& Iobj : b->getInstList() ) {
    const llvm::Instruction* I = &(Iobj);
    if(auto bop = llvm::dyn_cast<llvm::BinaryOperator>(I) ) {
      translateBinOp( bidx, bop );
    }else if( auto phi = llvm::dyn_cast<llvm::PHINode>(I) ) {
      translatePhiNode( bidx, phi );
    } else if( auto cmp = llvm::dyn_cast<llvm::CmpInst>(I) ) {
      translateCmpInst( bidx, cmp );
    } else if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
      translateCallInst(bidx, call);
    } else if( auto unary = llvm::dyn_cast<llvm::UnaryInstruction>(I) ) {
      translateUnaryInst( bidx, unary );
    } else if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
      translateStoreInst( bidx, store );
    } else if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(I) ) {
      translateGetElementPtrInst( gep );
    } else if( auto terminate = llvm::dyn_cast<llvm::TerminatorInst>(I) ) {
      translateTerminatorInst( bidx, terminate );
    } else {
      BMC_UNSUPPORTED_INSTRUCTIONS( FuncletPadInst,     I);
      // todo: cases for funclet CleanupPadInst, CatchPadInst
      BMC_UNSUPPORTED_INSTRUCTIONS( BinaryOperator,     I);
      BMC_UNSUPPORTED_INSTRUCTIONS( FenceInst,          I);
      BMC_UNSUPPORTED_INSTRUCTIONS( AtomicCmpXchgInst,  I);
      BMC_UNSUPPORTED_INSTRUCTIONS( AtomicRMWInst,      I);
      BMC_UNSUPPORTED_INSTRUCTIONS( SelectInst,         I);
      BMC_UNSUPPORTED_INSTRUCTIONS( ExtractElementInst, I);
      BMC_UNSUPPORTED_INSTRUCTIONS( InsertElementInst,  I);
      BMC_UNSUPPORTED_INSTRUCTIONS( ShuffleVectorInst,  I);
      BMC_UNSUPPORTED_INSTRUCTIONS( InsertValueInst,    I);
      BMC_UNSUPPORTED_INSTRUCTIONS( LandingPadInst,     I);
      LLVM_DUMP( I );
      llvm_bmc_error("bmc", "unsupported instruction");
    }
  }
  translateCommentProperty( bidx, b);
}

void bmc_pass::init_path_exit_bit( bb_vec_t &bb_vec
                                   //, const bb* eb
                                   ) {
  unsigned bidx = 0;
  for( const bb* src : bb_vec ) {
    if( bidx < bmc_ds_ptr->processed_bidx ) { bidx++; continue;}
    unsigned num_succs = src->getTerminator()->getNumSuccessors();
    std::vector<expr> exit_bits;
    if( num_succs == 0 ) {
      // do nothing; map to empty vector
    }else if( num_succs == 1 ) {
      // always the successor taken
      exit_bits.push_back( solver_ctx.bool_val(true) );
    }else if( num_succs == 2 ) {
      expr e_b = get_fresh_bool(solver_ctx, "exit");
      exit_bits.push_back( e_b );
      exit_bits.push_back( !e_b );
      // bmc_ds_ptr->quant_elim_vars.push_back(e_b);
    }else{
      std::vector<expr> v;
      for( unsigned i = 0; i < num_succs; i++ ) {
        auto e_b = get_fresh_bool(solver_ctx, "exit_"+std::to_string(i) );
        exit_bits.push_back( e_b );
        v.push_back( e_b );
        // bmc_ds_ptr->quant_elim_vars.push_back(e_b);
      }
      // add constraints that at least one is true;
      // Note that at most one constraint is not added
      bmc_ds_ptr->bmc_vec.push_back( _or(v, solver_ctx) );
    }

    bmc_ds_ptr->set_exit_bits( bidx, exit_bits);
    expr p_b = get_fresh_bool(solver_ctx, "path");
    bmc_ds_ptr->set_path_bit( bidx, p_b );
    // bmc_ds_ptr->quant_elim_vars.push_back(p_b);
    bidx++;
  }
  // Initialize the path bit of the entry block to true
  // TODO Map to the caller when interprocedural support is added
  bmc_ds_ptr->set_path_bit( 0, solver_ctx.bool_val(true) );
  // todo: also needed to be guarded against processed bit
  for( auto it :  bmc_ds_ptr->block_to_path_bit ) {
    auto e = it.second;
    if( e )
      bmc_ds_ptr->quant_elim_vars.push_back( e );
  }
  for( auto it :  bmc_ds_ptr->block_to_exit_bits ) {
    for( auto e : it.second ) {
      if( !isNot( e ) && !is_true(e) )
        bmc_ds_ptr->quant_elim_vars.push_back( e );
    }
  }
  //std::cout << to_string( bmc_ds_ptr->quant_elim_vars );
}

expr bmc_pass::extend_path( unsigned bidx, unsigned pre_bidx ) {
  auto b = bmc_ds_ptr->bb_vec[bidx];
  unsigned idx_succ = getSuccessorIndex( bmc_ds_ptr->bb_vec[pre_bidx], b );
  return bmc_ds_ptr->get_exit_branch_path( pre_bidx, idx_succ );
}

void bmc_pass::do_bmc() {
  assert(bmc_ds_ptr);

  // init_array_model( bmc_ds_ptr->bb_vec, bmc_ds_ptr->eb );
  init_path_exit_bit( bmc_ds_ptr->bb_vec );
  unsigned bidx = 0;
  for( const bb* src : bmc_ds_ptr->bb_vec ) {
    // support for stacked call. blocks before start_bidx have been processed
    if( bidx < bmc_ds_ptr->processed_bidx) { bidx++; continue; }
    std::vector<expr> incoming_paths;
    std::vector<const bb*> prevs;
    for( auto& pre_bidx : bmc_ds_ptr->pred_idxs[bidx] ) {
      assert( pre_bidx < bidx );
      expr p = extend_path( bidx, pre_bidx );
      incoming_paths.push_back( p );
    }
    expr path_bit = bmc_ds_ptr->get_path_bit( bidx );
    if( bidx == 0 ) {
      bmc_ds_ptr->bmc_vec.push_back( path_bit );
    }else{
      bmc_ds_ptr->bmc_vec.push_back( implies( path_bit, _or( incoming_paths, solver_ctx) ) );
      bmc_ds_ptr->bmc_vec.push_back( bmc_ds_ptr->join_array_state( incoming_paths, bmc_ds_ptr->pred_idxs[bidx], bidx ) );
      bmc_ds_ptr->bmc_vec.push_back( bmc_ds_ptr->m_model.join_state( incoming_paths, bmc_ds_ptr->pred_idxs[bidx], bidx ) );
    }

    translateBlock( bidx, src );
    bidx++;
    if( o.verbosity > 4 )
      print_bb_exprs(src);
    if( o.verbosity > 3 )
      print_bb_vecs();
  }
  bmc_ds_ptr->processed_bidx = bmc_ds_ptr->bb_vec.size();

  // Insert global variable definitions
  bmc_ds_ptr->add_bmc_formulas(  bmc_obj.glb_bmc_vec );

  if( o.verbosity > 2 )
    bmc_ds_ptr->print_formulas();

}

void bmc_pass::print_bb_exprs(const bb* src) {
  assert(src);
  std::cout << "==============================================\n";
  src->print( llvm::outs() );
  std::cout << "==============================================\n";
  for( const llvm::Instruction& Iobj : src->getInstList() ) {
    const llvm::Instruction* I = &(Iobj);
    unsigned copy_count = 0;
    auto val = bmc_ds_ptr->m.read_term( I, copy_count );
    if( val ) {
      I->print( llvm::outs() );
      std::cout << "~~~~~~>" << val << "\n";
    }
  }
  std::cout << "==============================================\n";
}

void bmc_pass::print_bb_vecs() {
  std::cout << "----------------------------------------------\n";
  static unsigned last_len = 0;
  static unsigned spec_last_len = 0;
  bmc_ds_ptr->print_formulas( last_len, spec_last_len );
  last_len = bmc_ds_ptr->bmc_vec.size();
  spec_last_len = bmc_ds_ptr->spec_vec.size();
  std::cout << "----------------------------------------------\n";
}

void bmc_pass::populateArrAccMap(llvm::Function* f) {
  assert(f);
  int arrCntr = 0;
  ary_to_int.clear();
  array_lengths.clear();
  for( auto bbit = f->begin(), end = f->end(); bbit != end; bbit++ ) {
    auto bb = &(*bbit);
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      auto I = &(*it);
      if( llvm::isa<const llvm::AllocaInst>(I) ) {
        ary_to_int[I] = arrCntr++;
      } else {} // no errors needed!!
    }
  }
}



