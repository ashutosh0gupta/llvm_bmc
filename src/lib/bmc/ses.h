#ifndef LLVMBMC_SES_H
#define LLVMBMC_SES_H

#include "include/options.h"
#include "include/bmc.h"
#include "lib/utils/solver_utils.h"
#include "include/memory_cons.h"
#include <boost/concept_check.hpp>

  // class for constructing constraints on events
  // depending on the memory model
  class event_cons {
  public:
    event_cons( options& , solver_context& , memory_cons&, bmc& );
    void run();

    //static bool check_ppo( const me_ptr&, const me_ptr& );

    options& o;
    solver_context& solver_ctx;
    memory_cons& mem_enc;
    bmc& b_obj;

  private:
    
    void distinct_events();

    bool is_po( me_ptr x, me_ptr y );

    static bool is_non_mem_ordered(const me_ptr&,const me_ptr&);
    //expr is_ordered_dependency(const me_ptr&,const me_ptr&);
    static bool is_ordered_sc     (const me_ptr&,const me_ptr&);

    //void ppo_traverse ( const tara::thread& );

    void ppo_sc ( const spec_thread& thread );
    bool check_ppo( const me_ptr&, const me_ptr& );
    void ppo();

    // void wmm_test_ppo(); // TODO: remove when confident

    //void unsupported_mm() const;

    bool is_no_thin_mm() const;

    bool anti_po_read( const me_ptr& wr, const me_ptr& rd );
    bool anti_po_loc_fr( const me_ptr& rd,
                         const me_ptr& wr );

    bool in_grf        ( const me_ptr& wr, const me_ptr& rd );
    bool is_rd_rd_coherence_preserved();
    bool is_wr_wr_coherence_needed();
    bool is_rd_wr_coherence_needed();

    // z3::expr wmm_mk_ghb_thin(const hb_enc::se_ptr& bf,const hb_enc::se_ptr& af);
    // z3::expr wmm_mk_ghb     (const hb_enc::se_ptr& bf,const hb_enc::se_ptr& af);

    expr get_rf_bvar( const variable& v1,
                          me_ptr wr, me_ptr rd,
                          bool record=true );

    //expr get_rel_seq_bvar( hb_enc::se_ptr wrp, hb_enc::se_ptr wr,
                               //bool record=true );

    void ses();

    // -----------------------------------------------------------------------
    // rmo functions
    //static bool is_ordered_rmo    (const hb_enc::se_ptr&,const hb_enc::se_ptr&);
    //void ppo_rmo_traverse ( const tara::thread& );

    // -----------------------------------------------------------------------
    // c11 functions
    //static bool is_ordered_c11(const hb_enc::se_ptr&,const hb_enc::se_ptr&);
    //void ppo_c11( const tara::thread& );
    //void ses_c11();
    //void distinct_events_c11();

    //------------------------------------------------------------------------

    expr dist = solver_ctx.bool_val(true);
    expr po   = solver_ctx.bool_val(true);
    expr wf   = solver_ctx.bool_val(true);
    expr rf   = solver_ctx.bool_val(true);
    expr grf  = solver_ctx.bool_val(true);
    expr lrf  = solver_ctx.bool_val(true);
    expr fr   = solver_ctx.bool_val(true);
    expr ws   = solver_ctx.bool_val(true);
    expr thin = solver_ctx.bool_val(true);

    //c11 support
    //z3::expr rel_seq = z3.mk_true();

    //bool is_ordered( hb_enc::se_ptr x, hb_enc::se_ptr y );
    void update_orderings();
    void update_must_before( const me_vec& es, me_ptr e );
    void update_must_after ( const me_vec& es, me_ptr e );
    void update_may_after  ( const me_vec& es, me_ptr e );
    void update_ppo_before ( const me_vec& es, me_ptr e );
    void pointwise_and ( const depends_set&, expr cond,
                         depends_set& );

    };

#endif // LLVMBMC_SES_H
