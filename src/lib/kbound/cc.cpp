#include "lib/kbound/kbound.h"


//-------------------------------------------------------------------
// Sequential code intialization
//-------------------------------------------------------------------

void kbound::prefix_seq_cc() {
  preamble();

  dump_Comment( "declare arrays for intial value version in contexts" );
  val_init_list = { "meminit" };
  dump_Arrays( "int", val_init_list,  "NTHREAD", "ADDRSIZE", "NCONTEXT");

  // dump_Comment( "declare arrays for context stamps" );
  // ctx_list = {
  //   "ct"
  // };
  // dump_Arrays( "int", ctx_list, "NTHREAD", "ADDRSIZE");

  proc_list = {
    "ct"
  };
  for( auto ary: proc_list ) dump_Decl_array("int", ary, "NTHREAD");

  dump_Comment( "declare arrays for running value version in contexts" );
  val_list = {
    "mem", // snap shot
  };
  dump_Arrays( "int", val_list,  "NTHREAD", "ADDRSIZE", "NCONTEXT");

  var_list = { "old_ct", "old_cctrl", "old_cr", "old_cdy", "old_cw",  "new_creg" };
  dump_Newline();
  dump_String("__LOCALS__");

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
        for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
          auto pn = std::to_string(p);
          dump_Assign( "mem("+ pn + "," + pos + "+" + in + ",0)", ival );
        }
    }
  }
  dump_Comment( "Dumping context matching equalities" );
  for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < num_globals; x++ ) {
      auto xn = std::to_string(x);
      for( unsigned k = 1; k < ncontext; k++ ) {
        auto kn = std::to_string(k);
        auto xkn = "("+pn+","+xn+","+kn+")";
        for( auto ary: val_list ) dump_Assign( ary+xkn, ary+"init"+xkn );
      }
    }
  }
}

void kbound::dump_post_context_matching_cc() {
  for( unsigned p = 0; p < bmc_obj.sys_spec.threads.size(); p++ ) {
    auto pn = std::to_string(p);
    for( unsigned x = 0; x < num_globals; x++ ) {
      auto xn = std::to_string(x);
      for( unsigned k = 0; k < ncontext-1; k++ ) {
        auto xkn  = "("+pn+","+xn+","+std::to_string(k)+")";
        auto xknp = "("+pn+","+xn+","+std::to_string(k+1)+")";
        for( auto ary: val_list ) dump_Assume(ary+"init"+xknp +" == "+ary+xkn);
      }
    }
  }
}

//-------------------------------------------------------------------
// Thread initialization
//-------------------------------------------------------------------

void kbound::dump_start_thread_cc() {
  // auto cdy     =     "cdy[" + tid + "]";
  // auto cstart  =  "cstart[" + tid + "]";  // if we turn the local variabls
  // dump_Assign_rand_ctx( cdy ); //todo : do we need to do this
  // dump_Assume_geq( cdy, cstart );
}

//-------------------------------------------------------------------
// Thread create and join
//-------------------------------------------------------------------

void kbound::dump_thread_create_cc(std::string child_tid) {
  // dump_dmbsy(); // All in-flight opertions must commit now
  // dump_Assume_geq( "cstart[" + child_tid + "]", "cdy[" + tid + "]");
}

void kbound::dump_thread_join_cc( std::string child_tid ) {
  // dump_dmbsy(); // All in-flight opertions must commit now
  // dump_Assume_geq(  "cdy[" + tid + "]", "creturn[" + child_tid + "]" );
}

//-------------------------------------------------------------------
// Handling load/store and transaction begin/end
//-------------------------------------------------------------------

void kbound::
dump_ld_cc( std::string r,     // register name
            reg_ctx_t cval,  // context of register value (to be updated)
            reg_ctx_t caddr, // context of address   (ignoring here for now)
            std::string gid,   // global variable index
            bool isAcquire,    // properties of access (ignored here)
            bool isExclusive,  // properties of access (ignored here)
            std::string loc
            ) {
  assert(inside_transaction);
  auto t = "["+ tid +"]";
  auto ct  = "ct"+t;
  dump_Assume_geq(cval[COM_CTX], ct);
  dump_Assign( r, "buff["+gid+"]");
}


void kbound::
dump_st_cc( std::string r,     // register name
            reg_ctx_t cval,  // context of register value
            reg_ctx_t caddr, // context of address   (ignoring here)
            std::string gid,   // global variable index
            bool isRelease,    // properties of access (ignored here)
            bool isExclusive,   // properties of access (ignored here)
            std::string loc
            ) {
  assert(inside_transaction);
  auto t = "["+ tid +"]";
  auto ct  = "ct"+t;
  dump_Assign( "buff["+gid+"]", r );
  dump_Assume_geq(cval[COM_CTX], ct);
}


void kbound::dump_begin_transaction_cc() {
  auto t = "["+ tid +"]";
  auto ct  = "ct"+t;

  // What to to do here?
  dump_Comment("LD: Guess");
  dump_Assign( "old_ct",  ct);
  dump_Assign_rand_ctx( ct );
  dump_Assume_geq(ct, "old_ct");
  for( unsigned x = 0; x < num_globals; x++ ) {
    auto xn = std::to_string(x);
    dump_Assign_rand_thread( "access_idx["+xn+"]");
    dump_Assign( "buff["+xn+"]",
                 "mem( access_idx["+xn+"]" +","+ xn +","+ ct +")" );
  }
  if( inside_transaction )
    llvm_bmc_error("kbound", "Nested transactions are not allowed");
  inside_transaction = true;
}


void kbound::dump_end_transaction_cc() {
  if( !inside_transaction )
    llvm_bmc_error("kbound", "tranaction begin/end mismatch");
  inside_transaction = false;
}
