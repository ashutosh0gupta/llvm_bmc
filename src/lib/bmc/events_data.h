#ifndef LLVM_BMC_EVENTSDATA_H
#define LLVM_BMC_EVENTSDATA_H

#include "include/options.h"
#include "include/solver.h"
#include "include/spec.h"
#include "include/memory_event.h"

struct thread_events {
  std::string name;
  me_vec events;
  me_ptr start_event, final_event;
};

class events_data {
public:

  events_data( options& o_ ) : o(o_) {}

  options& o;

  std::vector< thread_events > ev_threads;

  me_set all_events;
  std::set< std::tuple<std::string,me_ptr,me_ptr> > reading_map;
  variable_set globals;
  var_to_ses_map wr_events;
  var_to_me_vec_map rd_events;
  me_ptr init_loc; // todo : remove their prev/post to avoid leaks
  me_ptr post_loc;
  std::map< std::string, me_ptr> create_map;
  std::map< std::string, std::pair<me_ptr, expr > > join_map;

  me_to_ses_map seq_before;
  me_to_ses_map seq_dom_wr_before;
  me_to_ses_map seq_dom_wr_after;  
  
  me_vec all_es;
  bool seq_ordering_has_been_called = false;

  // pre calculation of orderings
  me_to_ses_map must_after;
  me_to_ses_map must_before;
  me_to_depends_map may_after;
  me_to_depends_map ppo_before;
  me_to_depends_map c11_rs_heads; // c11 release sequence heads

  expr phi_ses      = o.solver_ctx.bool_val(true);
  expr phi_post     = o.solver_ctx.bool_val(true);
  expr phi_pre      = o.solver_ctx.bool_val(true); //z3.c.bool_val(true);
  expr phi_po       = o.solver_ctx.bool_val(true);
  expr phi_vd       = o.solver_ctx.bool_val(true);
  expr phi_pi       = o.solver_ctx.bool_val(true);
  expr phi_prp      = o.solver_ctx.bool_val(true);
  expr phi_fea      = o.solver_ctx.bool_val(true); // feasable traces
  expr phi_distinct = o.solver_ctx.bool_val(true); //ensures that all locations are distinct

  inline const thread_events& get_thread(unsigned t) const { //To be moved?
      assert( t < ev_threads.size() );
      return ev_threads[t];
    }

  void add_global( std::string g, sort sort ) {
      globals.insert( variable(g, sort) );
    }

    // todo: only return const reference??
    variable get_global( std::string gname ) {
      for( auto& g : globals ) {
        if( gname == g.name )
          return g;
      }
      llvm_bmc_error( "bmc","global variable " << gname << " not found!" );
      variable g(o.solver_ctx); // dummy code to suppress warning
      return g;
    }

   inline const me_ptr get_create_event(unsigned t) const {
      assert( t < ev_threads.size() );
      std::string n = ev_threads[t].name;
      auto it = create_map.find( n );
      if( it != create_map.end() )
        return create_map.at(n); //todo : rewrite to end double search
      else
        return nullptr;
    }

    inline const me_ptr get_join_event(unsigned t) const {
      assert( t < ev_threads.size() );
      std::string n = ev_threads[t].name;
      auto it = join_map.find( n );
      if( it != join_map.end() )
        return join_map.at(n).first; //todo : rewrite to end double search
      else
        return nullptr;
    }

    bool is_seq_before( me_ptr x, me_ptr y ) const;
    void update_seq_orderings();

};

#endif // LLVM_BMC_EVENTSDATA_H
