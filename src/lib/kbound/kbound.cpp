#include "lib/kbound/kbound.h"

typedef std::vector<std::string> svec;

kbound::kbound( std::unique_ptr<llvm::Module>& m_,
          options& o_)
    : o(o_)
    , module(m_)
    , ofcpp(o_.outDirPath.string()+"/cmbc.cpp")
    , current_indent(0)
{
}

kbound::~kbound() {
  ofcpp.close();
}

void kbound::dump_newline() { ofcpp << "\n"; }
void kbound::dump_string(std::string s) {
  dump_indent();
  ofcpp << s << "\n";
}

void kbound::dump_comment(std::string s) {
  dump_indent();
  ofcpp << "// " << s << "\n";
}

void kbound::dump_indent() {
  for(unsigned i=0; i < current_indent; i++ ) ofcpp << "  ";
}

void kbound::dump_define(std::string name, std::string val) {
  dump_indent();
  ofcpp << "#define " <<  name << " "<< val << "\n";
}

void kbound::dump_decl_scalar(std::string type, std::string name) {
  dump_indent();
  ofcpp << type << " " << name << ";\n";
}

void kbound::
dump_decl_array(std::string type, std::string name, std::string size) {
  dump_indent();
  ofcpp << type << " " << name << "["<< size <<"];\n";
}

void kbound::
dump_decl_fun(std::string type, std::string name, std::string param) {
  dump_indent();
  ofcpp << type << " " << name << "("<< param <<"){;\n";
  current_indent++;
}

void kbound::
dump_close_scope() {
  assert(current_indent > 0);
  current_indent--;
  dump_indent();
  ofcpp <<"}\n";
}

void kbound::dump_macors(std::string name, std::string val) {
  dump_indent();
  ofcpp << "#define " <<  name << " "<< val << "\n";
}

void kbound::dump_arrays( std::string type,
                          svec arys,
                          std::string dim1, std::string dim2 ) {
  for( std::string ary: arys ) {
    dump_decl_array( type, ary+"_", dim1+"*"+dim2 );
    dump_define( ary + "(x,k)", ary + "_[x*"+dim2+"+k]" );
  }
  dump_newline();
}


void kbound::run() {
  std::cout << "Running k bound\n";
  dump_define("NREGS"   , "5");
  dump_define("ADDRSIZE", "3");
  dump_define("NPROC"   , "2");
  dump_define("NCONTEXT", "10");
  dump_newline();

  dump_comment("declare arrays for value version in contexts");
  svec val_list = {"muinit", "mu", "nwinit", "nu", "deltainit", "delta"};
  dump_arrays( "int", val_list, "ADDRSIZE", "NCONTEXT");

  dump_comment("declare arrays for context stamps");
  svec time_list = { "nu", "pw", "cr", "iw", "cw", "cx", "is", "cs"};
  dump_arrays( "int", time_list, "NPROC", "ADDRSIZE");

  dump_comment("declare arrays for registers");
  svec reg_list = { "reg", "cl", "creg" }; //"ireg",
  dump_arrays( "int", reg_list, "NPROC", "NREGS");

  dump_comment("declare arrays for synchronizations");
  auto proc_list = { "cdy", "cds", "cdl", "cisb", "caddr", "ctrl" };
  for( auto ary: proc_list ) dump_decl_array("int", ary, "NPROC");
  dump_newline();

  dump_comment( "declare arrays for contexts activity" );
  auto ctx_list = {"active","ctx_used"};
  for( auto ary: ctx_list ) dump_decl_array( "int", ary, "NCONTEXT" );
  dump_newline();

  auto var_list = { "old_cr", "old_cdy", "new_iw",
                    "old_cw", "new_cw",   "new_ireg", "new_creg"};
  for( auto v: var_list ) dump_decl_scalar( "int", v);
  dump_newline();

  dump_define("ASSUME(stmt)", "__CPROVER_assume(stmt)");
  dump_define("ASSERT(stmt)", "__CPROVER_assert(stmt, \"error\")");
  dump_newline();

  dump_define("max(a,b)", "{a>b?a:b}");
  dump_newline();

  dump_string("char __get_rng();");
  dump_string("char get_rng( char from, char to ) {");
  dump_string("   char ret = __get_rng(););");
  dump_string("   ASSUME(ret >= from && ret <= to);");
  dump_string("   CTX_USED(ret) = 1;");
  dump_string("   return ret;");
  dump_string("}");

  dump_string("char get_rng_th( char from, char to ) {");
  dump_string("   char ret = __get_rng(););");
  dump_string("   ASSUME(ret >= from && ret <= to);");
  dump_string("   return ret;");
  dump_string("}");
  dump_decl_fun("int", "main", "int argc, char **argv");
  dump_close_scope();
}


  // for( auto ary: reg_list ) dump_decl_array("int", ary,reg_copy_size);
  // dump_newline();

  // for( auto ary: time_list ){
  //   dump_decl_array("int", ary, mem_copy_size);
  // }
  // dump_newline();

  // for( std::string ary: val_list ) {
  //   dump_decl_array( "int", ary+"_", mem_vers_size );
  //   dump_define( ary + "(x,k)", ary + "_[x*NCONTEXT+k]" );
  // }
  // dump_newline();
