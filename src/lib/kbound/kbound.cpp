#include "lib/kbound/kbound.h"
#include "include/bmc.h"

#define KBOUND_UNSUPPORTED_INSTRUCTIONS( InstTYPE, Inst )               \
  if(llvm::isa<llvm::InstTYPE>(Inst) ) {                                \
    std::cerr << "Occuring in block:\n";                                \
    LLVM_DUMP( Inst->getParent() )                                      \
    LLVM_DUMP( Inst )                                                   \
    llvm_bmc_error( "kbound", "Unsupported instruction!!");             \
  }

typedef std::vector<std::string> svec;

char kbound::ID = 0;

kbound::kbound( options& o_, std::unique_ptr<llvm::Module>& m_,
                bmc& bmc_ )
  : bmc_pass( o_, o_.solver_ctx, bmc_ )
  , llvm::FunctionPass(ID)
  , module(m_)
  , ofcpp(o_.outDirPath.string()+"/cmbc.cpp")
  , current_indent(0)
{
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

//----------------------------------------------------------------------------
//

// void kbound::add_path( const llvm::BasicBlock* b, std::string path ) {
//   path_name[b] = path;
// }

std::string kbound::get_path( unsigned bidx ) {
  return "path_"+tid+"_"+std::to_string(bidx);
}

// std::string kbound::get_path_time( const llvm::BasicBlock* b) {
//   return "creg_"+path_name.at(b);
// }

// std::string kbound::add_path( const llvm::BasicBlock* b) {
//   add_path(b, "r"+std::to_string(ssa_count));
//   ssa_count++;
//   return get_path(v);
// }

void kbound::add_reg_map( const llvm::Value* v, std::string name) {
  // v->print( llvm::outs() );std::cout<< "\n";
  ssa_name[v] = name;
}

std::string kbound::get_reg( const llvm::Value* v) {
  // return ssa_name[v];
  auto s = read_const_str( o, v );
  if( s != "" ) {
    return s;
  }
  return ssa_name.at(v);
}

std::string kbound::get_reg_time( const llvm::Value* v) {
  // return ssa_name[v];
  auto s = read_const_str( o, v );
  if( s != "" ) {
    return "0";
  }
  return "creg_"+ssa_name.at(v);
}

std::string kbound::add_reg_map( const llvm::Value* v) {
  v->print( llvm::outs() ); std::cout<< "\n";
  // assert(false); //implement constant
  // ssa_name[v] = "r"+std::to_string(ssa_count);
  add_reg_map(v, "r"+std::to_string(ssa_count));
  ssa_count++;
  return get_reg(v);
}

std::string kbound::get_global_idx( const llvm::GlobalVariable* v) {
  // std::cout << "Global size:" << bmc_obj.m_model.ind_in_mem_state.size();
  // bmc_obj.m_model.print();
  unsigned gid = bmc_obj.m_model.ind_in_mem_state.at(v);
  return std::to_string(gid);
}

//----------------------------------------------------------------------------
// Dumping sequencial encoding of the concurrent progam in a file

void kbound::dump_Newline() { ofcpp << "\n"; }

void kbound::dump_String(std::string s) {
  dump_Indent();
  ofcpp << s << "\n";
}

void kbound::dump_Label(std::string s) {
  ofcpp << "T"<< tid <<"BLOCK" << s << ":\n";
}

void kbound::dump_Goto(std::string s) {
  dump_String( "goto " + s + ";");
}

std::string kbound::block_name(unsigned bidx) {
  return "T"+tid+"BLOCK"+std::to_string(bidx);
}

void kbound::dump_Assume(std::string s) { dump_String("ASSUME("+s+");"); }
void kbound::dump_Assume_geq(std::string s1,std::string s2) {
  if (s1 == s2) return;
  dump_Assume( s1 + " >= "+ s2 );
}

void kbound::dump_Assume_geq_max(std::string s1,std::string s2,std::string s3) {
  dump_Assume_geq( s1 ,"max("+ s2 +","+ s3 + ")" );
}

void kbound::dump_Assign(std::string r, std::string term) {
  dump_String( r + " = "+ term + ";" );
}

void kbound::dump_Decl_assign(std::string r, std::string term) {
  dump_Assign( "int " + r, term );
}

void kbound::dump_Assign_rand(std::string v, std::string b ) {
  dump_String( v + " = get_rng(0," + b + ");" );
}

void kbound::dump_Assign_max( std::string v, std::string r1, std::string r2 ) {
  dump_String( v + " = max(" + r1 + ","+ r2 + ");" );
}

void kbound::dump_Assign_max( std::string v, std::string r2 ) {
  dump_Assign_max(v,v,r2);
}

void kbound::dump_Assign_rand_ctx(std::string v) {
  dump_Assign_rand( v, "NCONTEXT-1" );
}

void kbound::dump_Comment(std::string s) { dump_String("// "+s); }

void kbound::dump_Indent() {
  for(unsigned i=0; i < current_indent; i++ ) ofcpp << "  ";
}

void kbound::dump_Define(std::string name, std::string val) {
  dump_Indent();
  ofcpp << "#define " <<  name << " "<< val << "\n";
}

void kbound::dump_Decl_scalar(std::string type, std::string name) {
  dump_Indent();
  ofcpp << type << " " << name << ";\n";
}

void kbound::
dump_Decl_array(std::string type, std::string name, std::string size) {
  dump_Indent();
  ofcpp << type << " " << name << "["<< size <<"];\n";
}

void kbound::
dump_Decl_fun(std::string type, std::string name, std::string param) {
  dump_Indent();
  ofcpp << type << " " << name << "("<< param <<") {\n";
  current_indent++;
}

void kbound::dump_For(std::string type, std::string v, std::string b) {
  dump_For( type, v, "0", b);
}

void kbound::
dump_For(std::string type, std::string v, std::string s, std::string b) {
  dump_Indent();
  ofcpp <<"for(" << type << " "<< v << " = "<< s<< "; "
        << v << " < "<< b << "; " << v << "++) {\n";
  current_indent++;
}

void kbound::dump_If(std::string s) {
  dump_String( "if("+ s + ") {" );
  current_indent++;
}

void kbound::dump_Else() {
  current_indent--;
  dump_String( "} else {" );
  current_indent++;
}

void kbound::
dump_Close_scope() {
  assert(current_indent > 0);
  current_indent--;
  dump_Indent();
  ofcpp <<"}\n";
}

void kbound::dump_Macors(std::string name, std::string val) {
  dump_Indent();
  ofcpp << "#define " <<  name << " "<< val << "\n";
}

void kbound::dump_Arrays( std::string type,
                          svec arys,
                          std::string dim1, std::string dim2 ) {
  for( std::string ary: arys ) {
    dump_Decl_array( type, ary+"_", dim1+"*"+dim2 );
    dump_Define( ary + "(x,k)", ary + "_[x*"+dim2+"+k]" );
  }
  dump_Newline();
}


bool kbound::runOnFunction( llvm::Function &f ) {
  EntryFn = demangle(f.getName().str());
  std::cout<< "Function " << EntryFn << "\n";
  unsigned j = 0;
  for (;j < bmc_obj.threads.size(); j++) {
    if (bmc_obj.threads[j].entry_function == EntryFn) break;
  }
  if( j == bmc_obj.threads.size() ) return false;
  thread_id = j;
  tid = std::to_string(thread_id);
  thread_name = bmc_obj.threads.at(j).name;

  populate_array_name_map(&f);
  auto bmc_fun_ptr = new bmc_fun(o, ary_to_int, bmc_obj.m_model);
  bmc_ds_ptr = bmc_fun_ptr; // set the pointer in base cla
  bmc_fun_ptr->fun_initialize( this, f);
  // bmc_ds_ptr->thread_id = bmc_obj.threads.at(j).thread_num;

  dump_Params(f);
  // dump_Thread();
  dump_Thread();
  return false;
}




void kbound::prefix_seq() {

  //
  // todo: pickup these values from bmc_obj
  //
  std::cout << "Running k bound\n";
  
  dump_Define( "ADDRSIZE", std::to_string( bmc_obj.m_model.state_size() ) );
  dump_Define( "NPROC"   , std::to_string( bmc_obj.threads.size() ) );
  dump_Define( "NCONTEXT", std::to_string(ncontext) );
  dump_Newline();

  // dump_Comment("declare arrays for register values");
  // reg_vals = { "reg" }; //"ireg",
  // dump_Arrays( "int", reg_vals, "NPROC", "NREGS");

  dump_Comment("declare arrays for value version in contexts");
  val_init_list = {"muinit", "nwinit", "deltainit"};
  dump_Arrays( "int", val_init_list, "ADDRSIZE", "NCONTEXT");
  val_list = { "mu", "nw",  "delta"};
  dump_Arrays( "int", val_list, "ADDRSIZE", "NCONTEXT");

  dump_Comment("declare arrays for context stamps");
  time_list = { "nu", "pw", "cr", "iw", "cw", "cx", "is", "cs"};
  dump_Arrays( "int", time_list, "NPROC", "ADDRSIZE");

  // dump_Comment("declare arrays for registers");
  // reg_list = { , "creg" }; //"ireg",
  // dump_Arrays( "int", reg_list, "NPROC", "NREGS");

  dump_Comment("declare arrays for synchronizations");
  proc_list = { "cl", "cdy", "cds", "cdl", "cisb", "caddr", "ctrl" };
  for( auto ary: proc_list ) dump_Decl_array("int", ary, "NPROC");
  dump_Newline();

  dump_Comment( "declare arrays for contexts activity" );
  ctx_list = {"active","ctx_used"};
  for( auto ary: ctx_list ) dump_Decl_array( "int", ary, "NCONTEXT" );
  dump_Newline();

  var_list = { "old_cr", "old_cdy", "old_cw", //, "new_iw", "new_cw",  // "new_ireg", "new_creg"
  };
  for( auto v: var_list ) dump_Decl_scalar( "int", v);
  dump_Newline();

  dump_Define("ASSUME(stmt)", "__CPROVER_assume(stmt)");
  dump_Define("ASSERT(stmt)", "__CPROVER_assert(stmt, \"error\")");
  dump_Newline();

  dump_Define("max(a,b)", "{a>b?a:b}");
  dump_Newline();

  dump_String("char __get_rng();");
  dump_String("char get_rng( char from, char to ) {");
  dump_String("   char ret = __get_rng();");
  dump_String("   ASSUME(ret >= from && ret <= to);");
  dump_String("   ctx_used[ret] = 1;");
  dump_String("   return ret;");
  dump_String("}");

  dump_String("char get_rng_th( char from, char to ) {");
  dump_String("   char ret = __get_rng();");
  dump_String("   ASSUME(ret >= from && ret <= to);");
  dump_String("   return ret;");
  dump_String("}");
  dump_Decl_fun("int", "main", "int argc, char **argv");


  dump_String("__LOCALS__");

  //initializing timing constraints
  // dump_For("char", "p", "NPROC");
  // dump_For("char", "x", "ADDRSIZE");
  // for( auto ary: time_list ) dump_String( ary + "_(p,x) = 0;" );
  // dump_Close_scope();
  // for( auto ary: proc_list ) dump_String( ary + "[p] = 0;" );
  // dump_Close_scope();
  // dump_Newline();

  for( unsigned p = 0; p < bmc_obj.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < bmc_obj.m_model.state_size(); x++ ) {
      auto xn = std::to_string(x);
      for( auto ary: time_list ) dump_String( ary + "("+pn+","+xn+") = 0;" );
    }
    for( auto ary: proc_list ) dump_String( ary + "["+ pn + "] = 0;" );
  }

  //initializing value arrays
  // dump_For("char", "x", "ADDRSIZE");
  // for( auto ary: val_list ) dump_String( ary + "_(x,0) = 0;" );
  // dump_For("char", "k", "1", "NCONTEXT");
  // for( auto ary: val_init_list ) dump_String( ary + "_(x,k) = __get_rng();" );
  // for( auto ary: val_list ) dump_String( ary + "_(x,k) = "+ary+"init_(x,k);" );
  // dump_Close_scope();
  // dump_Close_scope();
  // dump_Newline();

  auto num_proc  = std::to_string(bmc_obj.m_model.state_size()-1);
  for( unsigned k = 0; 0 < ncontext; k++ ) {
    auto kn = std::to_string(k);
    dump_Assign( "active["+kn+"]", "get_rng_th(0," + num_proc +")" );
  }
  for( unsigned x = 0; x < bmc_obj.m_model.state_size(); x++ ) {
    auto xn = std::to_string(x);
    for( auto ary: val_list ) dump_String( ary + "("+xn+",0) = 0;" );
    for( unsigned k = 1; k < ncontext; k++ ) {
      auto kn = std::to_string(k);
      auto xkn = "("+xn+","+kn+")";
      for( auto ary: val_init_list ) dump_String(ary +xkn+" = __get_rng();");
      for( auto ary: val_list ) dump_Assign( ary+xkn, ary+"init"+xkn );

    }
  }

}

void kbound::postfix_seq() {
  //initializing value matching
  for( unsigned x = 0; x < bmc_obj.m_model.state_size(); x++ ) {
    auto xn = std::to_string(x);
    for( unsigned k = 1; k < ncontext-1; k++ ) {
      auto xkn = "("+xn+","+std::to_string(k)+")";
      auto xknp = "("+xn+","+std::to_string(k+1)+")";
      for( auto ary: val_list ) dump_Assume(ary+"init"+xknp +" == "+ary+xkn);
    }
  }

  // dump_For("char", "x", "ADDRSIZE");
  // dump_For("char", "k", "NCONTEXT-1");
  // for( auto ary: val_list )
  //   dump_Assume( ary+"_(x,k) == " + ary + "init_(x,k+1)" );
  // dump_Close_scope();
  // dump_Close_scope();
  dump_Newline();

  dump_Close_scope();
}

void kbound::dump_locals() {

  std::ifstream in(o.outDirPath.string()+"/cmbc.cpp");
  std::ofstream out(o.outDirPath.string()+"/cbmc_out.cpp");
  std::string line;
    while (getline(in, line)) {
      if( line == "  __LOCALS__") {
        for( auto& pair : ssa_name ) {
          auto& name = pair.second;
          if( name[0] != 'r') continue;
          out << "  int " << name << "= 0;\n";
          out << "  char " << get_reg_time(pair.first) << "= 0;\n";
        }
        for( auto& v : var_list ) {
          out << "  char " << v << "= 0;\n";
        }
      }else{
        out << line << "\n";
      }
    }
    in.close();
    out.close();
}

void kbound::dump_Active( std::string ctx) {
  dump_Assume("active["+ctx+"] == "+tid);
}

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

  unsigned op = bop->getOpcode();
  expr result = solver_ctx.bool_val(true);
  switch( op ) {
  case llvm::Instruction::Add : dump_Decl_assign( ro, r1 +" + "+ r2); break;
  case llvm::Instruction::Sub : dump_Decl_assign( ro, r1 +" - "+ r2); break;
  case llvm::Instruction::Mul : dump_Decl_assign( ro, r1 +" * "+ r2); break;
  default: {
    const char* opName = bop->getOpcodeName();
    llvm_bmc_error("kbound", "unsupported instruction \"" << opName << "\" occurred!!");
   }
  }

  auto rt  = get_reg_time( bop );
  auto r1t = get_reg_time( op0 );
  auto r2t = get_reg_time( op1 );

  dump_Assign_rand_ctx( rt );
  dump_Active( rt );
  dump_Assign_max( rt, r1t, r2t );

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

void kbound::dump_CallAssume(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  auto term = get_reg( call->getArgOperand(0) );
  dump_Assume( term );
}

void kbound::dump_CallAssert(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  auto term = get_reg( call->getArgOperand(0) );
  dump_String("ASSERT(" + term + ");");
}

void kbound::dump_CallNondet(unsigned bidx, const llvm::CallInst* call) {
  assert(call);
  auto term = get_reg( call->getArgOperand(0) );
  dump_String("NONDET(" + term + ");");
}

void kbound::dump_geq_globals( std::string c, std::string prop ) {
  for( auto pair : bmc_obj.m_model.ind_in_mem_state ) {
    auto gid = std::to_string(pair.second);
    dump_Assume_geq( c, prop+"(" + tid +","+ gid+")" );
  }
}

void kbound::dump_dmbsy() {
  auto cdy = "cdy["+tid+"]";
  dump_Comment("dumbsy: Guess");
  dump_Assign("old_cdy", cdy);
  dump_Assign_rand_ctx( cdy );
  dump_Comment("Check");
  dump_Assume_geq( cdy, "old_cdy" );

  dump_Assume_geq( cdy, "cisb[" + tid + "]" );
  dump_Assume_geq( cdy, "cdy["  + tid + "]" );
  dump_Assume_geq( cdy, "cdl["  + tid + "]" );
  dump_Assume_geq( cdy, "cds["  + tid + "]" );
  dump_Assume_geq( cdy, "ctrl[" + tid + "]" );

  dump_geq_globals( cdy, "cw");

}

void kbound::dump_dmbld() {
  auto cdl = "cdl["+tid+"]";
  dump_Comment("dumbld: Guess");
  dump_Assign_rand_ctx( cdl );
  dump_Comment("Check");
  dump_Assume_geq( cdl, "cdy[" + tid + "]" );
  dump_geq_globals( cdl, "cr");
}

void kbound::dump_dmbst() {
  auto cds = "cds["+tid+"]";
  dump_Comment("dumbst: Guess");
  dump_Assign_rand_ctx( cds );
  dump_Comment("Check");
  dump_Assume_geq( cds, "cdy[" + tid + "]" );
  dump_geq_globals( cds, "cw");
  // for( auto pair : bmc_obj.m_model.ind_in_mem_state ) {
  //   auto gid = std::to_string(pair.second);
  //   dump_Assume_geq( cds, "cw_(" + tid +","+ gid+")" );
  // }
}

void kbound::dump_isb() {
  auto cisb = "cisb["+tid+"]";
  dump_Comment("isb: Guess");
  dump_Assign_rand_ctx( cisb );
  dump_Comment("Check");
  dump_Assume_geq( cisb, "cdy["   + tid + "]" );
  dump_Assume_geq( cisb, "ctrl["  + tid + "]" );
  dump_Assume_geq( cisb, "caddr[" + tid + "]" );
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

void kbound::dump_CallInst( unsigned bidx, const llvm::CallInst* call ) {
  assert(call);
  if( llvm::isa<llvm::IntrinsicInst>(call) ) {
  } else if( is_assert(call) ) {
    dump_CallAssert(bidx, call);
  } else if( is_assume(call) ) {
    dump_CallAssume( bidx, call);
  } else if( is_nondet(call) ) {
    dump_CallNondet( bidx, call);
  } else if( is_dmbsy(call) ) {
    dump_dmbsy();
  } else if( is_dmbst(call) ) {
    dump_dmbst();
  } else if( is_dmbld(call) ) {
    dump_dmbld();
  } else if( is_isb(call)   ) {
    dump_isb();
  }else{
    LLVM_DUMP(call);
    llvm_bmc_error("kbound", "function call is not recognized !!");
  }
}

void kbound::dump_CastInst( unsigned bidx, const llvm::CastInst* cast ) {
  auto v = cast->getOperand(0);
  auto r = get_reg(v);
  add_reg_map(cast, r);
}

void kbound::dump_LoadInst( unsigned bidx, const llvm::LoadInst* load ) {
  assert( load );
  auto r = add_reg_map(load);
  auto creg = get_reg_time(load);
  auto addr = load->getOperand(0);
  std::string gid = "";
  std::string caddr = "";
  // jump over casting
  while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
    addr = bcast->getOperand(0);
  }
  if( auto gop = llvm::dyn_cast<llvm::GEPOperator>(addr) ) {
    assert(false);
    // add address dependencies
    // ASSUME(cr >= all_depend_regs);
    // accessing arrays
  } else if( auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(addr) ) {
    gid = get_global_idx(gv);
    caddr = "0";//in dynamic addressing this will change
  } else if( llvm::isa<const llvm::AllocaInst>(addr) ) {
    assert(false);
  } else {
    LLVM_DUMP( load );
    llvm_bmc_error("kbound", "Only array and global write/read supported!");
  }
  dump_ld( r, creg, caddr, gid);
}

void kbound::
dump_ld( std::string r, std::string cval,std::string caddr, std::string gid) {
  bool isAcquire = true;
  bool isExclusive = true;

  auto gaccess = "("+ tid + ","+ gid + ")";
  auto cr = "cr"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Comment("LD: Guess");
  dump_Assign( "old_cr",  cr);
  dump_Assign_rand_ctx( cr );

  dump_Comment("Check");
  dump_Active( cr );
  dump_Assume_geq( cr, "iw"+gaccess );
  dump_Assume_geq( cr, caddr );
  dump_Assume_geq( cr, "cdy[" + tid + "]" );
  dump_Assume_geq( cr, "cisb["+ tid + "]" );
  dump_Assume_geq( cr, "cdl[" + tid + "]" );
  dump_Assume_geq( cr, "cl["  + tid + "]" );
  if( isExclusive ) dump_Assume_geq( cr, "old_cr" );
  if( isAcquire ) dump_Assume_geq( cr, "cx"+gaccess ); // extra in lda
  if( isAcquire ) dump_geq_globals( cr, "cs"); // extra in lda

  dump_Comment("Update");
  dump_Assign( cval, cr );
  dump_Assign_max( "caddr["+tid+"]", caddr);
  dump_If( cr + " < " + "cw"+gaccess );
  dump_Assign(r, "nu"+gaccess);
  dump_Else();
  dump_If( "pw" +gaccess + " != " + "nw"+gctx_access );
  dump_Assume_geq( cr, "old_cr" );
  dump_Close_scope();
  dump_Assign( "pw"+gaccess, "nw"+ gctx_access );
  dump_Assign( r, "mu"+ gctx_access );
  dump_Close_scope();

  if( isAcquire   ) dump_Assign_max( "cl[" + tid + "]", cr   );
  if( isExclusive ) dump_Assign( "delta"+gctx_access, tid );
}


void kbound::dump_StoreInst(unsigned bidx, const llvm::StoreInst* store ) {
  assert( store );
  auto val = store->getOperand(0);
  auto addr = store->getOperand(1);
  auto v    = add_reg_map(val);
  auto cval = get_reg_time(val);
  std::string gid = "";
  std::string caddr = "";

  // jump over casting
  while( auto bcast = llvm::dyn_cast<const llvm::BitCastInst>(addr) ) {
    addr = bcast->getOperand(0);
  }
  if( llvm::isa<llvm::GEPOperator>(addr) ) {
    assert(false);
    // exprs idxs;
    // translateGEP( gop, idxs);
    // storeToArrayHelper(bidx, store, val, idxs);
  } else if(auto gv = llvm::dyn_cast<const llvm::GlobalVariable>(addr)) {
    gid = get_global_idx(gv);
    caddr = "0";//in dynamic addressing this will change
  } else if( llvm::isa<const llvm::AllocaInst>(addr) ||
             llvm::isa<const llvm::Argument>(addr) ) {
    assert(false);
  } else if( llvm::isa<llvm::Constant>(addr) ) {
    llvm_bmc_error("bmc", "constant access to the memory!");
  }else {
    LLVM_DUMP( store );
    llvm_bmc_error("bmc", "Only local array and global write/read supported!");
  }
  dump_st( v, cval, caddr, gid);
}

void kbound::
dump_st( std::string v, std::string cval,std::string caddr, std::string gid) {
  bool isRelease = true;
  bool isExclusive = true;

  auto gaccess = "("+ tid + ","+ gid + ")";
  auto iw = "iw"+gaccess;
  auto cw = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cw + ")";

  dump_Comment("ST: Guess");
  dump_Assign_rand_ctx( iw );
  dump_Assign( "old_cw",  cw);
  dump_Assign_rand_ctx( cw );

  dump_Comment("Check");
  dump_Active( iw );
  dump_Active( cw );
  dump_Assume_geq( iw, cval  );
  dump_Assume_geq( iw, caddr );
  dump_Assume_geq( cw, iw );
  dump_Assume_geq( cw, "old_cw" );
  dump_Assume_geq( cw, "cr"    + gaccess   );
  dump_Assume_geq( cw,    "cl[" + tid + "]" );
  dump_Assume_geq( cw,  "cisb[" + tid + "]" );
  dump_Assume_geq( cw,   "cdy[" + tid + "]" );
  dump_Assume_geq( cw,   "cdl[" + tid + "]" );
  dump_Assume_geq( cw,   "cds[" + tid + "]" );
  dump_Assume_geq( cw,  "ctrl[" + tid + "]" );
  dump_Assume_geq( cw, "caddr[" + tid + "]" );
  if( isRelease ) dump_geq_globals( cw, "cr");
  if( isRelease ) dump_geq_globals( cw, "cw");
  if( isExclusive ) dump_Assume( "delta" + gctx_access + " = "+ tid );

  dump_Comment("Update");
  dump_Assign_max( "caddr[" + tid + "]", cval );
  dump_Assign( "nu"   + gaccess    , v);
  dump_Assign( "mu"   + gctx_access, v);
  if( isExclusive ) dump_Assign( "cx"   + gaccess, v);
  dump_String( "nw"   + gctx_access + "+=1");
  dump_String( "delta"+ gctx_access + "= -1");

  if( isRelease ) dump_Assign( "is"+gaccess, iw);
  if( isRelease ) dump_Assign( "cs"+gaccess, cw);
  if( active_lax > 0 ) dump_Assign( "cx"+gaccess, cw);

  active_lax = active_lax - 1;
}

void kbound::dump_UnaryInst( unsigned bidx,
                             const llvm::UnaryInstruction* I ) {
  assert( I );

  if( auto cast = llvm::dyn_cast<llvm::CastInst>(I) ) {
    dump_CastInst( bidx, cast );
  // } else if( auto alloca = llvm::dyn_cast<llvm::AllocaInst>(I) ) {
  //   dump_AllocaInst( alloca );
  } else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
    dump_LoadInst( bidx, load );
  } else {
    KBOUND_UNSUPPORTED_INSTRUCTIONS( VAArgInst,        I );
    KBOUND_UNSUPPORTED_INSTRUCTIONS( ExtractValueInst, I );
    LLVM_DUMP(I);
    llvm_bmc_error("bmc", "unsupported unary instruction!!");
  }
}

void kbound::dump_Branch( unsigned bidx, const llvm::BranchInst* br ) {
  assert( br );

  auto path = get_path( bidx );
  // auto& exit_bits = bmc_ds_ptr->get_exit_bits( bidx );
  if( !br->isUnconditional() ) {
    auto r = get_reg( br->getCondition() );
    for( auto& dep : ctrl_dep_ord.at(br->getCondition()) ) {
      dump_Assume_geq( "ctrl["+tid+"]", dep);
    }
    dump_If( r );
    auto succ_bidx = bmc_ds_ptr->find_block_idx( br->getSuccessor(0) );
    dump_Goto( block_name(succ_bidx) );
    dump_Else();
    succ_bidx = bmc_ds_ptr->find_block_idx( br->getSuccessor(1) );
    dump_Goto( block_name(succ_bidx) );
    dump_Close_scope();
  }else{
    auto succ_bidx = bmc_ds_ptr->find_block_idx( br->getSuccessor(0) );
    dump_Goto( block_name(succ_bidx) );
    // for unconditional branch, there is no need of constraints
    // bmc_ds_ptr->bmc_vec.push_back( exit_bit );
  }
}

void kbound::dump_PhiNode( unsigned bidx, const llvm::PHINode* phi ) {
  assert( phi );

  unsigned num = phi->getNumIncomingValues();

  if( !phi->getType()->isIntegerTy() && !phi->getType()->isFloatTy() ) {
    // phi->getParent()->dump();
    llvm_bmc_error("kbound", "phi nodes with non integers not supported !!");
  }

  auto v    = add_reg_map(phi);
  auto cval = get_reg_time(phi);

  // std::vector<expr> phi_cons;
  for( unsigned i = 0 ; i < num ; i++ ) {
    auto prev    = phi->getIncomingBlock(i);
    auto prev_v_ = phi->getIncomingValue(i);
    auto v_      = add_reg_map( prev_v_ );
    auto cval_   = add_reg_map( prev_v_ );

    // condition to skip??
    std::vector<unsigned> pre_bidxes;
    for( unsigned pre_b_local: bmc_ds_ptr->pred_idxs[bidx]) {
      if( prev == bmc_ds_ptr->bb_vec[pre_b_local] ) {
        pre_bidxes.push_back( pre_b_local );
      }
    }
    assert( pre_bidxes.size() < 2 );
    //todo: check if this works
    for( unsigned pre_bidx : pre_bidxes) {
      dump_If( get_path(pre_bidx) + "== 1"  );
      dump_Assign( v_, v );
      dump_Assume_geq( cval, cval_ );
      dump_Close_scope();
    }
  }

}


void kbound::dump_Block( unsigned bidx, const bb* b ) {
  assert( b );
  dump_Label(std::to_string(bidx));
  auto path = get_path(bidx);
  dump_Assign( path, "1");

  // for( auto& pre_bidx : bmc_ds_ptr->pred_idxs[bidx] ) {
  //   assert( pre_bidx < bidx );
    
  //   // expr p = extend_path( bidx, pre_bidx );
  //   // incoming_paths.push_back( p );
  // }

  for( const llvm::Instruction& Iobj : b->getInstList() ) {
    const llvm::Instruction* I = &(Iobj);
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
    // } else if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(I) ) {
    //   dump_GetElementPtrInst( gep );
    //   // Terminator instructions
    } else if( auto br = llvm::dyn_cast<llvm::BranchInst>(I) ) {
      dump_Branch( bidx, br );
    } else if( auto ret = llvm::dyn_cast<llvm::ReturnInst>(I) ) {
      dump_RetInst( ret );
    // } else if( auto swch = llvm::dyn_cast<llvm::SwitchInst>(I) ) {
    //   dump_SwitchInst(bidx, swch);
    // } else if( auto sel = llvm::dyn_cast<llvm::SelectInst>(I) ) {
    //   dump_SelectInst(bidx, sel);
    // } else if( auto unreach = llvm::dyn_cast<llvm::UnreachableInst>(I) ) {
    //   dump_UnreachableInst(bidx, unreach);
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
      KBOUND_UNSUPPORTED_INSTRUCTIONS( FenceInst,          I);
      KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicCmpXchgInst,  I);
      KBOUND_UNSUPPORTED_INSTRUCTIONS( AtomicRMWInst,      I);
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
  for( unsigned i = 0; i < bmc_ds_ptr->bb_vec.size(); i++ ) {
    dump_Assign( "char "+ get_path(i), "0" );
  }
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
