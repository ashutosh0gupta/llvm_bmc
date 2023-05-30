#include "lib/kbound/kbound.h"
#include <boost/algorithm/string.hpp>

//----------------------------------------------------------------------------
// Functions for recording names

bool kbound::is_concurrent( const void* v) {
  return exists( global_position, v );
}


std::string kbound::get_global_idx( const void* v ) {
  if( is_concurrent(v) ) {
    unsigned gid = global_position.at(v);
    return std::to_string(gid);
  } else {
    return ""; //dummy return
    // assert( exists( local_global_position, v ) );
    // unsigned gid = local_global_position.at(v);
    // return std::to_string(gid);
  }
}

std::string kbound::get_global_idx( const void* v, std::string offset ) {
  assert( exists( global_position, v ) );
  unsigned gid = global_position.at(v);
  return std::to_string(gid) + "+" + offset;
}

//----------------------------------------------------------------------------

std::string kbound::fresh_name() {
  auto name = "r"+std::to_string(ssa_count);
  unmapped_names.push_back(name);
  ssa_count++;
  return name;
}

//---------------------------------------------------------------------------

std::string kbound::time_name( std::string name ) {
  return "creg_"+name;
}

std::string access_name( names& ns,
                         svec& idxs, unsigned pos ) {
  if( idxs.size() > pos ) {
    auto& idx = idxs[pos];
    auto& np = ns.nmap;
    if( exists(np, idx) ){
      auto& names_p = np.at( idx );
      return access_name( names_p, idxs, pos+1 );
    }
    return "";
    // llvm_bmc_error("kbound", "Bad access of name map");
  }
  return ns.name;
}

names access_names( names& ns, svec& idxs, unsigned pos ) {
  if( idxs.size() > pos ) {
    auto& idx = idxs[pos];
    auto& np = ns.nmap;
    if( exists(np, idx) ){
      auto& names_p = np.at( idx );
      return access_names( names_p, idxs, pos+1 );
    }
    llvm_bmc_error("kbound", "Bad access of name map");
    names dummy;
    return dummy;
  }
  return ns;
}

void add_access_name( names& ns,
                      svec& idxs, unsigned pos, std::string name ) {
  if( idxs.size() > pos ) {
    auto& idx = idxs[pos];
    auto& nm = ns.nmap[idx];
    add_access_name( nm, idxs, pos+1, name );
  }
  ns.name = name;
}

std::string kbound::get_reg( const void* v, svec& idxs ) {
  if( exists( ssa_name_full, v) ) {
    auto& nm = ssa_name_full.at(v);
    return access_name(nm, idxs, 0 );
  }
  return "";
}

void kbound::add_reg_map( const void* v, svec& idxs, std::string name) {
  auto& nm = ssa_name_full[v];
  add_access_name( nm, idxs, 0, name );
}

void kbound::add_reg_map( const void* v, std::string name ) {
  svec idxs;
  return add_reg_map( v, idxs, name );
}

std::string kbound::add_reg_map( const void* v, svec& idxs) {
  auto name = get_reg(v, idxs);
  if( name == "" ) {
    auto fname = fresh_name();
    add_reg_map( v, idxs, fname );
    return fname;
  }
  return name;
}

std::string kbound::add_reg_map( const void* v ) {
  svec idxs;
  return add_reg_map( v, idxs );
}

std::string kbound::get_reg( const void* v ) {
  svec idxs;
  return get_reg( v, idxs );
}

std::string kbound::get_reg_time( const void* v, svec& idxs) {
  auto name = get_reg( v, idxs);
  if( name[0] != 'r' ) {
    assert( idxs.size() == 0 );
    auto vec = ctrl_dep_ord.at(v);
    if( vec.size() == 0 ) return "0";
    if( vec.size() == 1 ) return vec[0];
    if( vec.size() == 2 ) return "max("+vec[0]+","+vec[1]+")";
    assert(false);
  }
  return time_name( name );
}

std::string kbound::get_reg_time( const void* v) {
  svec idxs;
  return get_reg_time( v, idxs );
}
//---------------------------------------------------------------------------




//----------------------------------------------------------------------------
// Dumping sequencial encoding of the concurrent progam in a file

void kbound::dump_Newline() { ofcpp << "\n"; }

void kbound::dump_String(std::string s) {
  dump_Indent();
  ofcpp << s << "\n";
}

void kbound::dump_Label(std::string s) {
  assert( s != "" );
  ofcpp << "T"<< tid <<"BLOCK" << s << ":\n";
}

void kbound::dump_Goto(std::string s) {
  assert( s != "" );
  dump_String( "goto " + s + ";");
}

std::string kbound::block_name(unsigned bidx) {
  return "T"+tid+"BLOCK"+std::to_string(bidx);
}

void kbound::dump_Assume(std::string s) {
  assert( s != "" );
  dump_String("ASSUME("+s+");");
}

void kbound::dump_Assert(std::string s) {
  assert( s != "" );
  dump_String("ASSERT("+s+");");
}

void kbound::dump_Assume_eq(std::string s1,std::string s2) {
  assert( s1 != "" );
  assert( s2 != "" );
  if (s1 == s2) return;
  dump_Assume( s1 + " == "+ s2 );
}
void kbound::dump_Assume_implies(std::string s1,std::string s2) {
  assert( s1 != "" );
  assert( s2 != "" );
  dump_Assume( "(!("+s1+"))||("+s2+")" );
}

void kbound::dump_Assume_geq(std::string s1,std::string s2) {
  assert( s1 != "" );
  assert( s2 != "" );
  if (s1 == s2) return;
  dump_Assume( s1 + " >= "+ s2 );
}

void kbound::dump_Assume_geq_max(std::string s1,std::string s2,std::string s3) {
  assert( s1 != "" );
  assert( s2 != "" );
  assert( s2 != "" );
  dump_Assume_geq( s1 ,"max("+ s2 +","+ s3 + ")" );
}

void kbound::dump_Assign(std::string r, std::string term) {
  assert(    r != "" );
  assert( term != "" );
  dump_String( r + " = "+ term + ";" );
}

void kbound::dump_Decl_assign(std::string r, std::string term) {
  assert(    r != "" );
  dump_Assign( "int " + r, term );
}

void kbound::dump_Assign_rand(std::string v, std::string b, std::string cmt ) {
  assert( v != "" );
  assert( b != "" );
  if( cmt != "" ) {
    cmt = "// " + cmt;
  }
  dump_String( v + " = get_rng(0," + b + ");" + cmt );
}

void kbound::dump_Assign_max( std::string v, std::string r1, std::string r2 ) {
  assert(  v != "" );
  assert( r1 != "" );
  assert( r2 != "" );
  dump_String( v + " = max(" + r1 + ","+ r2 + ");" );
}

void kbound::dump_Assign_max( std::string v, std::string r2 ) {
  dump_Assign_max(v,v,r2);
}

void kbound::dump_Assign_rand_ctx(std::string v, std::string cmt) {
  dump_Assign_rand( v, "NCONTEXT-1", cmt );
}

void kbound::dump_Comment(std::string s) {
  boost::replace_all(s, "\n", " ");
  dump_String("// "+s);
}

void kbound::dump_Indent() {
  if(current_indent > 20) {
    llvm_bmc_error( "kbound", "Large indent is not ok!" );
  }
  for(unsigned i=0; i < current_indent; i++ ) ofcpp << "  ";
}

void kbound::dump_Define(std::string name, std::string val) {
  assert( name != "" );
  assert( val != "" );
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

void kbound::dump_If_NonDet() {
  dump_If("__get_rng()");
}

void kbound::dump_ElseIf(std::string s) {
  current_indent--;
  dump_String( "} else if("+ s + ") {" );
  current_indent++;
}

void kbound::dump_Else() {
  current_indent--;
  dump_String( "} else {" );
  current_indent++;
}

void kbound::
dump_Close_scope() {
  if( current_indent == 0 ) {
    return;
    // llvm_bmc_error("kbound", "Bad scoping in dumping output!");
  }
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
    dump_Define( ary + "(x,k)", ary + "_[(x)*"+dim2+"+k]" );
  }
  dump_Newline();
}


void kbound::dump_Active( std::string ctx) {
  dump_Assume("active["+ctx+"] == "+tid);
}

void kbound::postfix_seq() {
  //initializing value matching
  for( unsigned x = 0; x < num_globals; x++ ) {
    auto xn = std::to_string(x);
    for( unsigned k = 0; k < ncontext-1; k++ ) {
      auto xkn = "("+xn+","+std::to_string(k)+")";
      auto xknp = "("+xn+","+std::to_string(k+1)+")";
      for( auto ary: val_list ) dump_Assume(ary+"init"+xknp +" == "+ary+xkn);
    }
  }
  dump_Newline();
  for(auto& term: in_code_spec ) dump_String("ASSERT(" + term + ");");
  std::map<std::string,std::string> rename;
  auto ctx_name = ","+std::to_string(ncontext-1);
  for( auto pair : global_position ) {
    auto gv = global_name.at(pair.first);//(std::string)(pair.first->getName());
    auto gid = pair.second;
    rename[gv] = "mem("+std::to_string(gid) + ctx_name + ")";
  }
  for(auto& spec: bmc_obj.sys_spec.posts ) {
    auto term = display(spec, rename);
    dump_String("ASSERT(" + term + ");");
  }
  dump_Newline();
  dump_Close_scope();
}

void kbound::dump_locals() {

  std::ifstream in(o.outDirPath.string()+"/cbmc.cpp");
  std::ofstream out(o.outDirPath.string()+"/cbmc_out.cpp");
  std::string line;
    while (getline(in, line)) {
      if( line == "  __LOCALS__") {
        for( auto& pair : ssa_name ) {
          auto& name = pair.second;
          if( name[0] != 'r') continue;
          out << "  int " << name << "= 0;\n";
          out << "  char " << get_reg_time(pair.first) << ";\n"; //<< "= 0;\n";
        }
        for( auto& v : unmapped_names ) {
          out << "  int " << v << "= 0;\n";
          out << "  char " << time_name(v) << ";\n";
        }
        for( auto& v : uninit_names ) {
          out << "  int " << v <<";\n";
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


void kbound::preamble() {

  for( auto& v : global_position ) {
    auto g = v.first;
    dump_Comment( std::to_string(v.second) + ":" + global_name.at(g) +
                  + ":" + std::to_string(global_size.at(g)) );
  }
  dump_Define("ADDRSIZE",std::to_string( num_globals ) );
  dump_Define( "NPROC"   , std::to_string( bmc_obj.sys_spec.threads.size() ) );
  dump_Define( "NCONTEXT", std::to_string(ncontext) );
  dump_Newline();

  dump_Define("ASSUME(stmt)", "__CPROVER_assume(stmt)");
  dump_Define("ASSERT(stmt)", "__CPROVER_assert(stmt, \"error\")");
  dump_Newline();

  dump_Define("max(a,b)", "(a>b?a:b)");
  dump_Newline();

  dump_String("char __get_rng();");
  dump_String("char get_rng( char from, char to ) {");
  dump_String("   char ret = __get_rng();");
  dump_String("   ASSUME(ret >= from && ret <= to);");
  dump_String("   return ret;");
  dump_String("}");
  dump_Newline();

  dump_String("char get_rng_th( char from, char to ) {");
  dump_String("   char ret = __get_rng();");
  dump_String("   ASSUME(ret >= from && ret <= to);");
  dump_String("   return ret;");
  dump_String("}");
  dump_Newline();

  dump_Decl_fun("int", "main", "int argc, char **argv");

}

void kbound::prefix_seq_v1() {
  std::cout << "Running k bound\n";
  preamble();
  // for( auto& v : global_position ) {
  //   auto g = v.first;
  //   dump_Comment( std::to_string(v.second) + ":" + global_name.at(g) +
  //                 + ":" + std::to_string(global_size.at(g)) );
  // }
  // std::cout << "Running k bound\n";
  // dump_Define("ADDRSIZE",std::to_string( num_globals ) );
  // dump_Define( "NPROC"   , std::to_string( bmc_obj.sys_spec.threads.size() ) );
  // dump_Define( "NCONTEXT", std::to_string(ncontext) );
  // dump_Newline();

  // dump_Define("ASSUME(stmt)", "__CPROVER_assume(stmt)");
  // dump_Define("ASSERT(stmt)", "__CPROVER_assert(stmt, \"error\")");
  // dump_Newline();

  // dump_Define("max(a,b)", "(a>b?a:b)");
  // dump_Newline();

  // dump_String("char __get_rng();");
  // dump_String("char get_rng( char from, char to ) {");
  // dump_String("   char ret = __get_rng();");
  // dump_String("   ASSUME(ret >= from && ret <= to);");
  // dump_String("   return ret;");
  // dump_String("}");
  // dump_Newline();

  // dump_String("char get_rng_th( char from, char to ) {");
  // dump_String("   char ret = __get_rng();");
  // dump_String("   ASSUME(ret >= from && ret <= to);");
  // dump_String("   return ret;");
  // dump_String("}");
  // dump_Newline();

  // dump_Decl_fun("int", "main", "int argc, char **argv");

  dump_Comment( "declare arrays for intial value version in contexts" );
  val_init_list = { "meminit", "coinit", "deltainit" };
  dump_Arrays( "int", val_init_list, "ADDRSIZE", "NCONTEXT");

  dump_Comment( "declare arrays for running value version in contexts" );
  val_list = {
    "mem", // Main memory
    "co",  // Count number of writes; maintain write commit order
    "delta"// ??
  };
  dump_Arrays( "int", val_list, "ADDRSIZE", "NCONTEXT");

  dump_Comment( "declare arrays for local buffer and observed writes" );
  local_list = {
    "buff", // Local buffer; not a time stamp
    "pw",   // Last write seen in the thread
  };
  dump_Arrays( "int", local_list, "NPROC", "ADDRSIZE" );

  dump_Comment( "declare arrays for context stamps" );
  time_list = {
    "cr",        // Last read commit ctx
    "iw", "cw",  // Write commit ctx
    "cx",        // exclusive commit
    "is",        // RA model write init
    "cs"         // RA model write commmit
  };
  dump_Arrays( "char", time_list, "NPROC", "ADDRSIZE");

  dump_Comment( "declare arrays for synchronizations" );
  proc_list = {
    "cl",                        // Timestamps for load acquire
    "cdy", "cds", "cdl", "cisb", // Timestamps for four kind of fences
    "caddr", "cctrl"             // Timestamps for addr and ctrl
  };
  for( auto ary: proc_list ) dump_Decl_array("int", ary, "NPROC");

  thread_ctrl_list = { "cstart", "creturn"};
  for( auto ary: thread_ctrl_list ) dump_Decl_array("int", ary, "NPROC");

  dump_Newline();

  dump_Comment( "declare arrays for contexts activity" );
  ctx_list = { "active", "ctx_used" };
  for( auto ary: ctx_list ) dump_Decl_array( "int", ary, "NCONTEXT" );
  dump_Newline();

  var_list = { "old_cctrl", "old_cr", "old_cdy", "old_cw",  "new_creg" };
  dump_Newline();
  dump_String("__LOCALS__");

  // records time and processes
  for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < num_globals; x++ ) {
      auto xn = std::to_string(x);
      for( auto ary: local_list) dump_String( ary + "("+pn+","+xn+") = 0;" );
      for( auto ary: time_list ) dump_String( ary + "("+pn+","+xn+") = 0;" );
    }
    for( auto ary: proc_list ) dump_String( ary + "["+ pn + "] = 0;" );
    for( auto ary: thread_ctrl_list ) dump_Assign_rand_ctx(ary+"["+ pn + "]" );
  }

  // records values
  //dump initializers
  dump_Comment( "Dumping initializations" );
  for( auto& v : global_position ) {
    auto g = v.first;
    auto pos = std::to_string(v.second);
    auto size = global_size.at(g);
    auto& init = global_init.at(g);
    assert( init.size() == 0 || size == init.size() );
    for( unsigned i=0; i < size; i++ ) {
      auto in = std::to_string(i);
      auto ival = init.size() > 0 ? init[i] : "0";
      dump_Assign( "mem("+ pos + "+" + in + ",0)", ival );
    }
  }
  dump_Comment( "Dumping context matching equalities" );
  for( unsigned x = 0; x < num_globals; x++ ) {
    auto xn = std::to_string(x);
    dump_String( "co("+xn+",0) = 0;" );
    dump_String( "delta("+xn+",0) = -1;" );
    for( unsigned k = 1; k < ncontext; k++ ) {
      auto kn = std::to_string(k);
      auto xkn = "("+xn+","+kn+")";
      for( auto ary: val_list ) dump_Assign( ary+xkn, ary+"init"+xkn );
    }
  }

}


void kbound::
dump_ld_v1( std::string r, std::string cval,std::string caddr,
         std::string gid,
         bool isAcquire, bool isExclusive ) {

  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto cr          = "cr"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Comment("LD: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isAcquire)     dump_Comment("  : Acquire");
  dump_Assign( "old_cr",  cr);
  dump_Assign_rand_ctx( cr, " ctx for load");

  if( is_sc_semantics ) {
    dump_Comment("Check");
    dump_Active( cr );
    dump_Assume_geq( cr, "cdy[" + tid + "]" );
    dump_Assign( "cdy[" + tid + "]", cr );
    dump_Comment("Update");
    dump_Assign( r, "mem"+ gctx_access );
  }else{
    dump_Comment("Check");
    dump_Active( cr );
    dump_Assume_geq( cr, "iw"+gaccess );
    dump_Assume_geq( cr, caddr );
    dump_Assume_geq( cr, "cdy[" + tid + "]" );
    dump_Assume_geq( cr, "cisb["+ tid + "]" );
    dump_Assume_geq( cr, "cdl[" + tid + "]" );
    dump_Assume_geq( cr, "cl["  + tid + "]" );
    if( isExclusive ) dump_Assume_geq ( cr, "old_cr" );   // extra in exlusive
    if( isAcquire   ) dump_Assume_geq ( cr, "cx"+gaccess);// extra in lda
    if( isAcquire   ) dump_geq_globals( cr, "cs");        // extra in lda

    dump_Comment("Update");
    dump_Assign( cval, cr );
    dump_Assign_max( "caddr["+tid+"]", caddr);
    dump_If( cr + " < " + "cw"+gaccess );
    {
      dump_Assign( r, "buff"+gaccess );
    }
    dump_Else();
    {
      dump_If( "pw" +gaccess + " != " + "co" + gctx_access );
      {
        // If this thread is reading a new write then
        // only reads are are ordered.
        dump_Assume_geq( cr, "old_cr" );
      }
      dump_Close_scope();
      dump_Assign( "pw"+gaccess, "co"+ gctx_access );
      dump_Assign( r, "mem"+ gctx_access );
    }
    dump_Close_scope();

    if( isAcquire   ) dump_Assign_max( "cl[" + tid + "]", cr   );
  }
  if( isExclusive ) dump_Assign( "delta"+gctx_access, tid );
  if( isExclusive ) active_lax = active_lax + 1;
  dump_commit_before_thread_finish(cr);
}


void kbound::
dump_st_v1( std::string v, std::string cval,std::string caddr, std::string gid,
         bool isRelease, bool isExclusive) {

  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto iw          = "iw"+gaccess;
  auto cw          = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cw + ")";

  dump_Comment("ST: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isRelease)   dump_Comment("  : Release");
  dump_Assign_rand_ctx( iw );
  dump_Assign( "old_cw",  cw);
  dump_Assign_rand_ctx( cw );

  if( is_sc_semantics ) {
    dump_Comment("Check");
    dump_Active( cw );
    dump_Assume_geq( cw, "cdy[" + tid + "]" );
    if( isExclusive ) dump_Assume( "delta" + gctx_access + " == "+ tid );

    dump_Comment("Update");
    dump_Assign( "cdy[" + tid + "]", cw );
    dump_Assign( "mem"   + gctx_access, v);
    dump_String( "co"   + gctx_access + "+=1;");
    dump_Assign( "delta"+ gctx_access, "-1");
    if( isExclusive || active_lax > 0 ) dump_Assign(  "cx" + gaccess, cw);
    if( isExclusive ) active_lax = active_lax - 1;
  }else{
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
    dump_Assume_geq( cw,  "cctrl[" + tid + "]" );
    dump_Assume_geq( cw, "caddr[" + tid + "]" );
    if( isRelease ) dump_geq_globals( cw, "cr");
    if( isRelease ) dump_geq_globals( cw, "cw");
    if( isExclusive ) dump_Assume( "delta" + gctx_access + " == "+ tid );

    dump_Comment("Update");
    // std::cout << caddr;
    // dump_Assign_max( "caddr[" + tid + "]", cval ); // << error
    dump_Assign_max( "caddr[" + tid + "]", caddr );
    dump_Assign( "buff"   + gaccess    , v);
    dump_Assign( "mem"   + gctx_access, v);
    if( isExclusive ) dump_Assign( "cx"   + gaccess, cw);
    dump_String( "co"   + gctx_access + "+=1;");
    dump_Assign( "delta"+ gctx_access, "-1");

    if( isRelease ) dump_Assign( "is"+gaccess, iw);
    if( isRelease ) dump_Assign( "cs"+gaccess, cw);
    if( active_lax > 0 ) dump_Assign( "cx"+gaccess, cw);
    if( isExclusive ) active_lax = active_lax - 1;
  }
  dump_commit_before_thread_finish(cw);
}

void kbound::dump_update_ctrl( const void* cond ) {
    auto ctrl = "cctrl["+tid+"]";
    dump_Assign("old_cctrl", ctrl);
    dump_Assign_rand_ctx( ctrl );
    dump_Assume_geq( ctrl, "old_cctrl" );

    if( exists( ctrl_dep_ord, cond ) ) {
      //todo: remove this branch if compute the reg_time of the compare
      //      instruction is computed; already added
      for( auto& dep : ctrl_dep_ord.at(cond) ) {
        dump_Assume_geq( ctrl, dep );
      }
      // for( auto& dep : ctrl_dep_ord.at(cond) ) {
      //   dump_Assume_geq( ctrl, dep);
      // }
    }else{
      auto cr = get_reg_time( cond );
      dump_Assume_geq( ctrl, cr );
    }
}

void kbound::dump_geq_globals( std::string c, std::string prop ) {
  for( auto pair : global_position ) {
    auto gid = std::to_string(pair.second);
    for( unsigned i = 0; i < global_size.at(pair.first); i++ ) {
      auto si = std::to_string(i);
      dump_Assume_geq( c, prop+"(" + tid +","+ gid+"+"+si+")" );
    }
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
  dump_Assume_geq( cdy, "cctrl[" + tid + "]" );

  dump_geq_globals( cdy, "cw");
  dump_geq_globals( cdy, "cr");// missing case << 
  dump_commit_before_thread_finish( cdy );
}

void kbound::dump_dmbld() {
  auto cdl = "cdl["+tid+"]";
  dump_Comment("dumbld: Guess");
  dump_Assign_rand_ctx( cdl );
  dump_Comment("Check");
  dump_Assume_geq( cdl, "cdy[" + tid + "]" );
  dump_geq_globals( cdl, "cr");
  dump_commit_before_thread_finish(cdl);
}

void kbound::dump_dmbst() {
  auto cds = "cds["+tid+"]";
  dump_Comment("dumbst: Guess");
  dump_Assign_rand_ctx( cds );
  dump_Comment("Check");
  dump_Assume_geq( cds, "cdy[" + tid + "]" );
  dump_geq_globals( cds, "cw");
  dump_commit_before_thread_finish(cds);
}

void kbound::dump_isb() {
  auto cisb = "cisb["+tid+"]";
  dump_Comment("isb: Guess");
  dump_Assign_rand_ctx( cisb );
  dump_Comment("Check");
  dump_Assume_geq( cisb, "cdy["   + tid + "]" );
  dump_Assume_geq( cisb, "cctrl["  + tid + "]" );
  dump_Assume_geq( cisb, "caddr[" + tid + "]" );
  dump_commit_before_thread_finish(cisb);
}

void kbound::dump_commit_before_thread_finish( std::string cctx ) {
  auto creturn = "creturn["+tid+"]";
  dump_Assume_geq( creturn, cctx  );
}

void kbound::dump_start_thread() {
  dump_Comment( "Dumping thread "+ tid );
  if(is_sc_semantics) dump_Comment( "Thread semanics = SC");
  dump_Assign( "int ret_thread_"+ tid, "0" );

  auto cdy     =     "cdy[" + tid + "]";
  auto cstart  =  "cstart[" + tid + "]";  // if we turn the local variabls
  dump_Assign_rand_ctx( cdy ); //todo : do we need to do this
  dump_Assume_geq( cdy, cstart );
}

// const llvm::CallInst* call
void kbound::dump_thread_create( unsigned bidx, std::string child_tid ) {
  dump_dmbsy(); // All in-flight opertions must commit now
  dump_Assume_geq( "cstart[" + child_tid + "]", "cdy[" + tid + "]");
}

void kbound::dump_thread_join( unsigned bidx, std::string child_tid ) {
  dump_dmbsy(); // All in-flight opertions must commit now
  dump_Assume_geq(  "cdy[" + tid + "]", "creturn[" + child_tid + "]" );
}


void kbound::
dump_ld( std::string r, std::string cval,std::string caddr,
         std::string gid,
         bool isAcquire, bool isExclusive ) {
  if( version == "v1") {
    dump_ld_v1( r, cval,caddr, gid, isAcquire, isExclusive );
  }else{
    dump_ld_v2( r, cval,caddr, gid, isAcquire, isExclusive );
  }
}


void kbound::
dump_st( std::string v, std::string cval,std::string caddr, std::string gid,
         bool isRelease, bool isExclusive) {
  if( version == "v1") {
    dump_st_v1(  v,  cval, caddr,  gid, isRelease, isExclusive);
  }else{
    dump_st_v2(  v,  cval, caddr,  gid, isRelease, isExclusive);
  }
}


void kbound::prefix_seq() {
  if( version == "v1") {
    prefix_seq_v1();
  }else{
    prefix_seq_v2();
  }
}
