#include "bmc_pass.h"
#include "witness.h"
#include "lib/utils/solver_utils.h"
// TODO : remove reference to heap model and access of public class variables
#include "include/array_model.h"
#include "include/memory_event.h"
// #include "include/collect_globals.h"

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
    auto a = &(*ab);
    auto ty = a->getType();

    if( !ty->isPointerTy() ) { // input pointers are viewed as arrays
      bmc_ds_ptr->m.get_term( a );
    }else{ // array case

      // Nothing is needs to be done here
      // In array modeling module array lengths are already calculated.

    //std::string type_str;
    //llvm::raw_string_ostream rso(type_str);
    //ty->print(rso);
    //std::cout<<"Type is " << rso.str() << "\n";
    
    // auto T = llvm::dyn_cast<llvm::PointerType>(ty)->getElementType();
    // int siz = llvm::dyn_cast<llvm::ArrayType>(T)->getArrayNumElements();
    // //auto siz_bv = solver_ctx.bv_val(siz, 64);
    // expr const_expr = get_expr_const(solver_ctx, siz);
    // array_lengths.push_back(const_expr);
    }
  }
}

expr switch_sort( options& o, expr& b, sort& s) {
  if( o.bit_precise ) {
    return switch_bv_sort( b, s);
  }
  return switch_int_sort( b, s);
}

void bmc_pass::translateBinOp( unsigned bidx, const llvm::BinaryOperator* bop){
  assert( bop );
  auto op0 = bop->getOperand( 0 );
  auto op1 = bop->getOperand( 1 );
  expr a = bmc_ds_ptr->m.get_term( op0 );
  expr b = bmc_ds_ptr->m.get_term( op1 );

 // bop->print( llvm::outs() ); std::cout << "\n";

// a and b may have different types, due to llvm does not record clearly
  // if something is int. Our translation may incorrectly identify
  // sort of some constant number. The following code corrects the mismatch
  if( !matched_sort( a, b ) ) {
    if( is_const( a ) ) {
      auto s = b.get_sort();
      a = switch_sort( o, a, s );
    }else if( is_const( b ) ) {
      auto s = a.get_sort();
      b = switch_sort( o, b, s );
    }
  }
   
  unsigned op = bop->getOpcode();
  expr result = solver_ctx.bool_val(true);
  switch( op ) {
    // Fixed point operations
  case llvm::Instruction::Add : bmc_ds_ptr->m.insert_term_map( bop, bidx, a+b     ); break;
  case llvm::Instruction::Sub : bmc_ds_ptr->m.insert_term_map( bop, bidx, a-b     ); break;
  case llvm::Instruction::Mul : bmc_ds_ptr->m.insert_term_map( bop, bidx, a*b     ); break;
  case llvm::Instruction::And : bmc_ds_ptr->m.insert_term_map( bop, bidx, _bvand(a,b)  ); break;
  case llvm::Instruction::Or  : bmc_ds_ptr->m.insert_term_map( bop, bidx,_bvor(a,b) ); break;
  case llvm::Instruction::Xor : bmc_ds_ptr->m.insert_term_map( bop, bidx,_xor(a,b)); break;
  case llvm::Instruction::SDiv: bmc_ds_ptr->m.insert_term_map( bop, bidx, a/b     ); break;
  case llvm::Instruction::UDiv: bmc_ds_ptr->m.insert_term_map( bop, bidx, a/b     ); break;
  case llvm::Instruction::SRem: bmc_ds_ptr->m.insert_term_map( bop, bidx, rem(a,b)); break;
  case llvm::Instruction::URem: bmc_ds_ptr->m.insert_term_map( bop, bidx, rem(a,b)); break;
  case llvm::Instruction::LShr: bmc_ds_ptr->m.insert_term_map( bop, bidx, LogShR(a,b)); break;
  case llvm::Instruction::Shl: bmc_ds_ptr->m.insert_term_map( bop, bidx, bv_shl(a,b)); break;
    // Floating point operations
    // Abstraction choices
    // 1. treat them as unknown non-det functions
    // 2. treat them as unknown functions <<---
    // 3. tream them as functions over reals
    //       x \in [a,b]  a and b are real numbers
    //       y \in [c,d]
    //       x*y  \in [a,b]*[c,d] -> [min(a*c,b*c,a*d,b*d),min(a*c,b*c,a*d,b*d)]
    //  h = initial_h(float) +step_size(float)*steps(fixedpoint)
    //    interaction with boolean
  
  case llvm::Instruction::FAdd: {
	if( o.abstract_floats ) {
		result = bmc_ds_ptr->m_model.get_fresh_name(a.get_sort(), "fp_abst");
		bmc_ds_ptr->m.insert_term_map( bop, bidx, result ); break;
		}
	else {bmc_ds_ptr->m.insert_term_map( bop, bidx, a+b     ); break; }
	}
  case llvm::Instruction::FSub: {
	if( o.abstract_floats ) {
		result = bmc_ds_ptr->m_model.get_fresh_name(a.get_sort(), "fp_abst");
		bmc_ds_ptr->m.insert_term_map( bop, bidx, result ); break;
		}
	else {bmc_ds_ptr->m.insert_term_map( bop, bidx, a-b     ); break; }
	}
  case llvm::Instruction::FMul: {
	if( o.abstract_floats ) {
		result = bmc_ds_ptr->m_model.get_fresh_name(a.get_sort(), "fp_abst");
		bmc_ds_ptr->m.insert_term_map( bop, bidx, result ); break;
		}
	else {bmc_ds_ptr->m.insert_term_map( bop, bidx, a*b     ); break; }
	}
  case llvm::Instruction::FDiv: {
	if( o.abstract_floats ) {
		result = bmc_ds_ptr->m_model.get_fresh_name(a.get_sort(), "fp_abst");
		bmc_ds_ptr->m.insert_term_map( bop, bidx, result ); break;
		}
	else {bmc_ds_ptr->m.insert_term_map( bop, bidx, a/b     ); break; }
	}
  case llvm::Instruction::FRem: assert(false); //todo : implement FRem
  default: {
    const char* opName = bop->getOpcodeName();
    llvm_bmc_error("bmc", "unsupported instruction \"" << opName << "\" occurred!!");
   }
  }

//  std::vector <std::string> bop_names;
//  std::vector <expr> bop_declarations;
//  std::string name1 = op0 -> getName();
//  std::string name2 = op1 -> getName();
//  auto s1 = a.get_sort();
//  auto s2 = b.get_sort();

  if( o.include_overflow_specs ) {
    expr v = bmc_ds_ptr->m.get_term(bop);
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    if( o.bit_precise ) {
      // check in z3 how to check for overflow in bitvectors.
      // if 3 bits
      // -8 =< a+b < 7
      //
//      auto s1 = a.get_sort();
//      auto s2 = b.get_sort();
  expr overflow_cons1 = solver_ctx.bool_val(true);
  expr overflow_cons2 = solver_ctx.bool_val(true);
  expr underflow_cons1 = solver_ctx.bool_val(true);
  expr underflow_cons2 = solver_ctx.bool_val(true);
	switch( op ) {
  case llvm::Instruction::Add :  { overflow_cons1 = bvadd_no_overflow(a,b,false); 
                                  overflow_cons2 = bvadd_no_overflow(a,b,true); 
				  underflow_cons2 = bvadd_no_underflow(a,b); 
				  bmc_ds_ptr->add_spec( !path_bit || overflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || overflow_cons2, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons2, spec_reason_t::OUT_OF_RANGE );
 break; }
  case llvm::Instruction::Sub : { overflow_cons2 = bvsub_no_overflow(a,b); 
				  underflow_cons1 = bvsub_no_underflow(a,b,false);
				  underflow_cons2 = bvsub_no_underflow(a,b,true); 
				  bmc_ds_ptr->add_spec( !path_bit || overflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || overflow_cons2, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons2, spec_reason_t::OUT_OF_RANGE );
 break; }
  case llvm::Instruction::Mul : { overflow_cons1 = bvmul_no_overflow(a,b,false);
                                  overflow_cons2 = bvmul_no_overflow(a,b,true); 
				  underflow_cons2 = bvmul_no_underflow(a,b); 
				  bmc_ds_ptr->add_spec( !path_bit || overflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || overflow_cons2, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons2, spec_reason_t::OUT_OF_RANGE );
  break; }
  case llvm::Instruction::SDiv:  { overflow_cons2 = bvsdiv_no_overflow(a,b);  
				   bmc_ds_ptr->add_spec( !path_bit || overflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || overflow_cons2, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons1, spec_reason_t::OUT_OF_RANGE );
      bmc_ds_ptr->add_spec( !path_bit || underflow_cons2, spec_reason_t::OUT_OF_RANGE );
	break; }
  } 

//      std::cout << "overflow_cons1 " << overflow_cons1 << "\n";
//std::cout << "overflow_cons2 " << overflow_cons2 << "\n";
//std::cout << "underflow_cons1 " << underflow_cons1 << "\n";
//std::cout << "underflow_cons2 " << underflow_cons2 << "\n"; 

    }else{
      expr lb = llvm_min_val( solver_ctx, bop );
      expr ub = llvm_max_val( solver_ctx, bop );
      bmc_ds_ptr->add_spec( !path_bit || (v <= ub && v >= lb), spec_reason_t::OUT_OF_RANGE );
    }
  }
}

void bmc_pass::translateCmpInst( unsigned bidx, const llvm::CmpInst* cmp) {
  assert( cmp );
  // todo: two cases of cmp ICmpInst and FCmpInst
  // figure out which one is actually supported
  llvm::Value* lhs = cmp->getOperand( 0 ),* rhs = cmp->getOperand( 1 );
//lhs->print( llvm::outs() ); std::cout << "\n";
  expr l = bmc_ds_ptr->m.get_term( lhs );
  expr r = bmc_ds_ptr->m.get_term( rhs );

  // l and r may have different types, due to llvm does not record clearly
  // if something is bool or int. Our translation may incorrectly identify
  // sort of some constant number. The following code corrects the mismatch
  if( !matched_sort( l, r ) ) {
    if( is_const( l ) ) {
      auto s = r.get_sort();
      l = switch_sort( o, l, s );
    }else if( is_const( r ) ) {
      auto s = l.get_sort();
      r = switch_sort( o, r, s );
    }else llvm_bmc_error("bmc", "mismatched types in cmp instruction!!");
  }

  // construct expression for comparision
  llvm::CmpInst::Predicate pred = cmp->getPredicate();
  expr cnd(solver_ctx);
  switch( pred ) {
  //Integer compare instructions
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
  //Added FP compare instructions
  case llvm::CmpInst::FCMP_OEQ  : cnd = (l==r); break;
  case llvm::CmpInst::FCMP_ONE  : cnd = (l!=r); break;
  case llvm::CmpInst::FCMP_OGT  : cnd = (l> r); break;
  case llvm::CmpInst::FCMP_OGE  : cnd = (l>=r); break;
  case llvm::CmpInst::FCMP_OLT  : cnd = (l< r); break;
  case llvm::CmpInst::FCMP_OLE  : cnd = (l<=r); break;
  case llvm::CmpInst::FCMP_UEQ  : cnd = (l==r); break;
  case llvm::CmpInst::FCMP_UNE  : cnd = (l!=r); break;
  case llvm::CmpInst::FCMP_UGT  : cnd = (l> r); break;
  case llvm::CmpInst::FCMP_UGE  : cnd = (l>=r); break;
  case llvm::CmpInst::FCMP_ULT  : cnd = (l< r); break;
  case llvm::CmpInst::FCMP_ULE  : cnd = (l<=r); break;
  default: {
    llvm_bmc_error("bmc", "unsupported predicate in compare " << pred << "!!");
  }
  }

  //store the expression
  bmc_ds_ptr->m.insert_term_map( cmp, bidx, cnd );
}

void bmc_pass::translatePhiNode( unsigned bidx, const llvm::PHINode* phi ) {
  assert( phi );

  unsigned num = phi->getNumIncomingValues();

  if( !phi->getType()->isIntegerTy() && !phi->getType()->isFloatTy() ) {
    // phi->getParent()->dump();
    llvm_bmc_error("bmc", "phi nodes with non integers not supported !!");
  }

  expr new_var = o.loop_aggr ? bmc_ds_ptr->m.get_term( phi ) :
    bmc_ds_ptr->m.insert_new_def( phi );

  if( std::find(bmc_ds_ptr->quant_elim_val.begin(), bmc_ds_ptr->quant_elim_val.end(), phi) != bmc_ds_ptr->quant_elim_val.end() ) {
      bmc_ds_ptr->quant_elim_vars.push_back(new_var);
    }

  // auto& qe_vals =bmc_ds_ptr->quant_elim_val;
  // if( std::find(qe_vals.begin(), qe_vals.end(), phi) != qe_vals.end() ) {
  //   bmc_ds_ptr->quant_elim_vars.push_back(new_var);
  // }

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
}


void bmc_pass::translateSelectInst( unsigned bidx,
                                    const llvm::SelectInst *sel ) {
  assert( sel );

  expr cond = bmc_ds_ptr->m.get_term( sel->getCondition() );
  expr trueVal = bmc_ds_ptr->m.get_term(sel->getTrueValue());
  expr FalseVal = bmc_ds_ptr->m.get_term(sel->getFalseValue());
  expr result = ite(cond, trueVal, FalseVal );
  bmc_ds_ptr->m.insert_term_map( sel, bidx, result );
}


void bmc_pass::assume_to_bmc(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  expr assume_path_bit = bmc_ds_ptr->get_path_bit(bidx);
  expr assume_term = bmc_ds_ptr->m.get_term( call->getArgOperand(0) );
  expr assume_bit = get_fresh_bool( solver_ctx, "assume");
  bmc_ds_ptr->set_path_bit( bidx, assume_bit );
  bmc_ds_ptr->bmc_vec.push_back( assume_bit == (assume_path_bit && assume_term) );
}

// bool bmc_pass::is_assume(const llvm::CallInst* call) {
//   assert( call );
//   llvm::Function* fp = call->getCalledFunction();
//   if( fp != NULL &&
//       (fp->getName() == "_Z6assumeb" || fp->getName() == "assume" ) ) {
//     return true;
//   } else if( fp == NULL ) {
//     const llvm::Value * val = call->getCalledValue();
//     if( auto CE = llvm::dyn_cast<llvm::ConstantExpr>(val) ) {
//       if(CE->isCast()) {
//         if( CE->getOperand(0)->getName() == "assume" ||
//             CE->getOperand(0)->getName() == "_Z6assumeb") {
//           return true;
//         }
//       }
//     }
//   }
//   return false;
// }

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

// bool bmc_pass::is_assert(const llvm::CallInst* call ) {
//   assert( call );

//   llvm::Function* fp = call->getCalledFunction();
//   if( fp != NULL &&
//       (fp->getName() == "_Z6assertb" || fp->getName() == "assert" ) ) {
//     return true;
//   } else if (fp == NULL) {
//     const llvm::Value * val = call->getCalledValue();
//     if( auto CE = llvm::dyn_cast<llvm::ConstantExpr>(val) ) {
//       if(CE->isCast()) {
//         if(CE->getOperand(0)->getName() == "assert" ||
//            CE->getOperand(0)->getName() == "_Z6assertb") {
//           return true;
//         }
//       }
//     }
//   }
//   return false;
// }




void bmc_pass::translateNondet(unsigned bidx, const llvm::CallInst* call) {
  assert(call);

  llvm::Function* fp = call->getCalledFunction();
  if(o.bit_precise){
    llvm_bmc_error("bmc", "not det for bitprecise not implemented!");
  }else{
    if( fp!=NULL &&
        (fp->getReturnType()->isIntegerTy(32) ||
         fp->getReturnType()->isIntegerTy(64) ||
         fp->getReturnType()->isIntegerTy(8)) ) {
      expr nondet_int = get_fresh_int( solver_ctx, "nondet");
      bmc_ds_ptr->m.insert_term_map( call, bidx, nondet_int );
    } else if (fp!=NULL &&
               (fp->getReturnType()->isIntegerTy(1))) {
      expr nondet_bit = get_fresh_bool( solver_ctx, "nondet");
      bmc_ds_ptr->m.insert_term_map( call, bidx, nondet_bit );
    } else {
      llvm_bmc_error("bmc", "Unsupported nondet type!");
    }
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
        if( !is_pointer(val) ) {
          bmc_ds_ptr->m.insert_term_map(dbg_val, bidx,bmc_ds_ptr->m.get_term( val ) );
        }
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
  }else if( auto dbg_label = llvm::dyn_cast<llvm::DbgLabelInst>(dbg) ) {
    // some extra info on labels
    if( dbg_label == NULL ) { //to avoid warning
      assert( dbg_label );
    }
  }else{
    assert(false);
  } // not possible
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
  }else if( I->getIntrinsicID() == llvm::Intrinsic::memcpy ) {
    // do nothing - to be confirmed
  }
  else{
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
    //I->print( llvm::outs() );
    llvm_bmc_error("bmc", "Unsupported intrinsics!");
  }
}

void bmc_pass::translateCallInst( unsigned bidx,
                                  const llvm::CallInst* call ) {
  assert(call);

  llvm::Function* fp = call->getCalledFunction();
  
  if( auto dbg_val = llvm::dyn_cast<llvm::IntrinsicInst>(call) ) {
    translateIntrinsicInst( bidx, dbg_val );
  } else if( is_assert(call) ) {
    assert_to_spec(bidx, call);
  } else if( is_assume(call) ) {
    assume_to_bmc( bidx, call);
  } else if( is_nondet(call) ) {
    translateNondet( bidx, call);
  } else if( fp != NULL && fp->getName() == "fabsf" ) { 
    auto arg = fp->getArg(0);
    expr AbsArg = bmc_ds_ptr->m.get_term( arg );
    bmc_ds_ptr->m.insert_term_map( call, bidx, AbsArg );
  } else if( fp != NULL && fp->getName().startswith("__gnat") ) { //Do nothing - to be confirmed
    //std::cout << "These are Ada Runtime functions\n";
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
  } else {
    //call->print( llvm::outs() );
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
      if( o.bit_precise ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v.extract(0,0) );
      }else{
        expr ex_v = bmc_ds_ptr->m.get_term(v);
        // need to say that the integer was less than 1;
        bmc_ds_ptr->add_spec( ex_v <= 1 && ex_v >= 0,
                              spec_reason_t::OUT_OF_RANGE );
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      }
    }else if( ok_cast( c_ty, v_ty, 8, 32 ) ) {
      if( o.bit_precise ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v.extract(0,8) );
      }else{
        expr ex_v = bmc_ds_ptr->m.get_term(v);
        // todo: take care of signed/unsigned
        // bmc_ds_ptr->add_spec( ex_v <= 256 && ex_v >= 0,
        //                       spec_reason_t::OUT_OF_RANGE );
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      }
    }else if( ok_cast( c_ty, v_ty, 16, 32 ) ) {
      if( o.bit_precise ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v.extract(15,0) );
      }else{
        expr ex_v = bmc_ds_ptr->m.get_term(v);
        // todo: take care of signed/unsigned
        // bmc_ds_ptr->add_spec( ex_v <= 2^16 && ex_v >= 0,
        //                       spec_reason_t::OUT_OF_RANGE );
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      }
    }else{
      llvm_bmc_error("bmc", "unexpected sized TruncInst found!");
    }
  }else if( llvm::isa<llvm::ZExtInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if( o.bit_precise ) {
      unsigned new_size = c_ty->getIntegerBitWidth();
      unsigned old_size = v->getType()->getIntegerBitWidth();
      sort vs = ex_v.get_sort();
      expr ex_vn = ex_v;
      if( vs.is_bool() ) {
	 ex_vn = ex_v.ctx().bv_val(ex_v,2);
      }
      bmc_ds_ptr->m.insert_term_map( cast, bidx, zext( ex_vn, new_size-old_size ) );
    }else{
      // Current policy allow extensions [ 1 -> 8, 8->32, 1->32, 32->64]
      if( ok_cast( c_ty, v_ty, 8, 1 ) || ok_cast( c_ty, v_ty, 32, 1 ) ||
          ok_cast( c_ty, v_ty, 64, 32 ) || ok_cast( c_ty, v_ty, 32, 8 ) ||
          ok_cast( c_ty, v_ty, 64, 8 )
          ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      } else {
        llvm_bmc_error("bmc", "zero extn instruction of unsupported size");
      }
    }
  }else if( llvm::isa<llvm::SExtInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if( o.bit_precise ) {
      unsigned new_size = c_ty->getIntegerBitWidth();
      unsigned old_size = v->getType()->getIntegerBitWidth();
      bmc_ds_ptr->m.insert_term_map( cast, bidx, sext( ex_v, new_size-old_size ) );
    }else{
      // Current policy allow extensions [ 1 -> 8, 1->32, 32->64, 8->32 ]
      if( ok_cast( c_ty, v_ty, 8, 1 ) || ok_cast( c_ty, v_ty, 32, 1 ) ||
          ok_cast( c_ty, v_ty, 64, 32 ) || ok_cast( c_ty, v_ty, 32, 8 ) ||
          ok_cast( c_ty, v_ty, 64, 8 ) || ok_cast( c_ty, v_ty, 64, 16 )
          ) {
        bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v );
      } else {
        //cast->print( llvm::outs());
        llvm_bmc_error("bmc", "sign extn instruction of unsupported size");
      }
    }
  // }else if( auto bitCast = llvm::dyn_cast<llvm::BitCastInst>(cast) ) {
  }else if( llvm::isa<llvm::BitCastInst>(cast) ) {
    llvm_bmc_warning("bmc", "Ignoring a bit cast! Be careful");
    // llvm_bmc_error("bmc", "cast instruction is not recognized !!");
  }
  else if( llvm::isa<llvm::UIToFPInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if ( o.bit_precise ) {
    expr ex_v_float = ubv_to_fpa(ex_v, solver_ctx.fpa_sort<32>() );
    bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_float );
    }
    else {
     //unsigned int_size = v->getType()->getIntegerBitWidth();
     //expr ex_bv = int2bv(int_size, ex_v);
     //expr ex_v_float = sbv_to_fpa(ex_bv, solver_ctx.fpa_sort<32>() );
     expr ex_v_real = to_real(ex_v);
     bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_real );
    }
    
//sort s1 = ex_v.get_sort();  sort s2 = ex_v_float.get_sort();
//std::cout << "s1 is " << s1 << " s2 is " << s2 << "\n";
    }
   else if( llvm::isa<llvm::SIToFPInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    if ( o.bit_precise ) {
    expr ex_v_float = sbv_to_fpa(ex_v, solver_ctx.fpa_sort<32>() );
    bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_float );
    }
    else {
     expr ex_v_real = to_real(ex_v);
     bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_real );
     }
    }
   else if( llvm::isa<llvm::FPToUIInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    expr ex_v_u16 = fpa_to_ubv( ex_v, 16 );
    if ( o.bit_precise ) {
    bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_u16 );
    }
    else {
     expr ex_v_int = bv2int(ex_v_u16, false);
     bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_int );
     }
    }
   else if( llvm::isa<llvm::FPToSIInst>(cast) ) {
    expr ex_v = bmc_ds_ptr->m.get_term(v);
    expr ex_v_s16 = fpa_to_sbv( ex_v, 16 );
    if ( o.bit_precise ) {
    bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_s16 );
    }
    else {
     expr ex_v_int = bv2int(ex_v_s16, false);
     bmc_ds_ptr->m.insert_term_map( cast, bidx, ex_v_int );
     }
    }     
   else{
    BMC_UNSUPPORTED_INSTRUCTIONS( FPTruncInst,       cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( FPExtInst,         cast);
    //BMC_UNSUPPORTED_INSTRUCTIONS( UIToFPInst,        cast);
    //BMC_UNSUPPORTED_INSTRUCTIONS( SIToFPInst,        cast);
    //BMC_UNSUPPORTED_INSTRUCTIONS( FPToUIInst,        cast);
    //BMC_UNSUPPORTED_INSTRUCTIONS( FPToSIInst,        cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( IntToPtrInst,      cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( PtrToIntInst,      cast);
    BMC_UNSUPPORTED_INSTRUCTIONS( AddrSpaceCastInst, cast);
    LLVM_DUMP( cast );
    llvm_bmc_error("bmc", "cast instruction is not recognized !!");
  }
}

void bmc_pass::translateAllocaInst( const llvm::AllocaInst* alloca ) {
  assert( alloca );

  // IMPORTANT
  // 
  // length calculation of dynamically allocated array needs to be delayed
  // until we have symbols for the array length
  //
  auto typ = alloca->getAllocatedType();
  if( llvm::isa<const llvm::IntegerType>(typ) ) {
    auto val = alloca->getArraySize();
    if( auto constInt = llvm::dyn_cast<const llvm::ConstantInt>(val) ) {
        int constIntValue = (int)constInt->getSExtValue();
        std::vector<expr> ls;
        if( o.bit_precise )
          ls.push_back( get_expr_bv_const(solver_ctx,constIntValue,64)); //todo: why 64
        else
          ls.push_back( get_expr_const(solver_ctx,constIntValue));
        bmc_ds_ptr->set_array_length( alloca, ls );
        // array_lengths.push_back(const_expr);
    } else {
      auto val = alloca->getOperand(0);
      auto val_expr = bmc_ds_ptr->m.get_term( val );
      std::vector<expr> ls; ls.push_back( val_expr);
      bmc_ds_ptr->set_array_length( alloca, ls );
      // array_lengths.push_back(val_expr);
    }
  }
  else if( llvm::isa<const llvm::ArrayType>(typ) ) {
    int siz = (int)typ->getArrayNumElements();
    std::vector<expr> ls;
    if( o.bit_precise )
      ls.push_back( get_expr_bv_const(solver_ctx,siz,64)); //todo: why 64
    else
      ls.push_back( get_expr_const(solver_ctx,siz));
    bmc_ds_ptr->set_array_length( alloca, ls );
    // expr const_expr = get_expr_const(solver_ctx,siz);
    // std::vector<expr> ls; ls.push_back( const_expr);
    // array_lengths.push_back(const_expr);
  }
  else {
    //todo : why this else is not implemented?
    // what is the default return value
  }
}

// TODO : Add src_loc for instructions in add_spec
void bmc_pass::loadFromArrayHelper( unsigned bidx,
                                    const llvm::LoadInst* load,
                                    exprs& idx_exprs ) {
  auto arr_rd = bmc_ds_ptr->array_read( bidx, load, idx_exprs);
  if( o.include_out_of_bound_specs ) {
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    bmc_ds_ptr->add_spec( !path_bit || arr_rd.size_bound_guard, spec_reason_t::OUT_OF_BOUND );
  }
  bmc_ds_ptr->m.insert_term_map(load, bidx, arr_rd.return_val );
}

void bmc_pass::translateGEP( const llvm::GEPOperator* gep, exprs& idxs ) {
  //todo: what is the meaning of the second operand in GEP operator?

  //assert( gep->getNumIndices() <= 2);
  assert( gep->getNumIndices() <= 3); //Confirm if correct
  // llvm::Value * idx = NULL;
  // if(gep->getNumOperands() == 2) idx = gep->getOperand(1);
  // else if(gep->getNumOperands() == 3) {
  //   // assert( gep->getOperand(1) == 0);
  //   idx = gep->getOperand(2);
  // }
  // else if (gep->getNumOperands() == 4) {
  //   idx = gep->getOperand(3);
  // }
  unsigned i= gep->getNumOperands() == 2 ? 1 : 2;
  for( ; i < gep->getNumOperands(); i++ ) {
    llvm::Value* idx = gep->getOperand(i);
    auto idx_expr = bmc_ds_ptr->m.get_term( idx );
    if( o.bit_precise ) {
      // todo: HACK; fix it
      // check if idx is not default bit length then extend it to that length
      sort si = idx_expr.get_sort();
      if ( si.is_bv() && si.bv_size() != 64 ) {
        idx_expr = idx_expr.ctx().bv_val(idx_expr,64);
      }
    }
    idxs.push_back(idx_expr);
  }
  // access multi-dim arrays
  auto op_gep_ptr = gep->getPointerOperand();
  //todo: bit cast bug here
  while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(op_gep_ptr) ) {
    op_gep_ptr = bcast->getOperand(0);
    // idxs.clear();
  }
  if( auto sub_gep = llvm::dyn_cast<llvm::GEPOperator>(op_gep_ptr) ) {
    translateGEP( sub_gep, idxs );
  }
}


//------------------------------------------
//
//           concurrency support
//
//-----------------------------------------

o_tag_t bmc_pass::translate_ordering_tags( llvm::AtomicOrdering ord ) {
  switch( ord ) {
  case llvm::AtomicOrdering::NotAtomic: return o_tag_t::na; break;
  case llvm::AtomicOrdering::Unordered: return o_tag_t::uo; break;
  case llvm::AtomicOrdering::Monotonic: return o_tag_t::mon; break;
  case llvm::AtomicOrdering::Acquire: return o_tag_t::acq; break;
  case llvm::AtomicOrdering::Release: return o_tag_t::rls; break;
  case llvm::AtomicOrdering::AcquireRelease: return o_tag_t::acqrls; break;
  case llvm::AtomicOrdering::SequentiallyConsistent: return o_tag_t::sc; break;
  default:
    llvm_bmc_error("bmc", "Unsupported nondet type!");
  }
  return o_tag_t::na; // dummy return;
}

void bmc_pass::create_read_event( unsigned bidx,
                                   const llvm::LoadInst* load, llvm::Value* addr ) {
  src_loc loc = getLoc( load );
  expr path_cond = bmc_ds_ptr->get_path_bit( bidx ); 
  std::vector<expr> history;
  unsigned tid = bmc_ds_ptr->thread_id;
  
  if (auto glb = llvm::dyn_cast<llvm::GlobalVariable>(addr)) {
    auto gv = bmc_obj.edata.get_global( (std::string)(glb->getName()) );
    auto evt = mk_me_ptr(o.mem_enc, tid, prev_events, path_cond, history, gv, loc, event_t::r, translate_ordering_tags( load->getOrdering()) ); //NULL, true, NULL, val_expr, loc.
  //bmc_ds_ptr->all_events.insert( std::make_pair( evt, tid ) );
    //bmc_obj.all_events.insert( std::make_pair( evt, tid ) );
    bmc_obj.edata.all_events.insert( evt );
    prev_events = {evt};
    bmc_obj.edata.ev_threads[tid].events.push_back( evt );
    bmc_obj.edata.rd_events[gv].push_back( evt );
  }
}

//
// concurrency support
//
void bmc_pass::create_write_event( unsigned bidx,
                                   const llvm::StoreInst* store,
                                   llvm::Value* addr ) {
  // todo: write here

  src_loc loc = getLoc( store );
  expr path_cond = bmc_ds_ptr->get_path_bit( bidx ); //solver_ctx.bool_val(true);
  std::vector<expr> history;
  //unsigned tid = bmc_ds_ptr->get_thread_id();
  unsigned tid = bmc_ds_ptr->thread_id;
  if (auto glb = llvm::dyn_cast<llvm::GlobalVariable>(addr)) {
    auto gv = bmc_obj.edata.get_global( (std::string)(glb->getName()) );
    auto evt = mk_me_ptr(o.mem_enc, tid, prev_events, path_cond, history, gv, loc, event_t::w, translate_ordering_tags( store->getOrdering()) );
    prev_events = {evt};
  //NULL, true, NULL, val_expr, loc.
  // collect_globals_pass cgp_obj;
  // cgp_obj.add_event(tid, evt);
  //bmc_ds_ptr->all_events.insert( std::make_pair( evt, tid ) );
  //bmc_obj.all_events.insert( std::make_pair( evt, tid ) );
    bmc_obj.edata.all_events.insert( evt );
    bmc_obj.edata.ev_threads[tid].events.push_back( evt );
    bmc_obj.edata.wr_events[gv].insert( evt );
 }
}

//---------------------------------------------


void bmc_pass::translateLoadInst( unsigned bidx,
                                  const llvm::LoadInst* load ) {
  assert( load );
//load->print( llvm::outs() );
  //std::cout << "\n";
  auto addr = load->getOperand(0);
  // jump over casting
  while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
    addr = bcast->getOperand(0);
  }
  if( auto gop = llvm::dyn_cast<llvm::GEPOperator>(addr) ) {
    // assert( gop->getNumIndices() <= 2);
    // llvm::Value * idx = NULL;
    // if(gop->getNumOperands() == 2) idx = gop->getOperand(1);
    // else if(gop->getNumOperands() == 3) {
    //   // assert( gep->getOperand(1) == 0);
    //   idx = gop->getOperand(2);
    // }
    // auto idx_expr = bmc_ds_ptr->m.get_term( idx );
    exprs idxs;
    translateGEP( gop, idxs);
    loadFromArrayHelper(bidx, load, idxs);
    // gop is more general than gep
  // }else if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(addr) ) {
  //   // TODO : Add more general support to parse gep instruction when supporting 
  //   // // objects (struct's) and multidimensional arrays
  //   // llvm::Value * idx = NULL;
  //   // // added cases to distinguish between constant or dynamic sized 1d arrays 
  //   // if(gep->getNumOperands() == 2) idx = gep->getOperand(1);
  //   // else if(gep->getNumOperands() == 3) idx = gep->getOperand(2);
  //   // auto idx_expr = bmc_ds_ptr->m.get_term( idx );
  //   exprs idxs;
  //   translateGEP( gep, idxs);
  //   loadFromArrayHelper(bidx, load, idxs);
  } else if(auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(addr)) {
    //    llvm_bmc_error("bmc", "non array global write/read not supported!");
    auto glb_rd = bmc_ds_ptr->m_model.read( bidx, load);
    bmc_ds_ptr->m.insert_term_map( load, bidx, glb_rd );
    if ( exists( bmc_obj.concurrent_vars, gv ) ) {
    // if (find(bmc_obj.concurrent_vars.begin(), bmc_obj.concurrent_vars.end(), addr) != bmc_obj.concurrent_vars.end() ) { //todo: add check if the grobal variable is truly global
      create_read_event( bidx, load, addr );
      //load->print( llvm::outs() ); std::cout << "\n";
      //addr->print( llvm::outs() );  std::cout << "\n";
    }
  // } else if( auto alloc = llvm::dyn_cast<const llvm::AllocaInst>(addr) ) {
  } else if( llvm::isa<const llvm::AllocaInst>(addr) ) {
    // To handle a[0] when a is dynamic sized array
    // expr idx_expr = get_expr_const(solver_ctx,0);
    exprs idxs;
    if( o.bit_precise)
      idxs.push_back( get_expr_bv_const( solver_ctx, 0, 64 ) );
    else
      idxs.push_back( get_expr_const( solver_ctx, 0 ) );

    loadFromArrayHelper(bidx, load, idxs );
  } else if (auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
    //todo: rethink about this
    assert(false);
    // To handle the case of a pointer with a bitcast instruction as parameter
    auto a = bcast->getOperand(0);
    auto ty = a->getType();
    if( ty->isPointerTy() ) {
      // expr idx_expr = get_expr_const(solver_ctx,0);
      exprs idxs; idxs.push_back( get_expr_const(solver_ctx,0) );
      loadFromArrayHelper(bidx, load, idxs);
    }  
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
                         exprs& idxs ) {
  auto val_expr = bmc_ds_ptr->m.get_term( val );
  auto arr_wrt = bmc_ds_ptr->array_write(bidx, store, idxs, val_expr);
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
//store->print( llvm::outs() ); std::cout << "\n";
  auto val = store->getOperand(0);
  auto addr = store->getOperand(1);

  //jumping over cast
  // todo: to write a generic function that allows us to jump over cast
  //       Should also checked ok casts in debug mode.
  while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
    addr = bcast->getOperand(0);
  }

  if( auto gop = llvm::dyn_cast<llvm::GEPOperator>(addr) ) {
    exprs idxs;
    translateGEP( gop, idxs);
    storeToArrayHelper(bidx, store, val, idxs);
  } else if(auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(addr)) {
    //    llvm_bmc_error("bmc", "non array global write/read not supported!");
    auto val_expr = bmc_ds_ptr->m.get_term( val );
    auto glb_wrt = bmc_ds_ptr->m_model.write(bidx, store, val_expr);
    if ( exists( bmc_obj.concurrent_vars, gv ) ) {
        // find(bmc_obj.concurrent_vars.begin(), bmc_obj.concurrent_vars.end(), addr) != bmc_obj.concurrent_vars.end() ) { //todo: add check if the grobal variable is truly global
      create_write_event( bidx, store, addr );
      //store->print( llvm::outs() ); std::cout << "\n";
      //addr->print( llvm::outs() );  std::cout << "\n";
    }
    bmc_ds_ptr->bmc_vec.push_back( glb_wrt.first );
    bmc_ds_ptr->m.insert_term_map( store, bidx, glb_wrt.second );
  } else if( llvm::isa<const llvm::AllocaInst>(addr) ||
             llvm::isa<const llvm::Argument>(addr) ) {
    exprs idxs;
    if( o.bit_precise)
      idxs.push_back( get_expr_bv_const( solver_ctx, 0, 64 ) );
    else
      idxs.push_back( get_expr_const( solver_ctx, 0 ) );
    storeToArrayHelper(bidx, store, val, idxs );
  } else if( llvm::isa<llvm::Constant>(addr) ) {
  // } else if( auto cons = llvm::dyn_cast<llvm::Constant>(addr) ) {
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
/*  assert( br );

  auto& exit_bits = bmc_ds_ptr->get_exit_bits( bidx );
  if( !br->isUnconditional() ) {
    expr cond = bmc_ds_ptr->m.get_term( br->getCondition() );
    bmc_ds_ptr->bmc_vec.push_back( cond == exit_bits[0] );
  }else{
    // for unconditional branch, there is no need of constraints
    // bmc_ds_ptr->bmc_vec.push_back( exit_bit );
  } */
  assert( br );

  auto& exit_bits = bmc_ds_ptr->get_exit_bits( bidx );
  if( !br->isUnconditional() ) {
    expr cond = bmc_ds_ptr->m.get_term( br->getCondition() );
    auto cond_sort = cond.get_sort();
    auto exit_sort = exit_bits[0].get_sort();
    if (cond_sort.is_bv() && exit_sort.is_bool()) {    	
	expr exitbits_bv = solver_ctx.bv_val(exit_bits[0],1);
    	bmc_ds_ptr->bmc_vec.push_back( cond == exitbits_bv );
    }
    else  
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
  //todo : if you have specs, translate the spec to the current names
  //bmc_ds_ptr->add_spec( !path_bit || translate_cons, spec_reason_t::FROM_SPEC_FILE );
  if ( bmc_obj.sys_spec.threads.size() > 1 ) {
    final_prev_events.insert( prev_events.begin(), prev_events.end() );
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
  bmc_ds_ptr->add_spec(!unreach_path_bit, spec_reason_t::UNREACHABLE);
}

void bmc_pass::translateInvokeInst( unsigned bidx,
                                    const llvm::InvokeInst *invoke) {
  assert( invoke );
  // for call to functions that may throw exceptions
  // todo: needs careful implementation

  llvm::Function* fp = invoke->getCalledFunction();
  auto& exit_bits = bmc_ds_ptr->get_exit_bits( bidx );
  assert( exit_bits.size() == 2 );
  // auto normal = invoke->getNormalDest();
  // auto landing = invoke->getUnwindDest();

  if( (fp != NULL) &&
      ((fp->getName() == "__gnat_rcheck_CE_Index_Check") ||
       (fp->getName() == "__gnat_rcheck_CE_Overflow_Check") )) {
    //Do nothing - throws exception
    // unwind is the second bit in the exit bits??
    bmc_ds_ptr->bmc_vec.push_back( exit_bits[1] );
  } else {
    llvm_bmc_error("bmc", "invoke is not recognized !!");
  }
}


void bmc_pass::translateLandingPadInst( unsigned bidx,
                                         const llvm::LandingPadInst *lpad) {
	assert( lpad );
	if (lpad->isCleanup()) {
		std::cout << "Landingpad cleanup\n";
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
          auto el_ty = pty->getPointerElementType();
          sort z_sort = llvm_to_sort( o, el_ty);
          ty_str = to_string(z_sort);
        }else{ llvm_bmc_error( "parse comment::", "unrecognized type!"); }
      }else{
        llvm::Type* ty = v->getType();
        if( auto pty = llvm::dyn_cast<llvm::PointerType>(ty) ) {
          auto el_ty = pty->getPointerElementType();
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
      // Terminator instructions
    } else if( auto br = llvm::dyn_cast<llvm::BranchInst>(I) ) {
      translateBranch( bidx, br );
    } else if( auto ret = llvm::dyn_cast<llvm::ReturnInst>(I) ) {
      translateRetInst( ret );
    } else if( auto swch = llvm::dyn_cast<llvm::SwitchInst>(I) ) {
      translateSwitchInst(bidx, swch);
    } else if( auto sel = llvm::dyn_cast<llvm::SelectInst>(I) ) {
      translateSelectInst(bidx, sel);
    } else if( auto unreach = llvm::dyn_cast<llvm::UnreachableInst>(I) ) {
      translateUnreachableInst(bidx, unreach);
    } else if( auto lpad = llvm::dyn_cast<llvm::LandingPadInst>(I) ) {
      translateLandingPadInst(bidx, lpad);
    } else if( auto invoke = llvm::dyn_cast<llvm::InvokeInst>(I) ) {
      translateInvokeInst(bidx, invoke);
    // } else if( auto terminate = llvm::dyn_cast<llvm::TerminatorInst>(I)) {
    //   translateTerminatorInst( bidx, terminate );
    } else {
      //Unsupported terminator instructions
      BMC_UNSUPPORTED_INSTRUCTIONS( IndirectBrInst,    I );
      //BMC_UNSUPPORTED_INSTRUCTIONS( InvokeInst,        I );
      BMC_UNSUPPORTED_INSTRUCTIONS( ResumeInst,        I ); // passing exception to caller
      BMC_UNSUPPORTED_INSTRUCTIONS( CatchSwitchInst,   I );
      BMC_UNSUPPORTED_INSTRUCTIONS( CatchReturnInst,   I );
      BMC_UNSUPPORTED_INSTRUCTIONS( CleanupReturnInst, I );

      //Other unsupported instructions
      BMC_UNSUPPORTED_INSTRUCTIONS( FuncletPadInst,     I);
      // todo: cases for funclet CleanupPadInst, CatchPadInst
      BMC_UNSUPPORTED_INSTRUCTIONS( BinaryOperator,     I);
      BMC_UNSUPPORTED_INSTRUCTIONS( FenceInst,          I);
      BMC_UNSUPPORTED_INSTRUCTIONS( AtomicCmpXchgInst,  I);
      BMC_UNSUPPORTED_INSTRUCTIONS( AtomicRMWInst,      I);
      //BMC_UNSUPPORTED_INSTRUCTIONS( SelectInst,         I);
      BMC_UNSUPPORTED_INSTRUCTIONS( ExtractElementInst, I);
      BMC_UNSUPPORTED_INSTRUCTIONS( InsertElementInst,  I);
      BMC_UNSUPPORTED_INSTRUCTIONS( ShuffleVectorInst,  I);
      BMC_UNSUPPORTED_INSTRUCTIONS( InsertValueInst,    I);
      //BMC_UNSUPPORTED_INSTRUCTIONS( LandingPadInst,     I); // allocates exception object 
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

  if ( bmc_obj.sys_spec.threads.size() > 1 ) {
    // todo: support incremental calls???
    expr start_bit = get_fresh_bool(solver_ctx,"start");
    std::vector< expr > history = { start_bit };
    src_loc loc;
    unsigned thr_id = bmc_ds_ptr->thread_id;
    auto start = mk_me_ptr( o.mem_enc, thr_id, prev_events, start_bit,
                            history, loc, event_t::barr );
    set_start_event( thr_id, start, start_bit );
    prev_events = { start };
    //bmc_obj.all_events.insert( start );
    bmc_obj.edata.ev_threads[bmc_ds_ptr->thread_id].start_event = start;
    for( unsigned t = 0; t < bmc_obj.sys_spec.threads.size(); t++ ) bmc_obj.edata.create_map[ bmc_obj.sys_spec.threads[t].name ] = start;

  }

  // init_array_model( bmc_ds_ptr->bb_vec, bmc_ds_ptr->eb );
  init_path_exit_bit( bmc_ds_ptr->bb_vec );
  unsigned bidx = 0;
  for( const bb* src : bmc_ds_ptr->bb_vec ) {
    // support for stacked call. blocks before start_bidx have been processed
    if( bidx < bmc_ds_ptr->processed_bidx) { bidx++; continue; }
    if( llvm::isa<llvm::ResumeInst>( src->getTerminator() ) ) {
      continue; // todo: hack! We are ignoring returned exceptions.
    }

  if ( bmc_obj.sys_spec.threads.size() > 1 ) {
    for(auto PI = llvm::pred_begin(src),E = llvm::pred_end(src);PI != E;++PI) {
      const llvm::BasicBlock *prev = *PI;
      //collect incoming branch conditions
      me_set& prev_trail = bmc_ds_ptr->block_to_trailing_events.at( prev );
      prev_events.insert( prev_trail.begin(), prev_trail.end() );
    }
  }

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
      // todo: join prev_events
    }

    translateBlock( bidx, src );
    bidx++;
    if( o.verbosity > 4 )
      print_bb_exprs(src);
    if( o.verbosity > 3 )
      print_bb_vecs();

    if ( bmc_obj.sys_spec.threads.size() > 1 ) {
      bmc_ds_ptr->block_to_trailing_events[src] = prev_events;
      prev_events.clear();
    }
  }
  bmc_ds_ptr->processed_bidx = bmc_ds_ptr->bb_vec.size();

  // Insert global variable definitions
  bmc_ds_ptr->add_bmc_formulas(  bmc_obj.glb_bmc_vec );

//  if( o.verbosity > 2 )
//    bmc_ds_ptr->print_formulas();
  
  // create final event of the thread
  if ( bmc_obj.sys_spec.threads.size() > 1 ) {
    expr exit_cond = solver_ctx.bool_val(true);
    std::vector<expr> history_exprs;
    src_loc floc;
    unsigned thr_id = bmc_ds_ptr->thread_id;
    auto final = mk_me_ptr( o.mem_enc, thr_id, final_prev_events, exit_cond,
                            history_exprs, floc, event_t::barr );
    set_final_event( thr_id, final, exit_cond );
    //bmc_obj.all_events.insert( final );
    bmc_obj.edata. ev_threads[bmc_ds_ptr->thread_id].final_event = final;
 }

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

void bmc_pass::populate_array_name_map(llvm::Function* f) {
  assert(f);
  int arrCntr = 0;
  ary_to_int.clear();

  // collect global arrays of the module
  for( auto& glb : f->getParent()->globals()) {
    if( auto ptr = llvm::dyn_cast<llvm::PointerType>( glb.getType() ) ) {
      if( ptr->getPointerElementType()->isArrayTy() ) {
        ary_to_int[&glb] = arrCntr++;
      }
    }
  }

  // collect arrays allocated in the function
  for( auto bbit = f->begin(), end = f->end(); bbit != end; bbit++ ) {
    auto bb = &(*bbit);
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      auto I = &(*it);
      if( llvm::isa<const llvm::AllocaInst>(I) ) {
        ary_to_int[I] = arrCntr++;
      } else {} // no errors needed!!
    }
  }

  // collect arrays passed in the function
  for( auto ab = f->arg_begin(), ae = f->arg_end(); ab != ae; ab++) {
    auto a = &(*ab);
    auto ty = a->getType();
    if( ty->isPointerTy() ) {
      ary_to_int[a] = arrCntr++;
    }
  }

}



