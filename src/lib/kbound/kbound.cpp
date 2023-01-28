#include "lib/kbound/kbound.h"
#include "include/bmc.h"
#include "llvm/IR/DataLayout.h"

#define KBOUND_UNSUPPORTED_INSTRUCTIONS( InstTYPE, Inst )               \
  if(llvm::isa<llvm::InstTYPE>(Inst) ) {                                \
    std::cerr << "Occuring in block:\n";                                \
    LLVM_DUMP( Inst->getParent() )                                      \
    LLVM_DUMP( Inst )                                                   \
    llvm_bmc_error( "kbound", "Unsupported instruction!!");             \
  }

typedef std::vector<std::string> svec;

char kbound::ID = 0;

unsigned kbound::get_word_size(const llvm::Value* v ) {
  auto dl = new llvm::DataLayout(module.get());
  auto typ = v->getType();
  if( typ->isPointerTy() ) {
    typ = typ->getPointerElementType();
  }
  if( typ->isSized() ) {
    auto size = dl->getTypeAllocSizeInBits(typ);
    auto bitSize = size.getFixedSize();
    // auto bitSize = typ->getScalarSizeInBits();
    unsigned wsize = bitSize/64;
    if( bitSize % 64 != 0 ) {
      wsize += 1;
    }
    // std::cout << wsize << "\n";
    return wsize;// Divide by 64
  }else{
    llvm_bmc_error("kbound", "size of global variable is unkown!");
  }
}

kbound::kbound( options& o_, std::unique_ptr<llvm::Module>& m_,
                bmc& bmc_ )
  : bmc_pass( o_, o_.solver_ctx, bmc_ )
  , llvm::FunctionPass(ID)
  , module(m_)
  , ofcpp(o_.outDirPath.string()+"/cbmc.cpp")
  , current_indent(0)
  , ncontext(o.ctx_bound)
{
  unsigned i = 0;
  for( auto v : bmc_obj.concurrent_vars ) {
    global_position[v] = i;
    auto size = get_word_size(v);
    global_size[v] = size;
    global_name[v] = v->getName().str();
    i += size;
  }
  num_globals = i;

  i = 0;
  for( auto v : bmc_obj.local_globals ) {
    local_global_position[v] = i;
    auto size = get_word_size(v);
    local_global_size[v] = size;
    local_global_name[v] = v->getName().str();
    i += size;
  }
  num_local_globals = i;

  prefix_seq();
}

kbound::~kbound() {
  postfix_seq();
  ofcpp.close();
  dump_locals();
}

void kbound::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}

llvm::StringRef kbound::getPassName() const {
  return "Constructs KBMC output for arm memory model!";
}


bool kbound::runOnFunction( llvm::Function &f ) {
  EntryFn = demangle(f.getName().str());
  unsigned j = 0;
  for (;j < bmc_obj.sys_spec.threads.size(); j++) {
    if (bmc_obj.sys_spec.threads[j].entry_function == EntryFn) break;
  }
  if( j == bmc_obj.sys_spec.threads.size() ) return false;
  std::cout<< "Function " << EntryFn << "\n";
  thread_id = j;
  tid = std::to_string(thread_id);
  thread_name = bmc_obj.sys_spec.threads.at(j).name;
  if(bmc_obj.sys_spec.threads.at(j).wmm == weak_memory_model::SC ) {
    is_sc_semantics = true;
  }
  populate_array_name_map(&f);
  auto bmc_fun_ptr = new bmc_fun(o, ary_to_int, bmc_obj.m_model);
  bmc_ds_ptr = bmc_fun_ptr; // set the pointer in base cla
  bmc_fun_ptr->fun_initialize( this, f);
  // bmc_ds_ptr->thread_id = bmc_obj.sys_spec.threads.at(j).thread_num;

  dump_Params(f);
  // dump_Thread();
  dump_Thread();
  return false;
}


//----------------------------------------------------------------------------
//


// std::string kbound::get_path( unsigned bidx ) {
//   return "path_"+tid+"_"+std::to_string(bidx);
// }

std::string kbound::read_const( const llvm::Value* v ) {
  if( auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(v) ) {
    return get_global_idx(gv);
  }
  if( auto cexpr = llvm::dyn_cast<const llvm::ConstantExpr>(v) ) {
    if( cexpr->getType()->isPointerTy() ) {
      std::string gid, cgid;
      bool isLocalUse;
      addr_name( cexpr, gid, cgid, isLocalUse );
      return gid;
    }
  }
  return read_const_str( o, v );
}


std::string kbound::get_reg( const llvm::Value* v) {
  svec idxs;
  return get_reg(v,idxs);
  // auto s = read_const(v);
  // if( s != "" ) return s;
  // return get_reg( (const void* )v);
}

std::string kbound::get_reg( const llvm::Value* v, svec& idxs ) {
  auto s = read_const(v);
  if( s != "" ) {
    if( llvm::isa<llvm::UndefValue>(v) ) {
      uninit_names.push_back(s);
    }
    assert( idxs.size() == 0 );
    return s;
  }
  return get_reg( (const void* )v, idxs );
}

std::string kbound::get_reg_time( const llvm::Value* v, svec& idxs) {
  auto s = read_const(v);
  if( s != "" ) {
    assert( idxs.size() == 0 );
    return "0";
  }
  return get_reg_time( (const void*)v, idxs);
}

std::string kbound::get_reg_time( const llvm::Value* v) {
  svec idxs;
  return get_reg_time( v, idxs );
  // auto s = read_const(v);
  // if( s != "" ) return "0";
  // return get_reg_time( (const void*)v );
}


std::string kbound::add_reg_map( const llvm::Value* v) {
  auto s = read_const(v);
  if( s != "" ) return "";
  return add_reg_map( (const void*) v);
  // if( ssa_name.find(v) != ssa_name.end() ) return ssa_name.at(v);
  // auto fname = fresh_name();
  // add_reg_map(v, fname );
  // return get_reg(v);
}


//----------------------------------------------------------------------------


void kbound::dump_Params(llvm::Function &f) {
  //  for (auto& f_arg : f.getArgumentList()) {
  for( auto ab = f.arg_begin(), ae = f.arg_end(); ab != ae; ab++) {
    auto a = &(*ab);
    auto ty = a->getType();

    if( !ty->isPointerTy() ) { // input pointers are viewed as arrays
      add_reg_map(a);
    }else{ // array case
      //todo:
    }
  }
}

bool kbound::is_acquire( llvm::AtomicOrdering ord ) {
  // return hb_enc::o_tag_t::sc; // test return;
  switch( ord ) {
  case llvm::AtomicOrdering::NotAtomic: return false; break;
  case llvm::AtomicOrdering::Unordered: return false; break;
  case llvm::AtomicOrdering::Monotonic: return false; break;
  case llvm::AtomicOrdering::Acquire:   return true;  break;
  case llvm::AtomicOrdering::Release:   return false; break;
  case llvm::AtomicOrdering::AcquireRelease: return true; break;
 case llvm::AtomicOrdering::SequentiallyConsistent: return false; break;
  default:
    llvm_bmc_error( "kbound", "unrecognized C++ ordering returned!!" );
  }
  return false; // dummy return;
}

bool kbound::is_release( llvm::AtomicOrdering ord ) {
  // return hb_enc::o_tag_t::sc; // test return;
  switch( ord ) {
  case llvm::AtomicOrdering::NotAtomic: return false; break;
  case llvm::AtomicOrdering::Unordered: return false; break;
  case llvm::AtomicOrdering::Monotonic: return false; break;
  case llvm::AtomicOrdering::Acquire:   return false;  break;
  case llvm::AtomicOrdering::Release:   return true; break;
  case llvm::AtomicOrdering::AcquireRelease: return true; break;
  case llvm::AtomicOrdering::SequentiallyConsistent: return false; break;
  default:
    llvm_bmc_error( "kbound", "unrecognized C++ ordering returned!!" );
  }
  return false; // dummy return;
}

void kbound::dump_CmpInst( unsigned bidx, const llvm::CmpInst* cmp) {
  assert( cmp );
  llvm::Value* lhs = cmp->getOperand( 0 ),* rhs = cmp->getOperand( 1 );

  auto r1 = get_reg( lhs );
  auto r2 = get_reg( rhs );

  auto cr1 = get_reg_time( lhs );
  auto cr2 = get_reg_time( rhs );

  // construct expression for comparision
  std::string cnd;
  auto pred = cmp->getPredicate();
  switch( pred ) {
  //Integer compare instructions
  case llvm::CmpInst::ICMP_EQ  : cnd = "(" + r1 + "==" + r2 + ")"; break;
  case llvm::CmpInst::ICMP_NE  : cnd = "(" + r1 + "!=" + r2 + ")"; break;
  case llvm::CmpInst::ICMP_UGT : cnd = "(" + r1 + ">"  + r2 + ")"; break;
  case llvm::CmpInst::ICMP_UGE : cnd = "(" + r1 + ">=" + r2 + ")"; break;
  case llvm::CmpInst::ICMP_ULT : cnd = "(" + r1 + "< " + r2 + ")"; break;
  case llvm::CmpInst::ICMP_ULE : cnd = "(" + r1 + "<=" + r2 + ")"; break;
  case llvm::CmpInst::ICMP_SGT : cnd = "(" + r1 + "> " + r2 + ")"; break;
  case llvm::CmpInst::ICMP_SGE : cnd = "(" + r1 + ">=" + r2 + ")"; break;
  case llvm::CmpInst::ICMP_SLT : cnd = "(" + r1 + "< " + r2 + ")"; break;
  case llvm::CmpInst::ICMP_SLE : cnd = "(" + r1 + "<=" + r2 + ")"; break;
  //Added FP compare instructions
  case llvm::CmpInst::FCMP_OEQ : cnd = "(" + r1 + "==" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_ONE : cnd = "(" + r1 + "!=" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_OGT : cnd = "(" + r1 + "> " + r2 + ")"; break;
  case llvm::CmpInst::FCMP_OGE : cnd = "(" + r1 + ">=" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_OLT : cnd = "(" + r1 + "< " + r2 + ")"; break;
  case llvm::CmpInst::FCMP_OLE : cnd = "(" + r1 + "<=" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_UEQ : cnd = "(" + r1 + "==" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_UNE : cnd = "(" + r1 + "!=" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_UGT : cnd = "(" + r1 + "> " + r2 + ")"; break;
  case llvm::CmpInst::FCMP_UGE : cnd = "(" + r1 + ">=" + r2 + ")"; break;
  case llvm::CmpInst::FCMP_ULT : cnd = "(" + r1 + "< " + r2 + ")"; break;
  case llvm::CmpInst::FCMP_ULE : cnd = "(" + r1 + "<=" + r2 + ")"; break;
  default: {
    llvm_bmc_error("kbound","unsupported predicate in compare " <<pred<< "!!");
  }
  }

  // double the reg_map for conditions
  add_reg_map(cmp, cnd);

  if(cr1 != "") ctrl_dep_ord[cmp].push_back(cr1);
  if(cr2 != "") ctrl_dep_ord[cmp].push_back(cr2);

  // ssa_name[cmp] = cnd;

  // //store the expression
  // bmc_ds_ptr->m.insert_term_map( cmp, bidx, cnd );
}


void kbound::dump_RetInst(const llvm::ReturnInst *ret ) {
  assert( ret );
  llvm::Value* v = ret->getReturnValue();

  if( v ) {
    auto r = get_reg(v);
    dump_String("ret_thread_"+tid + " = " + r + ";");
  }//  else {
  // }
}


void kbound::dump_BinOp( unsigned bidx, const llvm::BinaryOperator* bop) {
  assert( bop );
  auto op0 = bop->getOperand( 0 );
  auto op1 = bop->getOperand( 1 );
  auto ro = add_reg_map( bop );
  auto r1 = get_reg( op0 );
  auto r2 = get_reg( op1 );

  auto rt  = get_reg_time( bop );
  auto r1t = get_reg_time( op0 );
  auto r2t = get_reg_time( op1 );

  // dump_Assign_rand_ctx( "new_creg" );
  // dump_Active( "new_creg" );
  // dump_Assume_geq( "new_creg", r1t);
  // dump_Assume_geq( "new_creg", r2t);
  // dump_Assign_max( rt, "new_creg" );

  // dump_Assign_rand_ctx( rt );
  dump_Assign_max( rt, r1t, r2t );
  dump_Active( rt );

  unsigned op = bop->getOpcode();
  expr result = solver_ctx.bool_val(true);
  switch( op ) {
  case llvm::Instruction::Add : dump_Assign( ro, r1 +" + "+ r2); break;
  case llvm::Instruction::Sub : dump_Assign( ro, r1 +" - "+ r2); break;
  case llvm::Instruction::Mul : dump_Assign( ro, r1 +" * "+ r2); break;
  case llvm::Instruction::URem: dump_Assign( ro, r1 +" % "+ r2); break;
  case llvm::Instruction::SRem: dump_Assign( ro, r1 +" % "+ r2); break;
  default: {
    const char* opName = bop->getOpcodeName();
    llvm_bmc_error("kbound", "unsupported instruction \"" << opName << "\" occurred!!");
   }
  }


}

void kbound::dump_ExtractValue( const llvm::ExtractValueInst* eval) {
  auto ro = add_reg_map( eval );
  auto cro = get_reg_time( eval );
  auto val = eval->getAggregateOperand();
  svec idxs;
  auto indcies = eval->getIndices();
  for( auto idx : indcies ) {
    idxs.push_back(std::to_string(idx));
  }
  // unsigned idx = eval->getAggregateOperandIndex();
  // svec idxs{std::to_string(idx)};
  auto rv = get_reg(val, idxs);
  assert( rv != "" );
  auto cv = get_reg_time(val, idxs);
  dump_Assign( ro, rv );
  dump_Assign( cro, cv );
}

void kbound::dump_IntrinsicInst( unsigned bidx,
                                 const llvm::IntrinsicInst* I ) {
  assert( I );

  if( // auto dbg =
      llvm::isa<llvm::DbgInfoIntrinsic>(I) ) {
    // do nothing
    // translateDebugInfo( bidx, dbg );
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
    KBOUND_UNSUPPORTED_INSTRUCTIONS( ConstrainedFPIntrinsic, I);
#ifndef LLVM_SVN
    KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicMemCpyInst, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicMemMoveInst, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicMemSetInst, I);
#endif
    KBOUND_UNSUPPORTED_INSTRUCTIONS( MemIntrinsic, I);
    // sub class
    // KBOUND_UNSUPPORTED_INSTRUCTIONS( MemSetInst, I);
    // KBOUND_UNSUPPORTED_INSTRUCTIONS( MemTransferInst, I);
    // KBOUND_UNSUPPORTED_INSTRUCTIONS( MemCpyInst, I);
    // KBOUND_UNSUPPORTED_INSTRUCTIONS( MemMoveInst, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( VAStartInst, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( VAEndInst, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( VACopyInst, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( InstrProfIncrementInst, I);
    // KBOUND_UNSUPPORTED_INSTRUCTIONS( InstrProfIncrementInstStep, I);
    KBOUND_UNSUPPORTED_INSTRUCTIONS( InstrProfValueProfileInst, I);
    //I->print( llvm::outs() );
    llvm_bmc_error("bmc", "Unsupported intrinsics!");
  }
}

std::string kbound::get_GEPOperator(const llvm::GEPOperator* gep) {
  assert( gep );
  std::string index;
  std::string scale = "1";
  // assert( gep->getNumIndices() <= 3); //Confirm if correct
  unsigned i= gep->getNumOperands() == 2 ? 1 : 2;
  for( ; i < gep->getNumOperands(); i++ ) {
    auto idx = get_reg( gep->getOperand(i) );
    if(idx != "0" ) index = '+' + idx + "*" + scale + index;
  }
  auto op_gep_ptr = gep->getPointerOperand();
  auto gid = get_reg(op_gep_ptr);
  return gid + index;
}

void kbound::dump_GetElementPtrInst( const llvm::GetElementPtrInst* gep) {
  bool isLocalUse;
  dump_GetElementPtrInst( gep, isLocalUse );
}

void kbound::dump_GetElementPtrInst( const llvm::GetElementPtrInst* gep,
                                     bool& isLocalUse ) {
  assert( gep );

  //check if there is recursive access
  auto op_gep_ptr = gep->getPointerOperand();
  std::string gid, cgid;
  addr_name( op_gep_ptr, gid, cgid, isLocalUse );
  // auto gid = get_reg(op_gep_ptr);
  // auto cgid = get_reg_time(op_gep_ptr);

  auto o  = add_reg_map( gep );
  auto co = get_reg_time( gep );
  svec cidxs;
  std::string index;
  std::string scale = "1";
  assert( gep->getNumIndices() <= 3); //Confirm if correct
  unsigned i= gep->getNumOperands() == 2 ? 1 : 2;
  for( ; i < gep->getNumOperands(); i++ ) {
    auto idx = gep->getOperand(i);
    auto idx_str = get_reg( idx );
    if(idx_str != "0" ) index = '+' + idx_str + "*" + scale + index;
    auto cidx =  get_reg_time( idx );
    if( cidx != "0" ) cidxs.push_back( cidx );
  }

  dump_Assign( o, gid + index );
  dump_Assume_geq( co, cgid );
  for( auto cidx : cidxs) dump_Assume_geq( co, cidx );
  dump_Active( co ); // todo: do we need it?
}

void kbound::addr_name( const llvm::Value* addr,
                        std::string& gid, std::string& caddr) {
  bool isLocalUse;
  addr_name( addr, gid, caddr, isLocalUse );
  assert( gid != "" );
}

void kbound::addr_name( const llvm::Value* addr,
                        std::string& gid, std::string& caddr,
                        bool& isLocalUse ) {
  assert(addr);
  if( auto cexpr = llvm::dyn_cast<llvm::ConstantExpr>(addr) ) {
    if( cexpr->getOpcode() == llvm::Instruction::BitCast ) {
      addr = cexpr->getOperand(0);
      addr_name( addr, gid, caddr, isLocalUse );
      return;
    }
    // auto cistr = cexpr->getAsInstruction();
    // return addr_name( cistr, gid, caddr, isLocalUse );
  }
  // We detect local use
  // jump over casting
  while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
    addr = bcast->getOperand(0);
  }
  if( auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(addr)) {
    gid = get_global_idx(gv);
    caddr = "0";//in dynamic addressing this will change
    return;
  } else if( auto gop = llvm::dyn_cast<llvm::GetElementPtrInst>(addr) ) {
    gid = get_reg( gop );
    assert( gid != "");
    caddr = get_reg_time( gop );
    return;
  } else if( auto gop = llvm::dyn_cast<llvm::GEPOperator>(addr) ) {
    gid = get_GEPOperator(gop);
    caddr = "0";
    return;
  } else if( auto alloc = llvm::dyn_cast<const llvm::AllocaInst>(addr) ) {
    gid = get_global_idx(alloc);
    caddr = "0"; //get_reg_time(gv);
    return;
  } else if( llvm::isa<const llvm::Argument>(addr) ) {
    assert(false);
  } else if( llvm::isa<llvm::Constant>(addr) ) {
    addr->dump();
    llvm_bmc_error("kbound", "constant access to the memory!");
  }

  gid = add_reg_map( addr );
  if( gid != "" ) {
    caddr = get_reg_time(addr);
    return;
  }

  LLVM_DUMP(addr);
  llvm_bmc_error( "knound", "failed to identify address" );
  assert(false);
}


// void kbound::addr_local_name( const llvm::Value* addr,
//                               std::string& gid, std::string& caddr) {
//   addr_name( addr, gid, caddr, true);
// }

void kbound::dump_FenceInst( const llvm::FenceInst* fence ) {
  auto ord = fence->getOrdering();
  if( ord == llvm::AtomicOrdering::SequentiallyConsistent) {
    dump_dmbsy();
  }else{
    llvm_bmc_error( "knound", "Other fences not implemented" );
  }
}

void kbound::dump_AtomicRMWInst( const llvm::AtomicRMWInst* rmw ) {
  //get address id
  dump_Comment( "Dumping RMW" );
  auto addr = rmw->getPointerOperand();
  std::string gid, caddr;
  addr_name( addr, gid, caddr );

  //read value
  auto w    = fresh_name();
  auto r    = add_reg_map(rmw);
  auto cw   = get_reg_time(rmw);
  auto ord  = rmw->getOrdering();
  auto d    = get_reg( rmw->getValOperand() );
  auto cd   = get_reg_time( rmw->getValOperand() );

  dump_ld( r, cw, caddr, gid, is_acquire(ord), true);

  dump_Comment("calculate update value!");
  dump_Assume_geq( cw, cd );
  switch( rmw->getOperation() ) {
  case llvm::AtomicRMWInst::BinOp::Xchg: dump_Assign( w, d ); break;
  case llvm::AtomicRMWInst::BinOp::Add : dump_Assign( w, r+"+"+d ); break;
  case llvm::AtomicRMWInst::BinOp::Sub : dump_Assign( w, r+"-"+d ); break;
  case llvm::AtomicRMWInst::BinOp::And : dump_Assign( w, r+"&&"+d ); break;
  case llvm::AtomicRMWInst::BinOp::Nand:dump_Assign(w,"!("+r+"&&"+d+")");break;
  case llvm::AtomicRMWInst::BinOp::Or  : dump_Assign( w, r+"||"+d ); break;
    // Unsupported
  case llvm::AtomicRMWInst::BinOp::Xor :
  case llvm::AtomicRMWInst::BinOp::Max :
  case llvm::AtomicRMWInst::BinOp::Min :
  case llvm::AtomicRMWInst::BinOp::UMax:
  case llvm::AtomicRMWInst::BinOp::UMin:
  default:
    llvm_bmc_error("kbound","unspported atomic rmw operation");
  }

  dump_st( w, cw, caddr, gid, is_release(ord), true);
}

void kbound::dump_AtomicCmpXchgInst( const llvm::AtomicCmpXchgInst* cxng ) {
  //get address id
  dump_Comment( "Dumping CmpXCNG" );
  auto addr = cxng->getPointerOperand();
  std::string gid, caddr;
  addr_name( addr, gid, caddr );

  //read value
  // auto w    = fresh_name();
  svec zero{"0"};
  svec one{"1"};
  auto r    = add_reg_map (cxng, zero);
  auto cr   = get_reg_time(cxng, zero);
  auto cnd  = add_reg_map (cxng, one);
  auto ccnd = get_reg_time(cxng, one);
  auto sord = cxng->getSuccessOrdering();
  // auto ford = cxng->getFailureOrdering();
  auto ov   = get_reg     ( cxng->getCompareOperand() );
  auto cov  = get_reg_time( cxng->getCompareOperand() );
  auto nv   = get_reg     ( cxng->getNewValOperand()  );
  auto cnv  = get_reg_time( cxng->getNewValOperand()  );

  dump_Assume_geq( cr, cov ); // old value must be ready
  dump_Assume_geq( cr, cnv ); // new value must be ready
  dump_ld( r, cr, caddr, gid, is_acquire(sord), true);

  dump_Assume_eq( ccnd, cr );
  dump_If( r + "==" + ov );
  dump_Assign( cnd, "1" );
  dump_st( nv, cnv, caddr, gid, is_release(sord), true );
  dump_Else();
  dump_Assign( cnd, "0" );
  dump_Close_scope();
  llvm_bmc_warning( "kbound", "Failed ordering constraints are not implementd!");
}


//--------------------------------------------------------------------------

void kbound::dump_CallAssume(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  auto term = get_reg( call->getArgOperand(0) );
  dump_Comment( "Dump assume from code");
  dump_Assume( term );
}

void kbound::dump_CallAssert(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  auto term = get_reg( call->getArgOperand(0) );
  in_code_spec.push_back( term );
}

void kbound::dump_CallNondet(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  auto term = get_reg( call->getArgOperand(0) );
  dump_String("NONDET(" + term + ");");
}



bool is_dmbsy( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z5dmbsyv"};
  return match_function_names(  call,  names );
}

bool is_dmbst( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z5dmbstv"};
  return match_function_names(  call,  names );
}

bool is_dmbld( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z5dmbldv"};
  return match_function_names(  call,  names );
}

bool is_isb( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3isbv"};
  return match_function_names(  call,  names );
}

bool is_str( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3strPii"};
  return match_function_names(  call,  names );
}

bool is_stl( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3stlPii"};
  return match_function_names(  call,  names );
}

bool is_stx( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3stxPii"};
  return match_function_names(  call,  names );
}

bool is_stlx( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z4stlxPii"};
  return match_function_names(  call,  names );
}

bool is_ldr( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3ldrPi"};
  return match_function_names(  call,  names );
}

bool is_lda( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3ldaPi"};
  return match_function_names(  call,  names );
}

bool is_ldx( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z3ldxPi"};
  return match_function_names(  call,  names );
}

bool is_ldax( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z4ldaxxPi"};
  return match_function_names(  call,  names );
}


void kbound::dump_CallInst( unsigned bidx, const llvm::CallInst* call ) {
  assert(call);
  if( llvm::isa<llvm::IntrinsicInst>(call) ) {
  } else if( is_assert(call) ) { dump_CallAssert(bidx, call);
  } else if( is_assume(call) ) { dump_CallAssume( bidx, call);
  } else if( is_nondet(call) ) { dump_CallNondet( bidx, call);
  } else if( is_dmbsy (call) ) { dump_dmbsy();
  } else if( is_dmbst (call) ) { dump_dmbst();
  } else if( is_dmbld (call) ) { dump_dmbld();
  } else if( is_isb   (call) ) { dump_isb();
  } else if( is_str   (call) ) { dump_ST_(bidx, call, false, false);
  } else if( is_stl   (call) ) { dump_ST_(bidx, call, true,  false);
  } else if( is_stx   (call) ) { dump_ST_(bidx, call, false, true );
  } else if( is_stlx  (call) ) { dump_ST_(bidx, call, true,  true );
  } else if( is_ldr   (call) ) { dump_LD_(bidx, call, false, false);
  } else if( is_lda   (call) ) { dump_LD_(bidx, call, true,  false);
  } else if( is_ldx   (call) ) { dump_LD_(bidx, call, false, true );
  } else if( is_ldax  (call) ) { dump_LD_(bidx, call, true,  true );
  }else{
    LLVM_DUMP(call);
    llvm_bmc_error("kbound", "function call is not recognized !!");
  }
}

void kbound::dump_CastInst( unsigned bidx, const llvm::CastInst* cast ) {
  auto v = cast->getOperand(0);
  auto r = get_reg(v);
  if( r != "" ) add_reg_map(cast, r);
}

void kbound::dump_AllocaInst( const llvm::AllocaInst* alloc ) {
  // std::string gid, caddr;
  // addr_name( alloc, gid, caddr);
  // auto v = cast->getOperand(0);
  // auto r = get_reg( alloc );
  // if( r != "" ) add_reg_map(cast, r);
}

//--------------------------------------------------------------------------

// void bmc_pass::get_indexes( const llvm::GEPOperator* gep,
//                             std::string& gid, svev& idxs ) {
//   assert( gep->getNumIndices() <= 3); //Confirm if correct
//   unsigned i= gep->getNumOperands() == 2 ? 1 : 2;
//   for( ; i < gep->getNumOperands(); i++ ) {
//     auto idx = gep->getOperand(i);
//     auto iname = get_reg( idx );
//     idxs.push_back(iname);
//   }
//   auto op_gep_ptr = gep->getPointerOperand();
//   while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(op_gep_ptr) ) {
//     op_gep_ptr = bcast->getOperand(0);
//   }
//   if( auto sub_gep = llvm::dyn_cast<llvm::GEPOperator>(op_gep_ptr) ) {
//     get_indexes( sub_gep, gid, idxs );
//   }else if( auto gop = llvm::dyn_cast<llvm::GlobalVariable>(addr) ) {
//     gid = get_global_idx(gv);
//   }
//   assert(false);
// }


// void kbound::get_global_id( llvm::Value* addr,
//                             std::string& gid,
//                             std::string& caddr ) {
//   // // jump over casting
//   // while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
//   //   addr = bcast->getOperand(0);
//   // }
//   if( llvm::isa<llvm::GEPOperator>(addr) ) {
//     assert(false);
//     // exprs idxs;
//     // get_indexesGEP( gop, idxs);
//     // storeToArrayHelper(bidx, store, val, idxs);
//   } else if( llvm::isa<const llvm::AllocaInst>(addr) ||
//              llvm::isa<const llvm::Argument>(addr) ) {
//     assert(false);
//   } else if( llvm::isa<llvm::Constant>(addr) ) {
//     llvm_bmc_error("bmc", "constant access to the memory!");
//   }else {
//     LLVM_DUMP( addr );
//     llvm_bmc_error("bmc", "Only local array and global write/read supported!");
//   }
// }

void kbound::dump_LoadInst( unsigned bidx, const llvm::LoadInst* load ) {
  assert( load );
  auto addr = load->getOperand(0);
  auto ord  = load->getOrdering();
  auto r = add_reg_map(load);
  auto creg = get_reg_time(load);
  std::string gid, caddr;
  addr_name( addr, gid, caddr );
  if( gid != "" ) { // Read variable is global, but used locally.
    dump_ld( r, creg, caddr, gid, is_acquire( ord ), false);
  }else{
    load->dump();
    llvm_bmc_error("kbound", "we need to support local global optimization!!");
    // addr_local_name( addr, gid, caddr );
    // dump_Assign(    r, gid    );
    // dump_Assign( creg, caddr  );
  }
}

void kbound::dump_LD_(unsigned bidx, const llvm::CallInst* call,
                      bool isAcquire, bool isExclusive) {
  auto v    = add_reg_map(call);
  auto cval = get_reg_time(call);
  std::string gid, caddr;
  addr_name(call->getArgOperand(0), gid, caddr );
  dump_ld( v, cval, caddr, gid, isAcquire, isExclusive);
}



void kbound::dump_StoreInst(unsigned bidx, const llvm::StoreInst* store ) {
  assert( store );
  auto val = store->getOperand(0);
  auto addr = store->getOperand(1);
  auto ord  = store->getOrdering();

  auto v    = get_reg(val);
  auto cval = get_reg_time(val);
  std::string gid = "";
  std::string caddr = "";
  addr_name( addr, gid, caddr );
  dump_st( v, cval, caddr, gid, is_release(ord), false);

  // // jump over casting
  // while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
  //   addr = bcast->getOperand(0);
  // }
  // if( llvm::isa<llvm::GEPOperator>(addr) ) {
  //   assert(false);
  //   // exprs idxs;
  //   // get_indexesGEP( gop, idxs);
  //   // storeToArrayHelper(bidx, store, val, idxs);
  // } else if(auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(addr)) {
  //   gid = get_global_idx(gv);
  //   caddr = "0";//in dynamic addressing this will change
  // } else if( llvm::isa<const llvm::AllocaInst>(addr) ||
  //            llvm::isa<const llvm::Argument>(addr) ) {
  //   assert(false);
  // } else if( llvm::isa<llvm::Constant>(addr) ) {
  //   llvm_bmc_error("bmc", "constant access to the memory!");
  // }else {
  //   LLVM_DUMP( store );
  //   llvm_bmc_error("bmc", "Only local array and global write/read supported!");
  // }
}


void kbound::dump_ST_(unsigned bidx, const llvm::CallInst* call,
                      bool isRelease, bool isExclusive) {
  auto val = call->getArgOperand(1);
  auto v    = get_reg(val);
  auto cval = get_reg_time(val);
  std::string gid, caddr;
  addr_name(call->getArgOperand(0), gid, caddr );
  dump_st( v, cval, caddr, gid, isRelease, isExclusive);
}


void kbound::dump_UnaryInst( unsigned bidx,
                             const llvm::UnaryInstruction* I ) {
  assert( I );

  if( auto cast = llvm::dyn_cast<llvm::CastInst>(I) ) {
    dump_CastInst( bidx, cast );
  } else if( auto alloca = llvm::dyn_cast<llvm::AllocaInst>(I) ) {
    dump_AllocaInst( alloca );
  } else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
    dump_LoadInst( bidx, load );
  } else if( auto eval = llvm::dyn_cast<llvm::ExtractValueInst>(I) ) {
    dump_ExtractValue( eval );
  } else {
    KBOUND_UNSUPPORTED_INSTRUCTIONS( VAArgInst,        I );
    // KBOUND_UNSUPPORTED_INSTRUCTIONS( ExtractValueInst, I );
    LLVM_DUMP(I);
    llvm_bmc_error("bmc", "unsupported unary instruction!!");
  }
}

void kbound::dump_PhiNode( unsigned bidx, const llvm::PHINode* phi ) {
  assert( phi );
  return;
  
  // unsigned num = phi->getNumIncomingValues();

  // if( !phi->getType()->isIntegerTy() && !phi->getType()->isFloatTy() ) {
  //   // phi->getParent()->dump();
  //   llvm_bmc_error("kbound", "phi nodes with non integers not supported !!");
  // }

  // auto v    = add_reg_map(phi);
  // auto cval = get_reg_time(phi);

  // // std::vector<expr> phi_cons;
  // for( unsigned i = 0 ; i < num ; i++ ) {
  //   auto prev    = phi->getIncomingBlock(i);
  //   auto prev_v_ = phi->getIncomingValue(i);
  //   auto v_      = get_reg( prev_v_ );
  //   auto cval_   = get_reg_time( prev_v_ );

  //   // condition to skip??
  //   std::vector<unsigned> pre_bidxes;
  //   for( unsigned pre_b_local: bmc_ds_ptr->pred_idxs[bidx]) {
  //     if( prev == bmc_ds_ptr->bb_vec[pre_b_local] ) {
  //       pre_bidxes.push_back( pre_b_local );
  //     }
  //   }
  //   assert( pre_bidxes.size() < 2 );
  //   //todo: check if this works
  //   for( unsigned pre_bidx : pre_bidxes) {
  //     dump_If( get_path(pre_bidx) + "== 1"  );
  //     dump_Assign( v, v_ );
  //     dump_Assume_geq( cval, cval_ );
  //     dump_Close_scope();
  //   }
  // }

}

void kbound::dump_PhiNodes( const bb* b, const bb* prev_b ) {
  for( const llvm::Instruction& Iobj : b->getInstList() ) {
    const llvm::Instruction* I = &(Iobj);
    if( auto phi = llvm::dyn_cast<llvm::PHINode>(I) ) {
      unsigned num = phi->getNumIncomingValues();
      // if( !phi->getType()->isIntegerTy() && !phi->getType()->isFloatTy() ) {
      //   // phi->getParent()->dump();
      //   llvm_bmc_error("kbound","phi nodes with non integers not supported!!");
      // }
      auto v    = add_reg_map(phi);
      auto cval = get_reg_time(phi);
      for( unsigned i = 0 ; i < num ; i++ ) {
        if( phi->getIncomingBlock(i) != prev_b) continue;
        auto prev_v_ = phi->getIncomingValue(i);
        if( llvm::isa<llvm::UndefValue>(prev_v_) ) continue;
        auto v_      = get_reg( prev_v_ );
        auto cval_   = get_reg_time( prev_v_ );
        dump_Assign( v, v_ );
        dump_Assume_geq( cval, cval_ );
      }

    }else{
      break;
    }
  }
}

void kbound::dump_SelectInst( const llvm::SelectInst *sel ) {
  assert( sel );
  auto cond = sel->getCondition();
  auto tval = sel->getTrueValue();
  auto fval = sel->getFalseValue();

  auto ro = add_reg_map( sel );
  auto rc = get_reg( cond );
  auto rt = get_reg( tval );
  auto rf = get_reg( fval );

  auto cro = get_reg_time( sel  );
  auto crc = get_reg_time( cond );
  auto crt = get_reg_time( tval );
  auto crf = get_reg_time( fval );

  dump_If( rc );
  dump_Assign( ro, rt);
  dump_Assign_max( cro, crc, crt );
  dump_Else();
  dump_Assign( ro, rf);
  dump_Assign_max( cro, crc, crf );
  dump_Close_scope();

}

void kbound::dump_SwitchInst( unsigned bidx,
                              const llvm::SwitchInst *swch ) {
  assert( swch );

  auto cond = swch->getCondition();
  dump_Comment( "Switch statement");
  //dumping control ordring
  auto ctrl = "ctrl["+tid+"]";
  dump_Assign("old_ctrl", ctrl);
  dump_Assign_rand_ctx( ctrl );
  dump_Assume_geq( ctrl, "old_ctrl" );
  if( exists( ctrl_dep_ord, (const void *)cond ) ) {
    for( auto& dep : ctrl_dep_ord.at(cond) ) {
      dump_Assume_geq( "ctrl["+tid+"]", dep);
    }
  }else{
    auto cr = get_reg_time( cond );
    dump_Assume_geq( "ctrl["+tid+"]", cr );
  }


  // dumping jump
  auto r = get_reg( cond );
  for( unsigned i = 1; i < swch->getNumSuccessors(); i++ ) {
    auto val = get_reg( swch->getOperand(2*i) );
    if (i == 1) {
      dump_If( r + " == " + val );
    }else{
      dump_ElseIf( r + " == " + val );
    }
    auto succ = swch->getSuccessor(i);
    auto succ_bidx =bmc_ds_ptr->find_block_idx( succ );
    dump_PhiNodes( succ, bmc_ds_ptr->bb_vec[bidx] );
    dump_Goto( block_name(succ_bidx) );
  }
  dump_Else();
  auto succ = swch->getSuccessor(0);
  auto succ_bidx = bmc_ds_ptr->find_block_idx( succ );
  dump_PhiNodes( succ, bmc_ds_ptr->bb_vec[bidx] );
  dump_Goto( block_name(succ_bidx) );
  dump_Close_scope();

}


void kbound::dump_Branch( unsigned bidx, const llvm::BranchInst* br ) {
  assert( br );

  if( !br->isUnconditional() ) {
    auto cond = br->getCondition();

    //dumping control ordring
    auto ctrl = "ctrl["+tid+"]";
    dump_Assign("old_ctrl", ctrl);
    dump_Assign_rand_ctx( ctrl );
    dump_Assume_geq( ctrl, "old_ctrl" );
    if( exists( ctrl_dep_ord, (const void *)cond ) ) {
      for( auto& dep : ctrl_dep_ord.at(cond) ) {
        dump_Assume_geq( "ctrl["+tid+"]", dep);
      }
    }else{
      auto cr = get_reg_time( cond );
      dump_Assume_geq( "ctrl["+tid+"]", cr );
    }

    // dumping jump
    auto r = get_reg( br->getCondition() );
    dump_If( r );
    auto succ_bidx = bmc_ds_ptr->find_block_idx( br->getSuccessor(0) );
    dump_PhiNodes( br->getSuccessor(0), bmc_ds_ptr->bb_vec[bidx] );
    dump_Goto( block_name(succ_bidx) );
    dump_Else();
    succ_bidx = bmc_ds_ptr->find_block_idx( br->getSuccessor(1) );
    dump_PhiNodes( br->getSuccessor(1), bmc_ds_ptr->bb_vec[bidx] );
    dump_Goto( block_name(succ_bidx) );
    dump_Close_scope();
  }else{
    auto succ_bidx = bmc_ds_ptr->find_block_idx( br->getSuccessor(0) );
    dump_PhiNodes( br->getSuccessor(0), bmc_ds_ptr->bb_vec[bidx] );
    dump_Goto( block_name(succ_bidx) );
    // for unconditional branch, there is no need of constraints
    // bmc_ds_ptr->bmc_vec.push_back( exit_bit );
  }
}

void kbound::dump_UnreachableInst( unsigned bidx,
                                   const llvm::UnreachableInst *I) {
  auto r = add_reg_map( I );
  dump_Assign( r, "1" );
  in_code_spec.push_back( r + "== 0" );
}



void kbound::dump_Block( unsigned bidx, const bb* b ) {
  assert( b );
  dump_Label(std::to_string(bidx));
  // auto path = get_path(bidx);
  // dump_Assign( path, "1");

  for( const llvm::Instruction& Iobj : b->getInstList() ) {
    const llvm::Instruction* I = &(Iobj);
    dump_Comment( toString( I ) );
    if(auto bop = llvm::dyn_cast<llvm::BinaryOperator>(I) ) {
      dump_BinOp( bidx, bop );
    }else if( auto phi = llvm::dyn_cast<llvm::PHINode>(I) ) {
      dump_PhiNode( bidx, phi );
    } else if( auto cmp = llvm::dyn_cast<llvm::CmpInst>(I) ) {
      dump_CmpInst( bidx, cmp );
    } else if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
      dump_CallInst(bidx, call);
    } else if( auto unary = llvm::dyn_cast<llvm::UnaryInstruction>(I) ) {
      dump_UnaryInst( bidx, unary );
    } else if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
      dump_StoreInst( bidx, store );
    } else if( auto rmw = llvm::dyn_cast<llvm::AtomicRMWInst>(I) ) {
      dump_AtomicRMWInst( rmw );
    } else if( auto xchg = llvm::dyn_cast<llvm::AtomicCmpXchgInst>(I) ) {
      dump_AtomicCmpXchgInst( xchg );
    } else if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(I) ) {
      dump_GetElementPtrInst( gep );
      // Terminator instructions
    } else if( auto fence = llvm::dyn_cast<llvm::FenceInst>(I) ) {
      dump_FenceInst( fence );
    } else if( auto br = llvm::dyn_cast<llvm::BranchInst>(I) ) {
      dump_Branch( bidx, br );
    } else if( auto ret = llvm::dyn_cast<llvm::ReturnInst>(I) ) {
      dump_RetInst( ret );
    } else if( auto swch = llvm::dyn_cast<llvm::SwitchInst>(I) ) {
      dump_SwitchInst(bidx, swch);
    } else if( auto sel = llvm::dyn_cast<llvm::SelectInst>(I) ) {
      dump_SelectInst(sel);
    } else if( auto unreach = llvm::dyn_cast<llvm::UnreachableInst>(I) ) {
      dump_UnreachableInst(bidx, unreach);
    // } else if( auto lpad = llvm::dyn_cast<llvm::LandingPadInst>(I) ) {
    //   dump_LandingPadInst(bidx, lpad);
    // } else if( auto invoke = llvm::dyn_cast<llvm::InvokeInst>(I) ) {
    //   dump_InvokeInst(bidx, invoke);
    // } else if( auto terminate = llvm::dyn_cast<llvm::TerminatorInst>(I)) {
    //   dump_TerminatorInst( bidx, terminate );
    } else {
      //Unsupported terminator instructions
      KBOUND_UNSUPPORTED_INSTRUCTIONS( IndirectBrInst,    I );
      //KBOUND_UNSUPPORTED_INSTRUCTIONS( InvokeInst,        I );
      KBOUND_UNSUPPORTED_INSTRUCTIONS( ResumeInst,        I ); // passing exception to caller
      KBOUND_UNSUPPORTED_INSTRUCTIONS( CatchSwitchInst,   I );
      KBOUND_UNSUPPORTED_INSTRUCTIONS( CatchReturnInst,   I );
      KBOUND_UNSUPPORTED_INSTRUCTIONS( CleanupReturnInst, I );

      //Other unsupported instructions
      KBOUND_UNSUPPORTED_INSTRUCTIONS( FuncletPadInst,     I);
      // todo: cases for funclet CleanupPadInst, CatchPadInst
      KBOUND_UNSUPPORTED_INSTRUCTIONS( BinaryOperator,     I);
      // KBOUND_UNSUPPORTED_INSTRUCTIONS( FenceInst,          I);
      // KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicCmpXchgInst,  I);
      // KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicRMWInst,      I);
      // KBOUND_UNSUPPORTED_INSTRUCTIONS( SelectInst,         I);
      KBOUND_UNSUPPORTED_INSTRUCTIONS( ExtractElementInst, I);
      KBOUND_UNSUPPORTED_INSTRUCTIONS( InsertElementInst,  I);
      KBOUND_UNSUPPORTED_INSTRUCTIONS( ShuffleVectorInst,  I);
      KBOUND_UNSUPPORTED_INSTRUCTIONS( InsertValueInst,    I);
      // KBOUND_UNSUPPORTED_INSTRUCTIONS( LandingPadInst,     I); // allocates exception object 
      LLVM_DUMP( I );
      llvm_bmc_error("bmc", "unsupported instruction");
    }
    dump_Newline();
  }
  // dump_CommentProperty( bidx, b);
}

void kbound::dump_Thread() {
  dump_Comment( "Dumping thread "+ tid );
  // for( unsigned i = 0; i < bmc_ds_ptr->bb_vec.size(); i++ ) {
  //   dump_Assign( "char "+ get_path(i), "0" );
  // }
  dump_Assign( "int ret_thread_"+ tid, "0" );
  unsigned bidx = 0;
  for( const bb* src : bmc_ds_ptr->bb_vec ) {
    dump_Block( bidx, src );
    bidx++;
  }
  dump_Newline();
}

  // for( auto ary: reg_list ) dump_Decl_array("int", ary,reg_copy_size);
  // dump_Newline();

  // for( auto ary: time_list ){
  //   dump_Decl_array("int", ary, mem_copy_size);
  // }
  // dump_Newline();

  // for( std::string ary: val_list ) {
  //   dump_Decl_array( "int", ary+"_", mem_vers_size );
  //   dump_Define( ary + "(x,k)", ary + "_[x*NCONTEXT+k]" );
  // }
  // dump_Newline();


  // auto thread_name = thread.name;
  // for( llvm::Function& f : module->functions() ) {
  //   std::string fname = demangle(f.getName().str());
  //   if( fname == thread.entry_function ) {
  //     populate_array_name_map(&f);
  //     auto bmc_fun_ptr = new bmc_fun(o, ary_to_int, bmc_obj.m_model);
  //     bmc_ds_ptr = bmc_fun_ptr; // set the pointer in base cla
  //     bmc_fun_ptr->fun_initialize( this, f);
  //   }
  // }

  //initializing timing constraints
  // dump_For("char", "p", "NPROC");
  // dump_For("char", "x", "ADDRSIZE");
  // for( auto ary: time_list ) dump_String( ary + "_(p,x) = 0;" );
  // dump_Close_scope();
  // for( auto ary: proc_list ) dump_String( ary + "[p] = 0;" );
  // dump_Close_scope();
  // dump_Newline();

  //initializing value arrays
  // dump_For("char", "x", "ADDRSIZE");
  // for( auto ary: val_list ) dump_String( ary + "_(x,0) = 0;" );
  // dump_For("char", "k", "1", "NCONTEXT");
  // for( auto ary: val_init_list ) dump_String( ary + "_(x,k) = __get_rng();" );
  // for( auto ary: val_list ) dump_String( ary + "_(x,k) = "+ary+"init_(x,k);" );
  // dump_Close_scope();
  // dump_Close_scope();
  // dump_Newline();
