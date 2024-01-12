#include "lib/kbound/kbound.h"
#include <boost/algorithm/string.hpp>


//----------------------------------------------------------------------------
// Functions for recording names

bool kbound::is_concurrent( const void* v) {
  return exists( global_position, v );
}

//
// Global variables that are fully local
//
bool kbound::is_local_global( const void* v) {
  return exists( local_global_position, v );
}


std::string kbound::get_global_idx( const void* v ) {
  if( is_concurrent(v) ) {
    unsigned gid = global_position.at(v);
    return std::to_string(gid);
  } else if( is_local_global( v ) ) {
    unsigned gid = local_global_position.at(v);
    return std::to_string(gid);
  }else{
    return ""; //dummy return
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

std::string expr_to_name( std::string name ) {
  if(name[0] == 'r') return name;
  //improve this translation; make it unqiue
  boost::replace_all( name, ",", "_COMMA_" );
  boost::replace_all( name, "-", "_MINUS_" );
  boost::replace_all( name, "(", "_OB_"    );
  boost::replace_all( name, ")", "_CB_"    );
  boost::replace_all( name, "=", "_EQ_"    );
  boost::replace_all( name, "!", "_NOT_"   );
  boost::replace_all( name, "<", "_LT_"    );
  boost::replace_all( name, ">", "_GT_"    );
  boost::replace_all( name, " ", "_SPACE_" );

  // std::replace( name.begin(), name.end(), ',', '_');
  // std::replace( name.begin(), name.end(), '(', '_');
  // std::replace( name.begin(), name.end(), ')', '_');
  // std::replace( name.begin(), name.end(), '=', '_');
  // std::replace( name.begin(), name.end(), '!', '_');
  // std::replace( name.begin(), name.end(), '<', '_');
  // std::replace( name.begin(), name.end(), '>', '_');
  // std::replace( name.begin(), name.end(), ' ', '_');
  // std::replace( name.begin(), name.end(), "-", "_MIN_");
  return name;
}

reg_ctx_t kbound::zero_ctx() {
  if(mm == ARMV2)
    return {"0","0"};//COM,SAT pair
  return {"0"};
}

reg_ctx_t kbound::ctx_name( std::string name ) {
  name = expr_to_name(name);
  if(mm == ARMV2)
    return {"creg_"+name,"creg_sat_"+name};
  return {"creg_"+name};
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

reg_ctx_t kbound::get_reg_ctx( const void* v, svec& idxs) {
  auto name = get_reg( v, idxs );
  return ctx_name( name );
  // if( name[0] != 'r' ) {
  //   assert( idxs.size() == 0 );
  //   auto vec = ctrl_dep_ord.at(v);
  //   if( vec.size() == 0 ) return "0";
  //   if( vec.size() == 1 ) return vec[0];
  //   if( vec.size() == 2 ) return "max("+vec[0]+","+vec[1]+")";
  //   assert(false);
  // }
  // return ctx_name( name );
}


reg_ctx_t kbound::get_reg_ctx( const void* v) {
  svec idxs;
  return get_reg_ctx( v, idxs );
}

// std::string kbound::get_reg_sat_ctx( const void* v, svec& idxs) {
//   auto name = get_reg( v, idxs);
//   return ctx_sat_name( name );
//   // if( name[0] != 'r' ) {
//   //   assert( idxs.size() == 0 );
//   //   auto vec = ctrl_dep_ord.at(v);
//   //   if( vec.size() == 0 ) return "0";
//   //   if( vec.size() == 1 ) return vec[0];
//   //   if( vec.size() == 2 ) return "max("+vec[0]+","+vec[1]+")";
//   //   assert(false);
//   // }
// }
// std::string kbound::get_reg_sat_ctx( const void* v ) {
//   svec idxs;
//   return get_reg_sat_ctx( v, idxs );
// }


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

std::string kbound::block_name(std::string s) {
  return "T"+tid+"BLOCK"+s;
}

std::string kbound::block_name(unsigned bidx) {
  return block_name( std::to_string(bidx) );
  // return "T"+tid+"BLOCK"+std::to_string(bidx);
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
  // if( s2 == "0") return; // Do not dump if RHS is 0
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

void kbound::dump_Assign_max( std::string v, sset rs ) {
  std::string expr = "";
  for( auto r : rs ) {
    expr = (expr == "") ? r : "max(" + expr + "," + r +")";
  }
  dump_Assign( v, expr );
}

void kbound::dump_Assign_max( std::string v, std::string r2 ) {
  dump_Assign_max(v,v,r2);
}

void kbound::dump_Assign_rand_ctx(std::string v, std::string cmt) {
  dump_Assign_rand( v, "NCONTEXT-1", cmt );
}

void kbound::dump_Assign_rand_thread(std::string v, std::string cmt) {
  dump_Assign_rand( v, "NTHREAD-1", cmt );
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

void kbound::dump_Return(std::string v) {
  dump_String( "return "+ v+";" );
}

void kbound::dump_Arrays( std::string type,
                          svec arys,
                          std::string dim1, std::string dim2,
                          std::string dim3 ) {
  for( std::string ary: arys ) {
    dump_Decl_array( type, ary+"_", dim1+"*"+dim2+"*"+dim3 );
    dump_Define( ary + "(t,x,k)",
                 ary + "_[(t)*"+dim3 + "+(x)*"+dim2+"+k]" );
  }
  dump_Newline();
}

//------------------------------------------------------------------------
// encoding
//------------------------------------------------------------------------


void kbound::dump_Assign_ctx( reg_ctx_t& v, ctxset_t& rs ) {
  for(unsigned i = 0; i< v.size(); i++ ) {
    sset ss;
    for(auto r : rs) ss.insert(r.at(i));
    dump_Assign_max(v.at(i),ss);
  }
}


void kbound::dump_Active( std::string ctx) {
  dump_Assume("active["+ctx+"] == "+tid);
}

void kbound::postfix_seq() {
  //initializing value matching

  dump_post_context_matching();
  dump_Newline();
  for(auto& term: in_code_spec ) dump_String("ASSERT(" + term + " == 0);");
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
  dump_Return("0");
  dump_Close_scope();
}

void kbound::dump_locals() {
  std::ifstream in(o.outDirPath.string()+"/"+o.fileName+".cbmc.cpp");
  std::ofstream out(o.outDirPath.string()+"/"+o.fileName+".cbmc_out.cpp");
  std::string line;
    while (getline(in, line)) {
      if( line == "  __LOCALS__") {
        // ashu: remove the following loop; not in use
        // for( auto& pair : ssa_name ) {
        //   auto& name = pair.second;
        //   if( name[0] != 'r') out << "  int " << name << "= 0;\n";
        //   out << "  char " << get_reg_ctx(pair.first) << ";\n"; //<< "= 0;\n";
        // }

        for( unsigned i = 0; i < bmc_obj.sys_spec.threads.size();i++ ) {
          tid = std::to_string(i);
          out << "  int ret_thread_" << tid <<";\n";
          out << "  int skip_" << tid <<";\n";
        }
        for( auto spec : in_code_spec ) {
          out << "  int " << spec <<" = 0;\n";
        }
        for( auto& v : unmapped_names ) {
          if( v[0] == 'r') out << "  int " << v << "= 0;\n";
          for( auto tname : ctx_name(v) ) {
            out << "  char " << tname << ";\n";
          }
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

  dump_Comment("Global variabls:");
  for( auto& v : global_position ) {
    auto g = v.first;
    dump_Comment( std::to_string(v.second) + ":" + global_name.at(g) +
                  + ":" + std::to_string(global_size.at(g)) );
  }
  dump_Comment("Local global variabls:");
  for( auto& v : local_global_position ) {
    auto g = v.first;
    dump_Comment( std::to_string(v.second) + ":" + global_name.at(g) +
                  + ":" + std::to_string(global_size.at(g)) );
  }
  dump_Define("ADDRSIZE"     , std::to_string( num_globals ) );
  dump_Define("LOCALADDRSIZE", std::to_string( num_local_globals ) );
  dump_Define( "NTHREAD"   , std::to_string( bmc_obj.sys_spec.threads.size() ) );
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

  if( num_local_globals > 0 ) {
    dump_Comment( "Declare arrays for intial value version in contexts" );
    dump_Decl_array( "int", "local_mem", "LOCALADDRSIZE" );

    dump_Comment( "Dumping initializations" );
    for( auto& v : local_global_position ) {
      auto g = v.first;
      auto pos = std::to_string(v.second);
      auto size = global_size.at(g);
      auto& init = global_init.at(g);
      assert( init.size() == 0 || size == init.size() );
      for( unsigned i=0; i < size; i++ ) {
        auto in = std::to_string(i);
        auto ival = init.size() > 0 ? init[i] : "0";
        dump_Assign( "local_mem["+ pos + "+" + in + "]", ival );
      }
    }

  }

  thread_ctrl_list = { "cstart", "creturn"};
  for( auto ary: thread_ctrl_list ) dump_Decl_array("int", ary, "NTHREAD");
  dump_Newline();

  dump_Comment( "declare arrays for contexts activity" );
  // ctx_list = { "active", "ctx_used" };
  ctx_list = { "active" };
  for( auto ary: ctx_list ) dump_Decl_array( "int", ary, "NCONTEXT" );
  dump_Newline();

  dump_String("__LOCALS__");
}



void kbound::
range_forbid( std::string gid, std::string lb, std::string ub ) {
  for( unsigned k = 1; k < ncontext; k++ ) {
    auto kn = std::to_string(k);
    auto range = "( ("+lb + " < " + kn+") && ("+ kn + " < " + ub +") )";
    auto xkn = "(" + gid + ","+ kn +")";
    dump_Assume_implies( range, "sforbid"+ xkn +"> 0" );
  }
}

// void kbound::
// if_range_forbid( std::string gid, std::string lb, std::string ub, std::string skip_label ) {
//   for( unsigned k = 1; k < ncontext; k++ ) {
//     auto kn = std::to_string(k);
//     auto range = "( ("+lb + " < " + kn+") && ("+ kn + " < " + ub +") )";
//     auto xkn = "(" + gid + ","+ kn +")";
//     dump_if_implies( range, " && (sforbid"+ xkn +"<= 0)" );
//   }
// }

void kbound::dump_update_ctrl( //const void* cond,
                              reg_ctx_t cond_ctx ) {
  auto ctrl = "cctrl["+tid+"]";
  dump_Assign( "old_cctrl", ctrl );
  dump_Assign_rand_ctx( ctrl );
  dump_Assume_geq( ctrl, "old_cctrl" );

  // dump_Assume_geq( ctrl, get_reg_ctx( cond ).at(COM_CTX) );
  dump_Assume_geq( ctrl, cond_ctx.at(COM_CTX) );

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

  switch( mm ) {
  case ARMV1:
  case ARMV2: dump_start_thread_arm(); break;
  case CC   : dump_start_thread_cc(); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }
}

// const llvm::CallInst* call
void kbound::dump_thread_create( unsigned bidx, std::string child_tid ) {
  switch( mm ) {
  case ARMV1:
  case ARMV2: dump_thread_create_arm(child_tid); break;
  case CC   : dump_thread_create_cc(child_tid); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }

}

void kbound::dump_thread_join( unsigned bidx, std::string child_tid ) {
  switch( mm ) {
  case ARMV1:
  case ARMV2: dump_thread_join_arm(child_tid); break;
  case CC   : dump_thread_join_cc(child_tid); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }
  // dump_dmbsy(); // All in-flight opertions must commit now
  // dump_Assume_geq(  "cdy[" + tid + "]", "creturn[" + child_tid + "]" );
}

void kbound::dump_lock( std::string gid, reg_ctx_t caddr ) {
  dump_dmbsy();
  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto cr          = "cr"+gaccess;
  auto cw          = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Assign_rand_ctx( cr );
  dump_Assign( cw, cr );

  dump_Assume_geq( cr, "cdy[" + tid + "]" );
  dump_Assume( "mem"+ gctx_access + "== 0" );
  dump_Assign( "mem"+ gctx_access,  "1" );

}

void kbound::dump_unlock( std::string gid, reg_ctx_t caddr ) {
  dump_dmbsy();
  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto cr          = "cr"+gaccess;
  auto cw          = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Assign_rand_ctx( cr );
  dump_Assign( cw, cr );

  dump_Assume_geq( cr, "cdy[" + tid + "]" );
  dump_Assume( "mem"+ gctx_access + "== 1" );
  dump_Assign( "mem"+ gctx_access,  "0" );
}

void kbound::dump_lock_init( std::string gid, reg_ctx_t caddr ) {
  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto cw          = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cw + ")";

  dump_Assign_rand_ctx( cw );

  dump_Assign( "mem"+ gctx_access,  "0" );
}

void kbound::
dump_ld( std::string r, reg_ctx_t cval, reg_ctx_t caddr, std::string gid,
         bool isAcquire, bool isExclusive, bool isLocalUse, std::string loc) {
  if(isLocalUse) {
    dump_Assign( r, "local_mem["+ gid +"]" );
    return;
  }
  switch( mm ) {
  case ARMV1: dump_ld_v1( r, cval,caddr, gid,isAcquire,isExclusive,loc); break;
  case ARMV2: dump_ld_v2( r, cval,caddr, gid,isAcquire,isExclusive,loc); break;
  case CC   : dump_ld_cc( r, cval,caddr, gid,isAcquire,isExclusive,loc); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }

  // if( version == "v1") {
  //   dump_ld_v1( r, cval,caddr, gid, isAcquire, isExclusive );
  // }else{
  //   dump_ld_v2( r, cval,caddr, gid, isAcquire, isExclusive );
  // }
}


void kbound::
dump_st( std::string v, std::string status, reg_ctx_t cval, reg_ctx_t caddr, std::string gid,
         bool isRelease, bool isExclusive, bool isLocalUse, std::string loc) {
  if(isLocalUse) {
    dump_Assign( "local_mem["   + gid + "]", v);
    return;
  }
  switch( mm ) {
  case ARMV1: dump_st_v1(v, status, cval, caddr,gid,isRelease,isExclusive,loc); break;
  case ARMV2: dump_st_v2(v, status, cval, caddr,gid,isRelease,isExclusive,loc); break;
  case CC   : dump_st_cc(v, status, cval, caddr,gid,isRelease,isExclusive,loc); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }

  // if( version == "v1") {
  //   dump_st_v1(  v,  cval, caddr,  gid, isRelease, isExclusive);
  // }else{
  //   dump_st_v2(  v,  cval, caddr,  gid, isRelease, isExclusive);
  // }
}



void kbound::prefix_seq() {
  switch( mm ) {
  case ARMV1: prefix_seq_v1(); break;
  case ARMV2: prefix_seq_v2(); break;
  case CC   : prefix_seq_cc(); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }
}

void kbound::dump_post_context_matching() {
  switch( mm ) {
  case ARMV1:
  case ARMV2: dump_post_context_matching_arm(); break;
  case CC   : dump_post_context_matching_cc(); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }
}

void kbound::dump_begin_transaction() {
  switch( mm ) {
  case CC   : dump_begin_transaction_cc(); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }
}

void kbound::dump_end_transaction() {
  switch( mm ) {
  case CC   : dump_end_transaction_cc(); break;
  default: llvm_bmc_error("kbound", "bad memory model!");
  }
}


// void kbound::dump_end_transaction() {
//   if( version == "v1") {
//     dump_end_transaction_v1();
//   }else{
//     dump_end_transaction_v2();
//   }
// }
