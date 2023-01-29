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

//----------------------------------------------------------------------------

// std::string kbound::get_reg( const void* v ) {
//   if( exists( ssa_name, v) ) {
//     return ssa_name.at(v);
//   }
//   return "";
// }

// void kbound::add_reg_map( const void* v, std::string name) {
//   ssa_name[v] = name;
// }

// std::string kbound::add_reg_map( const void* v) {
//   if( ssa_name.find(v) != ssa_name.end() ) return ssa_name.at(v);
//   auto fname = fresh_name();
//   add_reg_map(v, fname );
//   return get_reg(v);
// }

// std::string kbound::get_reg_time( const void* v) {
//   auto name = ssa_name.at(v);
//   if( name[0] != 'r' ) {
//     auto vec = ctrl_dep_ord.at(v);
//     if( vec.size() == 0 ) return "0";
//     if( vec.size() == 1 ) return vec[0];
//     if( vec.size() == 2 ) return "max("+vec[0]+","+vec[1]+")";
//     assert(false);
//   }
//   return time_name( ssa_name.at(v) );
// }

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

void kbound::dump_Assign_rand(std::string v, std::string b ) {
  assert( v != "" );
  assert( b != "" );
  dump_String( v + " = get_rng(0," + b + ");" );
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

void kbound::dump_Assign_rand_ctx(std::string v) {
  dump_Assign_rand( v, "NCONTEXT-1" );
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
    dump_Define( ary + "(x,k)", ary + "_[x*"+dim2+"+k]" );
  }
  dump_Newline();
}


void kbound::dump_Active( std::string ctx) {
  dump_Assume("active["+ctx+"] == "+tid);
}

void kbound::prefix_seq() {


  for( auto& v : global_position ) {
    auto g = v.first;
    dump_Comment( std::to_string(v.second) + ":" + global_name.at(g) );
  }
  std::cout << "Running k bound\n";
  // dump_Define("ADDRSIZE",std::to_string( num_globals ) );
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
  // dump_String("   ctx_used[ret] = 1;");
  dump_String("   return ret;");
  dump_String("}");
  dump_Newline();

  dump_String("char get_rng_th( char from, char to ) {");
  dump_String("   char ret = __get_rng();");
  dump_String("   ASSUME(ret >= from && ret <= to);");
  dump_String("   return ret;");
  dump_String("}");
  dump_Newline();

  // dump_Comment("declare arrays for register values");
  // reg_vals = { "reg" }; //"ireg",
  // dump_Arrays( "int", reg_vals, "NPROC", "NREGS");

  dump_Decl_fun("int", "main", "int argc, char **argv");
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

  var_list = { "old_ctrl", "old_cr", "old_cdy", "old_cw",  "new_creg" //, "new_iw", "new_cw",  // "new_ireg",
  };
  dump_Newline();
  dump_String("__LOCALS__");

  for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < num_globals; x++ ) {
      auto xn = std::to_string(x);
      for( auto ary: time_list ) dump_String( ary + "("+pn+","+xn+") = 0;" );
    }
    for( auto ary: proc_list ) dump_String( ary + "["+ pn + "] = 0;" );
  }

  for( unsigned x = 0; x < num_globals; x++ ) {
    auto xn = std::to_string(x);
    for( auto ary: val_list ) dump_String( ary + "("+xn+",0) = 0;" );
    for( unsigned k = 1; k < ncontext; k++ ) {
      auto kn = std::to_string(k);
      auto xkn = "("+xn+","+kn+")";
      // for( auto ary: val_init_list ) dump_String(ary +xkn+" = __get_rng();");
      for( auto ary: val_list ) dump_Assign( ary+xkn, ary+"init"+xkn );

    }
  }

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
    rename[gv] = "mu("+std::to_string(gid) + ctx_name + ")";
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

void kbound::dump_sc_semantics( std::string tid, std::string c ) {
  dump_Assign("cdy[" + tid + "]", c );
}

void kbound::
dump_ld( std::string r, std::string cval,std::string caddr, std::string gid,
         bool isAcquire, bool isExclusive ) {

  auto gaccess = "("+ tid + ","+ gid + ")";
  auto cr = "cr"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Comment("LD: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isAcquire)     dump_Comment("  : Acquire");
  dump_Assign( "old_cr",  cr);
  dump_Assign_rand_ctx( cr );

  dump_Comment("Check");
  dump_Active( cr );
  dump_Assume_geq( cr, "iw"+gaccess );
  dump_Assume_geq( cr, caddr );
  if( is_sc_semantics ) {
    dump_sc_semantics(tid, cr);
  }else{
    dump_Assume_geq( cr, "cdy[" + tid + "]" );
    dump_Assume_geq( cr, "cisb["+ tid + "]" );
    dump_Assume_geq( cr, "cdl[" + tid + "]" );
    dump_Assume_geq( cr, "cl["  + tid + "]" );
    if( isExclusive ) dump_Assume_geq( cr, "old_cr" );
    if( isAcquire   ) dump_Assume_geq( cr, "cx"+gaccess ); // extra in lda
    if( isAcquire   ) dump_geq_globals( cr, "cs"); // extra in lda
  }

  dump_Comment("Update");
  dump_Assign( cval, cr );
  dump_Assign_max( "caddr["+tid+"]", caddr);
  dump_If( cr + " < " + "cw"+gaccess );
  {
    dump_Assign( r, "nu"+gaccess );
  }
  dump_Else();
  {
    dump_If( "pw" +gaccess + " != " + "nw" + gctx_access );
    {
      dump_Assume_geq( cr, "old_cr" );
    }
    dump_Close_scope();
    dump_Assign( "pw"+gaccess, "nw"+ gctx_access );
    dump_Assign( r, "mu"+ gctx_access );
  }
  dump_Close_scope();

  if( isAcquire   ) dump_Assign_max( "cl[" + tid + "]", cr   );
  if( isExclusive ) dump_Assign( "delta"+gctx_access, tid );
  if( isExclusive ) active_lax = active_lax + 1;
}

void kbound::
dump_st( std::string v, std::string cval,std::string caddr, std::string gid,
         bool isRelease, bool isExclusive) {

  auto gaccess = "("+ tid + ","+ gid + ")";
  auto iw = "iw"+gaccess;
  auto cw = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cw + ")";

  dump_Comment("ST: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isRelease)   dump_Comment("  : Release");
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
  if( is_sc_semantics ) {
    dump_sc_semantics(tid, cw);
  }else{
    dump_Assume_geq( cw,    "cl[" + tid + "]" );
    dump_Assume_geq( cw,  "cisb[" + tid + "]" );
    dump_Assume_geq( cw,   "cdy[" + tid + "]" );
    dump_Assume_geq( cw,   "cdl[" + tid + "]" );
    dump_Assume_geq( cw,   "cds[" + tid + "]" );
    dump_Assume_geq( cw,  "ctrl[" + tid + "]" );
    dump_Assume_geq( cw, "caddr[" + tid + "]" );
    if( isRelease ) dump_geq_globals( cw, "cr");
    if( isRelease ) dump_geq_globals( cw, "cw");
    if( isExclusive ) dump_Assume( "delta" + gctx_access + " == "+ tid );
  }

  dump_Comment("Update");
  dump_Assign_max( "caddr[" + tid + "]", cval );
  dump_Assign( "nu"   + gaccess    , v);
  dump_Assign( "mu"   + gctx_access, v);
  if( isExclusive ) dump_Assign( "cx"   + gaccess, cw);
  dump_String( "nw"   + gctx_access + "+=1;");
  dump_Assign( "delta"+ gctx_access, "-1");

  if( isRelease ) dump_Assign( "is"+gaccess, iw);
  if( isRelease ) dump_Assign( "cs"+gaccess, cw);
  if( active_lax > 0 ) dump_Assign( "cx"+gaccess, cw);
  if( isExclusive ) active_lax = active_lax - 1;
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
