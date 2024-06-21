#include "lib/kbound/kbound.h"
#include "nameconvention.h"
// #include <boost/algorithm/string.hpp>

//-------------------------------------------------------------------
// Thread create and join
//-------------------------------------------------------------------

void kbound::dump_thread_create_arm(std::string child_tid) {
  dump_dmbsy(); // All in-flight opertions must commit now
  dump_Assume_geq( "cstart[" + child_tid + "]", "cdy[" + tid + "]");
}


void kbound::dump_thread_join_arm( std::string child_tid ) {
  dump_dmbsy(); // All in-flight opertions must commit now
  dump_Assume_geq(  "cdy[" + tid + "]", "creturn[" + child_tid + "]" );
}

//-------------------------------------------------------------------
// Thread initializing and final finishing
//-------------------------------------------------------------------

void kbound::dump_start_thread_arm() {
  if(is_sc_semantics) dump_Comment( "Thread semantics = SC");
  auto cdy     =     "cdy[" + tid + "]";
  auto cstart  =  "cstart[" + tid + "]";  // if we turn the local variabls
  dump_Assign_rand_ctx( cdy ); //todo : do we need to do this
  dump_Assume_geq( cdy, cstart );
  if( tid != "0" ) {
    // Skipping the thread code

    // dump_If( "skip_"+tid );{
    //   dump_Goto( block_name("_END") );
    // } dump_Close_scope();
  }
}

void kbound::dump_post_context_matching_arm() {
  for( unsigned x = 0; x < num_globals; x++ ) {
    auto xn = std::to_string(x);
    for( unsigned k = 0; k < ncontext-1; k++ ) {
      auto xkn = "("+xn+","+std::to_string(k)+")";
      auto xknp = "("+xn+","+std::to_string(k+1)+")";
      for( auto ary: val_list ) dump_Assume(ary+"init"+xknp +" == "+ary+xkn);
    }
  }
}


//-------------------------------------------------------------------
// ARM V1
//-------------------------------------------------------------------

void kbound::prefix_seq_v1() {
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
    "buff", // Local buffer; not a ctx stamp
    "pw",   // Last write seen in the thread
  };
  dump_Arrays( "int", local_list, "NTHREAD", "ADDRSIZE" );

  dump_Comment( "declare arrays for context stamps" );
  ctx_list = {
    NameConvention::LD_COM_CNTXT,        // Last read commit ctx
    "iw", "cw",  // Write commit ctx
    "cx",        // exclusive commit
    "is",        // RA model write init
    "cs",        // RA model write commmit
    "crmax"      // max read ctx seen so far //ashu added?
  };
  dump_Arrays( "char", ctx_list, "NTHREAD", "ADDRSIZE");

  //to record when can we not commit; no initialization
  dump_Arrays( "char", {"sforbid"}, "ADDRSIZE", "NCONTEXT");//ashu added?

  dump_Comment( "declare arrays for synchronizations" );
  proc_list = {
    "cl",                        // Ctxstamps for load acquire
    NameConvention::DMB_SY_COM_CNTXT,
    NameConvention::DMB_ST_COM_CNTXT,
    NameConvention::DMB_LD_COM_CNTXT,
    NameConvention::ISB_COM_CNTXT, // Ctxstamps for four kind of fences
    "caddr", "cctrl"             // Ctxstamps for addr and ctrl
  };
  for( auto ary: proc_list ) dump_Decl_array("int", ary, "NTHREAD");


  var_list = {
    "old_cctrl",
    NameConvention::OLD_LD_COM_CNTXT,
    "old_cdy",
    "old_cw",
    "new_creg" };
  dump_Newline();

  // records ctx and processes
  for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < num_globals; x++ ) {
      auto xn = std::to_string(x);
      for( auto ary: local_list) dump_String( ary + "("+pn+","+xn+") = 0;" );
      for( auto ary: ctx_list ) dump_String( ary + "("+pn+","+xn+") = 0;" );
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
dump_ld_v1( std::string r, reg_ctx_t cval,reg_ctx_t caddr,
            std::string gid,
            bool isAcquire, bool isExclusive, std::string loc ) {

  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto cr          = "cr"+gaccess;
  auto gctx_access = "("+ gid +","+ cr + ")";

  dump_Comment("LD: Guess");
  if(isExclusive)   dump_Comment("  : Exclusive");
  if(isAcquire)     dump_Comment("  : Acquire");
  dump_Assign( "old_cr",  cr);
  dump_Assign_rand_ctx( cr, tid + " ASSIGN LDCOM " + loc);

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
    dump_Assume_geq( cr, caddr[COM_CTX] );
    dump_Assume_geq( cr,  "cdy["+ tid + "]" );
    dump_Assume_geq( cr, "cisb["+ tid + "]" );
    dump_Assume_geq( cr,  "cdl["+ tid + "]" );
    dump_Assume_geq( cr,   "cl["+ tid + "]" );
    if( isExclusive ) dump_Assume_geq ( cr, "old_cr" );   // extra in exclusive
    if( isAcquire   ) dump_Assume_geq ( cr, "cx"+gaccess);// extra in lda
    if( isAcquire   ) dump_geq_globals( cr, "cs");        // extra in lda

    dump_Comment("Update");
    dump_Assign( cval[COM_CTX], cr );
    dump_Assign_max( "crmax"+gaccess, cr);
    dump_Assign_max( "caddr["+ tid + "]", caddr[COM_CTX]); //Ashu added?
    dump_If( cr + " < " + "cw"+gaccess );
    {
      dump_Assign( r, "buff"+gaccess );
      range_forbid( gid, "cw"+gaccess, "crmax"+gaccess ); //Ashu added?
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

    if( isAcquire   ) dump_Assign_max( "cl["+ tid + "]", cr   );
  }
  if( isExclusive ) dump_Assign( "delta"+gctx_access, tid );
  if( isExclusive ) active_lax = active_lax + 1;
  dump_commit_before_thread_finish(cr);
}


void kbound::
dump_st_v1( std::string v,
            std::string status, reg_ctx_t cval,reg_ctx_t caddr, std::string gid,
            bool isRelease, bool isExclusive, std::string loc) {

  auto gaccess     = "("+ tid + ","+ gid + ")";
  auto iw          = "iw"+gaccess;
  auto cw          = "cw"+gaccess;
  auto gctx_access = "("+ gid +","+ cw + ")";

  dump_Comment("ST: Guess");
  if(isExclusive)   dump_Comment("  : Exclusive");
  if(isRelease)   dump_Comment("  : Release");
  dump_Assign_rand_ctx( iw, tid + " ASSIGN STIW " + loc );
  dump_Assign( "old_cw",  cw);
  dump_Assign_rand_ctx( cw, tid + " ASSIGN STCOM " + loc );

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
    dump_Assume( "sforbid"+ gctx_access + "== 0" ); //ashu added?
    dump_Assume_geq( iw, cval[COM_CTX]  );
    dump_Assume_geq( iw, caddr[COM_CTX] );
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
    // dump_Assign_max( "RegCntxtRAddr[" + tid + "]", cval ); // << error
    dump_Assign_max( "caddr[" + tid + "]", caddr[COM_CTX] );
    dump_Assign( "buff" + gaccess, v);
    dump_Assign( "mem"   + gctx_access    , v);
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

//-------------------------------------------------------------------
// ARM V2
//-------------------------------------------------------------------

void kbound::prefix_seq_v2() {
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
    NameConvention::CURR_LOC_MEM_VAL, // Local buffer; not a ctx stamp
    // "pw",   // Last write seen in the thread
  };
  dump_Arrays( "int", local_list, "NTHREAD", "ADDRSIZE" );

  dump_Comment( "declare arrays for context stamps" );
  ctx_list = {
    // Last read commit ctx
    NameConvention::LD_SAT_CNTXT,
    NameConvention::LD_COM_CNTXT,
    // "iw",
    NameConvention::ST_COM_CNTXT,  // Write commit ctx
    // "cx",        // exclusive commit
    // "is",        // RA model write init
    NameConvention::ADDR_LRS_COM_CNTXT,
    NameConvention::DATA_LRS_COM_CNTXT,
    NameConvention::XPENDING,
    NameConvention::MAX_LD_COM_CNTXT,      // max read ctx seen so far //ashu added?
  };
  dump_Arrays( "int", ctx_list, "NTHREAD", "ADDRSIZE");

  dump_Comment( "declare arrays for synchronizations" );
  proc_list = {
    NameConvention::STR_COM_CNTXT,
    NameConvention::LDA_COM_CNTXT,               // Ctxstamps for store/load RA
    NameConvention::DMB_SY_COM_CNTXT,
    NameConvention::DMB_ST_COM_CNTXT,
    NameConvention::DMB_LD_COM_CNTXT,
    NameConvention::ISB_COM_CNTXT, // Ctxstamps for four kind of fences
    "caddr", "cctrl"             // Ctxstamps for addr and ctrl
  };
  for( auto ary: proc_list ) dump_Decl_array("int", ary, "NTHREAD");

  // thread_ctrl_list = { "cstart", "creturn"};
  // for( auto ary: thread_ctrl_list ) dump_Decl_array("int", ary, "NTHREAD");
  // dump_Newline();

  // dump_Comment( "declare arrays for contexts activity" );
  // ctx_list = { "active", "ctx_used" };
  // for( auto ary: ctx_list ) dump_Decl_array( "int", ary, "NCONTEXT" );
  // dump_Newline();

  var_list = { "old_cctrl",
               NameConvention::OLD_LD_SAT_CNTXT,
               NameConvention::OLD_LD_COM_CNTXT,
               "old_cdy",
               "old_cw",
               "new_creg" };
  dump_Newline();

  // records ctx and processes
  for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < num_globals; x++ ) {
      auto xn = std::to_string(x);
      for( auto ary: local_list) dump_String( ary + "("+pn+","+xn+") = 0;" );
      for( auto ary: ctx_list ) dump_String( ary + "("+pn+","+xn+") = 0;" );
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
dump_ld_v2( std::string CurrRegValRTrgt,
            reg_ctx_t RegCntxtRTrgt, // ctxstamp for value to be updated
            reg_ctx_t RegCntxtRAddr,// ctxstamp of address (input)
            std::string gid,
            bool isAcquire, bool isExclusive, std::string loc ) {
  assert( !is_sc_semantics );

  auto t_g  = "(" + tid + "," + gid + ")";
  auto sr   = NameConvention::LD_SAT_CNTXT + t_g;
  auto cr   = NameConvention::LD_COM_CNTXT + t_g;
  auto g_sr = "(" + gid + "," + sr + ")";
  auto t    = "[" + tid + "]";

  dump_Comment(" ====== LD: Guess ======");
  if(isExclusive)   dump_Comment("  : Exclusive");
  if(isAcquire)     dump_Comment("  : Acquire");
  // Line 2
  dump_Assign( NameConvention::OLD_LD_SAT_CNTXT,  sr);
  if (NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assign( NameConvention::OLD_LD_COM_CNTXT,  cr);
  }
  else
  {
    dump_Comment("--- TODO: Missing old_LDComCntxt?");
  }
  // Line 3
  dump_Assign_rand_ctx( sr, tid + " ASSIGN LDSaTCntxt " + loc );
  dump_Assign_rand_ctx( cr, tid + " ASSIGN LDComCntxt " + loc );

  dump_Comment("====== Check ======");
  // Line 4
  dump_Active( cr );
  dump_Active( sr );
  // Line 5
  dump_Assume_geq( cr, sr );
  if (NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assume_geq( sr, NameConvention::OLD_LD_SAT_CNTXT );
  }
  else
  {
    dump_Comment("--- TODO: Missing LDSatContxt >= old_LDSatCntxt?");
  }
  // Line 6
  dump_Assume_geq( cr, NameConvention::LDA_COM_CNTXT + t );
  // Line 7
  dump_Assume_geq( cr, NameConvention::DMB_SY_COM_CNTXT + t );
  dump_Assume_geq( cr, NameConvention::DMB_LD_COM_CNTXT + t );
  dump_Assume_geq( cr, NameConvention::ISB_COM_CNTXT + t );

  // TODO: Check
  // Line 8
  dump_Comment("--- TODO: Check the following encoding");
  dump_Assume_geq( cr, RegCntxtRAddr[COM_CTX] ); //does not match from paper; paper is syncing with all addr
  dump_Assume_geq( cr, NameConvention::ADDR_LRS_COM_CNTXT + t_g );
  dump_Assume_geq( cr, NameConvention::DATA_LRS_COM_CNTXT + t_g );
  // Line 9
  if( isAcquire ) dump_Assume_geq( cr, NameConvention::STR_COM_CNTXT + t );

  dump_Comment("====== Update ======");
  // TODO: Check this data structure
  // Line 10
  dump_Comment("--- TODO: Check the following data structure");
  dump_Assign_max( NameConvention::MAX_LD_COM_CNTXT + t_g, cr);  // << replaces something in code
  // Line 11 is missing
  // LDComCntxt (p) := max (old-LDComCntxt, LDComCntxt (l) (p))
  dump_Comment("--- TODO: Missing LDComCntxt (p) := max (old-LDComCntxt, LDComCntxt (l) (p))");
  // Line 12
  if (NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assign( RegCntxtRTrgt[SAT_CTX], sr  );
    dump_Assign( RegCntxtRTrgt[COM_CTX], cr  );
  }
  else
  {
    dump_Comment("--- TODO: Missing RegSatCntxt(r^trgt) = LDSatCntxt");
    dump_Assign( RegCntxtRTrgt[COM_CTX], cr  ); //
  }
  // Line 13
  dump_Assign_max( NameConvention::ADDR_COM_CNTXT + "["+tid+"]", RegCntxtRAddr[COM_CTX]);
  // Line 14
  dump_Comment("--- TODO: This if condition should be related to r_trgt");
  dump_If( sr + " < " + NameConvention::ST_COM_CNTXT + t_g );
  {
    dump_Assign( CurrRegValRTrgt, NameConvention::CURR_LOC_MEM_VAL + t_g );
    range_forbid( gid, NameConvention::ST_COM_CNTXT + t_g, NameConvention::MAX_LD_COM_CNTXT + t_g );
    // range_forbid( gid, "cw"+t_g, "cr"+t_g );
  }
  // Line 18
  dump_Else();
  {
    dump_Assign( CurrRegValRTrgt, NameConvention::INIT_MEM_VAL + g_sr );
    if (NameConvention::ENCODE_AS_PAPER)
    {
      range_forbid( gid, NameConvention::ST_COM_CNTXT + t_g, NameConvention::MAX_LD_COM_CNTXT + t_g );
    }
    else
    {
      dump_Comment("--- TODO: Should be part of line 12");
      dump_Assume_geq( sr, NameConvention::OLD_LD_SAT_CNTXT ); // << different from paper
      range_forbid( gid, sr, cr ); // cr -> crmax
    }
  }
  dump_Close_scope();

  // Line 21
  if( isAcquire ) dump_Assign_max(  NameConvention::LDA_COM_CNTXT + t, cr   );
  // Line 22
  if( isExclusive ) {
    dump_If_NonDet();{
      dump_Assign( NameConvention::XPENDING + g_sr, tid );
    }
    dump_Close_scope();
  }

  dump_commit_before_thread_finish(cr);
}



void kbound::
dump_st_v2( std::string v,
            std::string status, // in case of exclusive store returns a status
            reg_ctx_t RegCntxtRSrc, // ctxstamp for value (input)
            reg_ctx_t RegCntxtRAddr,// ctxstamp for address (input)
            std::string gid, // global 
            bool isRelease,
            bool isExclusive, std::string loc ) {
  assert( !is_sc_semantics );

  auto t_g  = "("+ tid + ","+ gid + ")";
  auto cw   = NameConvention::ST_COM_CNTXT + t_g;
  auto g_cw = "("+ gid +","+ cw + ")";
  auto t    = "["+ tid + "]";

  dump_Comment(" ====== ST: Guess ======");
  if(isExclusive) dump_Comment("  : Exclusive");
  if(isRelease  ) dump_Comment("  : Release");
  // Line 3
  dump_Assign( NameConvention::OLD_ST_COM_CNTXT,  cw);
  dump_Assign_rand_ctx( cw, tid + " ASSIGN STComCntxt " + loc );

  dump_Comment("====== Check ======");
  // Line 4
  dump_Active( cw );
  // Line 5
  dump_Assume( "sforbid"+ g_cw + "== 0" );
  // Line 6
  dump_Assume_geq( cw, NameConvention::OLD_ST_COM_CNTXT );
  if (NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assume_geq( cw, NameConvention::OLD_LD_COM_CNTXT + t_g );//<< was in old version
  }
  else
  {
    dump_Assume_geq( cw, NameConvention::MAX_LD_COM_CNTXT + t_g );
  }
  // Line 7
  dump_Assume_geq( cw, NameConvention::LDA_COM_CNTXT + t );

  // Line 8
  dump_Assume_geq( cw, NameConvention::DMB_SY_COM_CNTXT + t );
  dump_Assume_geq( cw, NameConvention::DMB_LD_COM_CNTXT + t );
  dump_Assume_geq( cw, NameConvention::DMB_ST_COM_CNTXT + t );
  if (!NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assume_geq( cw, NameConvention::ISB_COM_CNTXT + t ); // ?? missing in paper
  }

  // Line 9
  dump_Assume_geq( cw, RegCntxtRAddr[COM_CTX] );
  dump_Comment("--- TODO: Check the following data structure");
  dump_Assume_geq( cw, RegCntxtRSrc[COM_CTX] );
  dump_Assume_geq( cw, NameConvention::CTRL + t );

  // Line 10
  dump_Assume_geq( cw, NameConvention::ADDR_COM_CNTXT + t );

  if (!NameConvention::ENCODE_AS_PAPER)
  {
    dump_Comment("--- TODO: Paper does not have those contraints");
    if( isRelease ) dump_geq_globals( cw, NameConvention::LD_COM_CNTXT); // missing in paper // why? -- old code?
    if( isRelease ) dump_geq_globals( cw, NameConvention::ST_COM_CNTXT); // missing in paper // why? -- old code?
  }

  if( isExclusive ) dump_Assume( NameConvention::XPENDING + t_g + " > 0" ); // Paper has type mismatch
  if( isExclusive ) range_forbid( gid, NameConvention::XPENDING + t_g, cw );

  dump_Comment("====== Update ======");
  // Line 15
  dump_Assign( NameConvention::CURR_LOC_MEM_VAL + t_g , v);
  dump_Assign( NameConvention::CURR_GLOB_MEM_VAL + g_cw, v); // << indexing wrong in paper

  // Line 16
  // TODO: Incorrect params?
  dump_Assign_max( "RegCntxtRAddr"    + t,   RegCntxtRAddr[COM_CTX] );

  // Line 17
  if (NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assign_max(NameConvention::ADDR_LRS_COM_CNTXT + t_g, RegCntxtRAddr[COM_CTX]);
  }
  else
  {
    dump_Assign( NameConvention::ADDR_LRS_COM_CNTXT + t_g, RegCntxtRAddr[COM_CTX] ); //
  }

  // Line 18
  if (NameConvention::ENCODE_AS_PAPER)
  {
    dump_Assign_max(NameConvention::DATA_LRS_COM_CNTXT + t_g, RegCntxtRSrc[COM_CTX]);
  }
  else
  {
    dump_Assign( NameConvention::DATA_LRS_COM_CNTXT + t_g, RegCntxtRSrc[COM_CTX]  ); //
  }

  // Line 19
  dump_Comment("Do we need Xpending if no exculise accesses?");
  dump_Assign( NameConvention::XPENDING + t_g, "0");

  // Line 20
  if( isRelease ) dump_Assign_max(  NameConvention::STR_COM_CNTXT + t, cw );

  if (!NameConvention::ENCODE_AS_PAPER)
  {
    if( isExclusive )
    {
      dump_Comment("--- TODO: Missing in the paper");
      dump_Assign( status, "1" ); // since only allow success
    }
  }
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

  // for( auto& v : global_position ) {
  //   auto g = v.first;
  //   dump_Comment( std::to_string(v.second) + ":" + global_name.at(g) +
  //                 + ":" + std::to_string(global_size.at(g)) );
  // }
  // std::cout << "Running k bound\n";
  // dump_Define("ADDRSIZE",std::to_string( num_globals ) );
  // dump_Define( "NTHREAD"   , std::to_string( bmc_obj.sys_spec.threads.size() ) );
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
// if( isExclusive ) dump_Assign( "delta"+g_cr, tid );
// if( isExclusive ) active_lax = active_lax + 1;
// dump_Assume_geq( cr, "iw"+t_g );
// if( isExclusive ) dump_Assume_geq ( cr, "old_cr" );   // extra in exclusive
//   if( isAcquire   ) dump_Assume_geq ( cr, "cx"+t_g);// extra in lda
