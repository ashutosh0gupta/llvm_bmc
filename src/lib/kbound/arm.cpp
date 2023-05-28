#include "lib/kbound/kbound.h"
// #include <boost/algorithm/string.hpp>


void kbound::prefix_seq_new() {
  std::cout << "Running k bound\n";
  preamble();

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
dump_ld_new( std::string r, std::string cval,
             std::string caddr, std::string gid,
             bool isAcquire, bool isExclusive ) {

  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto csr          = "csr"+gaccess; // new
  auto cr          = "cr"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Comment("LD: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isAcquire)     dump_Comment("  : Acquire");
  dump_Assign( "old_cr",  cr);
  dump_Assign( "old_sr",  csr);
  dump_Assign_rand_ctx( cr );
  dump_Assign_rand_ctx( csr );

  dump_Comment("Check");
  dump_Active( cr );
  dump_Active( csr );
  dump_Assume_geq( cr, csr );
  dump_Assume_geq( csr, "old_sr" );

  dump_Assume_geq( cr,   "cl[" + tid + "]" );
  dump_Assume_geq( cr,  "cdy[" + tid + "]" );
  dump_Assume_geq( cr, "cisb[" + tid + "]" );
  dump_Assume_geq( cr,  "cdl[" + tid + "]" );

  dump_Assume_geq( cr, caddr ); //does not match from paper!!
  dump_Assume_geq( cr, "caddrlrs"+gaccess );
  dump_Assume_geq( cr, "cdatalrs"+gaccess );

  // dump_Assume_geq( cr, "iw"+gaccess );

  if( isExclusive ) dump_Assume_geq ( cr, "old_cr" );   // extra in exlusive
  if( isAcquire   ) dump_Assume_geq ( cr, "cx"+gaccess);// extra in lda
  if( isAcquire   ) dump_geq_globals( cr, "cs");        // extra in lda

  dump_Comment("Update");
  dump_Assign_max( cr, "old_cr" );// ??
  dump_Assign( cval, cr  );       // ??
  // dump_Assign( sval, csr );       // ??
  dump_Assign_max( "caddr["+tid+"]", caddr);
  dump_If( csr + " < " + "cw"+gaccess );
  {
    dump_Assign( r, "buff"+gaccess );
    for( unsigned k = 1; k < ncontext; k++ ) {
      auto kn = std::to_string(k);
      auto lb = kn + " > " + "cw"+gaccess;
      auto ub = cr + " > " + kn;
      auto range = "(("+ub+")&&("+lb+"))";
      auto xkn = "(" + gid + ","+ kn +")";
      dump_Assume_implies( range, "sforbid"+ xkn +"> 0" );
    }
  }
  dump_Else();
  {
    dump_Assign( r, "mem"+ gctx_access );
    for( unsigned k = 1; k < ncontext; k++ ) {
      auto kn = std::to_string(k);
      auto lb = kn + " > " + csr;
      auto ub = cr + " > " + kn;
      auto range = "(("+ub+")&&("+lb+"))";
      auto xkn = "(" + gid + ","+ kn +")";
      dump_Assume_implies( range, "sforbid"+ xkn +"> 0" );
    }
    // dump_If( "pw" +gaccess + " != " + "co" + gctx_access );
    // {
    //   dump_Assume_geq( cr, "old_cr" );
    // }
    // dump_Close_scope();
    // dump_Assign( "pw"+gaccess, "co"+ gctx_access ); 
  }
  dump_Close_scope();

  if( isAcquire   ) dump_Assign_max( "cl[" + tid + "]", cr   );
  if( isExclusive ) dump_Assign( "delta"+gctx_access, tid );

  // if( isExclusive ) dump_Assign( "delta"+gctx_access, tid );
  // if( isExclusive ) active_lax = active_lax + 1;
  dump_commit_before_thread_finish(cr);
}

void kbound::
dump_st_new( std::string v, std::string cval,std::string caddr,
             std::string gid, bool isRelease, bool isExclusive ) {
  assert( !is_sc_semantics );

  auto gaccess     = "("+ tid + ","+ gid + ")";
  // auto iw          = "iw"+gaccess;
  auto cw          = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cw + ")";

  dump_Comment("ST: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isRelease)   dump_Comment("  : Release");
  // dump_Assign_rand_ctx( iw );
  dump_Assign( "old_cw",  cw);
  dump_Assign_rand_ctx( cw );

  if( is_sc_semantics ) {
    // dump_Comment("Check");
    // dump_Active( cw );
    // dump_Assume_geq( cw, "cdy[" + tid + "]" );
    // if( isExclusive ) dump_Assume( "delta" + gctx_access + " == "+ tid );

    // dump_Comment("Update");
    // dump_Assign( "cdy[" + tid + "]", cw );
    // dump_Assign( "mem"   + gctx_access, v);
    // dump_String( "co"   + gctx_access + "+=1;");
    // dump_Assign( "delta"+ gctx_access, "-1");
    // if( isExclusive || active_lax > 0 ) dump_Assign(  "cx" + gaccess, cw);
    // if( isExclusive ) active_lax = active_lax - 1;
  }else{
    dump_Comment("Check");
    // dump_Active( iw );
    dump_Active( cw );
    // dump_Assume_geq( iw, cval  );
    // dump_Assume_geq( iw, caddr );
    // dump_Assume_geq( cw, iw );
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

    // if( isRelease ) dump_Assign( "is"+gaccess, iw);
    if( isRelease ) dump_Assign( "cs"+gaccess, cw);
    if( active_lax > 0 ) dump_Assign( "cx"+gaccess, cw);
    if( isExclusive ) active_lax = active_lax - 1;
  }
  dump_commit_before_thread_finish(cw);
}
