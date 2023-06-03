#include "lib/kbound/kbound.h"
// #include <boost/algorithm/string.hpp>


void kbound::prefix_seq_v2() {
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

  //to record when can we not commit; no initialization
  dump_Arrays( "char", {"sforbid"}, "ADDRSIZE", "NCONTEXT");

  dump_Comment( "declare arrays for local buffer and observed writes" );
  local_list = {
    "buff", // Local buffer; not a time stamp
    // "pw",   // Last write seen in the thread
  };
  dump_Arrays( "int", local_list, "NPROC", "ADDRSIZE" );

  dump_Comment( "declare arrays for context stamps" );
  time_list = {
    "sr", "cr",        // Last read commit ctx
    // "iw",
    "cw",  // Write commit ctx
    // "cx",        // exclusive commit
    // "is",        // RA model write init
    "clrsaddr",
    "clrsval",
    "xpanding",
  };
  dump_Arrays( "int", time_list, "NPROC", "ADDRSIZE");

  dump_Comment( "declare arrays for synchronizations" );
  proc_list = {
    "cstr","clda",               // Timestamps for store/load RA
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

  var_list = { "old_cctrl", "old_sr", "old_cr", "old_cdy", "old_cw",  "new_creg" };
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


    // for( unsigned k = 1; k < ncontext; k++ ) {
    //   auto kn = std::to_string(k);
    //   auto lb = kn + " > " + "cw"+gaccess;
    //   auto ub = cr + " > " + kn;
    //   auto range = "(("+ub+")&&("+lb+"))";
    //   auto xkn = "(" + gid + ","+ kn +")";
    //   dump_Assume_implies( range, "sforbid"+ xkn +"> 0" );
    // }

void kbound::
dump_ld_v2( std::string r, std::string cval,
             std::string caddr, std::string gid,
             bool isAcquire, bool isExclusive ) {

  auto t_g  = "("+ tid + ","+ gid + ")";
  auto sr   = "sr"+t_g; // new
  auto cr   = "cr" +t_g;
  auto g_cr = "("+ gid +","+ cr + ")";
  auto t    = "["+ tid + "]";

  dump_Comment("LD: Guess");
  if(isExclusive)   dump_Comment("  : Exlusive");
  if(isAcquire)     dump_Comment("  : Acquire");
  dump_Assign( "old_cr",  cr);
  dump_Assign( "old_sr",  sr);
  dump_Assign_rand_ctx( sr, tid + " ASSIGN LDSAT " );
  dump_Assign_rand_ctx( cr, tid + " ASSIGN LDCOM " );

  dump_Comment("Check");
  dump_Active( cr );
  dump_Active( sr );
  dump_Assume_geq( cr, sr );
  dump_Assume_geq( sr, "old_sr" );

  dump_Assume_geq( cr, "clda" + t );
  dump_Assume_geq( cr,  "cdy" + t );
  dump_Assume_geq( cr, "cisb" + t ); // isb is here??
  dump_Assume_geq( cr,  "cdl" + t );

  dump_Assume_geq( cr, caddr ); //does not match from paper; paper is syncing with all addr
  // dump_Assume_geq( sr, caddr );          // << ordering against sat
  dump_Assume_geq( sr, "clrsaddr"+t_g ); // << different from the paper
  dump_Assume_geq( sr, "clrsval" +t_g ); // << different from the paper

  // dump_Assume_geq( cr, "clrsaddr"+t_g ); // << in the paper
  // dump_Assume_geq( cr, "clrsval" +t_g ); // << in the paper
  if( isAcquire ) dump_Assume_geq( cr, "cstr" + t );

  dump_Comment("Update");
  // dump_Assign_max( cr, "old_cr" ); // << cr is updated again??
  // dump_Assign_max( "crmax"+t_g, "old_cr" ); // << cr is updated again??
  dump_Assign( cval, sr  );        //
  // dump_Assign( sval, sr );     // Why??
  dump_Assign_max( "caddr["+tid+"]", caddr);
  dump_If( sr + " < " + "cw"+t_g );
  {
    dump_Assign( r, "buff"+t_g );
    range_forbid( gid, "cw"+t_g, cr );
  }
  dump_Else();
  {
    dump_Assign( r, "mem"+ g_cr );
    range_forbid( gid, sr, cr );
  }
  dump_Close_scope();

  if( isAcquire   ) dump_Assign_max( "clda" + t, cr   );
  if( isExclusive ) {
    dump_If_NonDet();{
      dump_Assign( "xpanding"+g_cr, tid );
    }dump_Close_scope();
  }

  dump_commit_before_thread_finish(cr);
}

// if( isExclusive ) dump_Assign( "delta"+g_cr, tid );
// if( isExclusive ) active_lax = active_lax + 1;
// dump_Assume_geq( cr, "iw"+t_g );
// if( isExclusive ) dump_Assume_geq ( cr, "old_cr" );   // extra in exlusive
//   if( isAcquire   ) dump_Assume_geq ( cr, "cx"+t_g);// extra in lda

void kbound::
dump_st_v2( std::string v, std::string cval,std::string caddr,
             std::string gid, bool isRelease, bool isExclusive ) {
  assert( !is_sc_semantics );

  auto t_g  = "("+ tid + ","+ gid + ")";
  auto cw   = "cw"+t_g;
  auto g_cw = "("+ gid +","+ cw + ")";
  auto t    = "["+ tid + "]";

  dump_Comment("ST: Guess");
  if(isExclusive) dump_Comment("  : Exlusive");
  if(isRelease  ) dump_Comment("  : Release");
  dump_Assign( "old_cw",  cw);
  dump_Assign_rand_ctx( cw, tid + " ASSIGN STCOM " );

  dump_Comment("Check");
  // dump_Active( iw );
  dump_Active( cw );
  dump_Assume( "sforbid"+ g_cw + "== 0" );
  dump_Assume_geq( cw, "old_cw" );
  dump_Assume_geq( cw, "cr"    + t_g   );
  dump_Assume_geq( cw, "clda" + t );

  dump_Assume_geq( cw, "cisb" + t ); // ?? missing in paper
  dump_Assume_geq( cw, "cdy"  + t );
  dump_Assume_geq( cw, "cdl"  + t );
  dump_Assume_geq( cw, "cds"  + t );

  dump_Assume_geq( cw, cval  );
  dump_Assume_geq( cw, caddr );
  // dump_Assume_geq( cw, iw );

  if( isRelease ) dump_geq_globals( cw, "cr"); // missing in paper
  if( isRelease ) dump_geq_globals( cw, "cw"); // missing in paper

  dump_Assume_geq( cw, "cctrl" + t ); // missing in paper
  dump_Assume_geq( cw, "caddr" + t );

  if( isExclusive ) dump_Assume( "xpanding" + t_g + ">0" ); // Paper has type mismatch
  if( isExclusive ) range_forbid( gid, "xpanding"+t_g, cw );

  dump_Comment("Update");
  dump_Assign( "buff"  + t_g , v);
  dump_Assign( "mem"   + g_cw, v); // << indexing wrong in paper
  dump_Assign_max( "caddr"    + t,   caddr );
  dump_Assign_max( "clrsaddr" + t_g, caddr );
  dump_Assign_max( "clrsval"  + t_g, cval  );
  dump_Assign( "xpanding"+ t_g, "0");
  if( isRelease ) dump_Assign_max( "cstr" + t, cw );

  dump_commit_before_thread_finish(cw);
}


  // if( isExclusive ) dump_Assign( "cx"   + t_g, cw);
  // dump_String( "co"   + g_cw + "+=1;");
  // dump_Assign( "delta"+ g_cw, "-1");

  //   // if( isRelease ) dump_Assign( "is"+t_g, iw);
  // if( active_lax > 0 ) dump_Assign( "cx"+t_g, cw);
  // if( isExclusive ) active_lax = active_lax - 1;


    // for( unsigned k = 1; k < ncontext; k++ ) {
    //   auto kn = std::to_string(k);
    //   auto lb = kn + " > " + sr;
    //   auto ub = cr + " > " + kn;
    //   auto range = "(("+ub+")&&("+lb+"))";
    //   auto xkn = "(" + gid + ","+ kn +")";
    //   dump_Assume_implies( range, "sforbid"+ xkn +"> 0" );
    // }
