#include "ses.h"
#include "include/memory_event.h"


ses::ses( options& o, solver_context& solver_ctx__,
                        memory_cons& mem_enc_, bmc& b)
  : o(o), solver_ctx(solver_ctx__),
    mem_enc(mem_enc_), b_obj(b) {
}


//bool ses::is_po( me_ptr x, me_ptr y ) {
//  if( x == y )
//    return true;
//  if( x->is_pre() || y->is_post() ) return true;
//  if( x->is_post() || y->is_pre() ) return false;
//  if( x->tid != y->tid ) return false;
//  if( x->get_topological_order() >= y->get_topological_order() ) return false;

//  // return is_po_new( x, y);
//  return p.is_seq_before( x, y );
//}

//----------------------------------------------------------------------------
// memory model utilities


bool ses::in_grf( const me_ptr& wr,
                             const me_ptr& rd ) {
  return true;
  // if( p.is_mm_sc() ) {
  //   return true;
  // }else if( p.is_mm_tso() || p.is_mm_pso() || p.is_mm_power() ||
  //           p.is_mm_rmo() || p.is_mm_alpha() || p.is_mm_arm8_2()) {
  //   return wr->tid != rd->tid; //only events with diff threads are part of grf
  // }else{
  //   p.unsupported_mm();
  //   return false;
  // }
}

bool ses::is_no_thin_mm() const {
  return false;
  // if( p.is_mm_sc() || p.is_mm_arm8_2() || p.is_mm_power() ) {
  //   return false;
  // }else if(    p.is_mm_tso() // todo: tso/pso do not need thin air
  //           || p.is_mm_pso()
  //           || p.is_mm_rmo()
  //           || p.is_mm_alpha() ) {
  //   return true;
  // }else{
  //   p.unsupported_mm();
  //   return false; // dummy return
  // }
}

//----------------------------------------------------------------------------
// coherence preserving code
// po-loc must be compatible with
// n  - nothing to do
// r  - relaxed
// ne - not enforced
// po-loc needed to look at reversed
// (pp-loc)/(ses)
//          rel-type  po-ord sc   tso   pso   rmo  alpha  arm8.2
//  - ws      (w->w)   w->w  n    n     n     n     n      n
//  - fr      (r->w)   w->r  n    r     r     r     r      r
//  - fr;rf   (r->r)   r->r  n    n     n     r(ne) n      r
//  - rf      (w->r)   r->w  n    n     n     n     n      r
//  - ws;rf   (w->r)   r->w  n    n     n     n     n      r


bool ses::is_rd_rd_coherence_preserved() {
  return true;
  // if( p.is_mm_sc() ) {
  //   return true;
  // }else if( p.is_mm_rmo() || p.is_mm_power() ){
  //   return false;
  // }else{
  //   p.unsupported_mm();
  //   return false; // dummy return
  // }
}

//----------------------------------------------------------------------------
// Build symbolic event structure
// In original implementation this part of constraints are
// referred as pi constraints

expr ses::get_rf_bvar( const variable& v1,
                                      me_ptr wr, me_ptr rd,
                                      bool record ) {
  expr b = mem_enc.get_rf_bit( v1, wr, rd );
  std::string bname = "dummy"; //z3::get_top_func_name(b); ///Find equivalent function
  // std::string bname = v1+"-"+wr->name()+"-"+rd->name();
  // z3::expr b = z3.c.bool_const(  bname.c_str() );
  if( record ) {
    b_obj.edata.reading_map.insert( std::make_tuple(bname, wr, rd) );
    //if( p.is_mm_c11() ) // keep a copy in encoding object//todo: remove copy
      mem_enc.rf_map.insert( std::make_tuple(bname, wr, rd) );
  }
  return b;
}



//----------------------------------------------------------------------------
bool ses::anti_po_read( const me_ptr& wr,
                                   const me_ptr& rd ) {
  // preventing coherence violation - rf
  // (if rf is local then may not visible to global ordering)
  assert( wr->tid >= b_obj.edata.ev_threads.size() || rd->tid >= b_obj.edata.ev_threads.size() ||
          wr->prog_v-> getName() == rd->prog_v-> getName() );
  //if( p.is_mm_sc() ) {
    // should come here for those memory models where rd-wr on
    // same variables are in ppo
    if( is_po_new( rd, wr ) ) {
      return true;
    }
    //
  //}else{
    //p.unsupported_mm();
  //}
  return false;
}


bool ses::anti_po_loc_fr( const me_ptr& rd,
                                     const me_ptr& wr ) {
  // preventing coherence violation - fr;
  // (if rf is local then it may not be visible to the global ordering)
  // coherance disallows rf(rd,wr') and ws(wr',wr) and po-loc( wr, rd)
  assert( wr->tid >= b_obj.edata.ev_threads.size() || rd->tid >= b_obj.edata.ev_threads.size() ||
          wr->prog_v-> getName() == rd->prog_v-> getName() );
  //if( p.is_mm_sc() ) {
    if( wr->is_update() && rd == wr ) return false;
    if( is_po_new( wr, rd ) ) {
      return true;
    }
    //
  //}else{
    //p.unsupported_mm();
  //}
  return false;
}

bool ses::is_wr_wr_coherence_needed() {
  // if( p.is_mm_sc()
  //     || p.is_mm_tso()
  //     || p.is_mm_pso()
  //     || p.is_mm_rmo()
  //     || p.is_mm_alpha()
  //     || p.is_mm_arm8_2() ) {
  //   return false;
  // }else{
  //   p.unsupported_mm();
  // }
  return false;//dummy return
}


bool ses::is_rd_wr_coherence_needed() {
  return false;//dummy return
}


void ses::ses_() {
  // For each global variable we need to construct
  // - wf  well formed
  // - rf  read from
  // - grf global read from
  // - fr  from read
  // - ws  write serialization

  // we assume wr-wr coherence (po o ws) is not needed
  // assert( p.is_mm_power() || !is_wr_wr_coherence_needed());// check against new mm

  //todo: disable the following code if rd rd coherence not preserved
  //todo: remove the following. seq_before also calculates the following info
  me_to_ses_map prev_rds;
  for( unsigned t = 0; t < b_obj.edata.ev_threads.size(); t++ ) {
     const auto& thr = b_obj.edata.get_thread( t );
  // for( const auto& thr : p.threads ) {
    for( auto e : thr.events ) {
      me_set& rds = prev_rds[e];
      for( auto ep : e->prev_events ) {
        rds.insert( prev_rds[ep].begin(), prev_rds[ep].end() );
        if( ep->is_rd() ) rds.insert( ep );
      }
    }
  }

  for( const auto& v1 : b_obj.edata.globals ) {
    const me_vec& rds = b_obj.edata.rd_events[v1];
    const me_set& wrs = b_obj.edata.wr_events[v1];
    for( const me_ptr& rd : rds ) {
      std::cout << "I am here" << rd << "\n";
      expr some_rfs = solver_ctx.bool_val(false);
      expr rd_v = rd->get_rd_expr(v1);
      for( const me_ptr& wr : wrs ) {
        // avoiding cycles po o rf
        if( anti_po_read( wr, rd ) ) continue;
        expr wr_v = wr->get_wr_expr( v1 );
        expr b = get_rf_bvar( v1, wr, rd );
        some_rfs = some_rfs || b;
        expr eq = ( rd_v == wr_v );
        // well formed
        wf = wf && implies( b, wr->guard && eq);
        // read from
        expr new_rf = implies( b, mem_enc.mk_ghbs( wr, rd ) );
        rf = rf && new_rf;
        //global read from
        if( in_grf( wr, rd ) ) grf = grf && new_rf;
        // if( p.is_mm_arm8_2() ) grf = grf && rfi_ord_arm8_2( b, wr, rd );
        // from read
        for( const me_ptr& after_wr : wrs ) {
          if( after_wr->name() != wr->name() ) {
            auto cond = b && mem_enc.mk_ghbs(wr,after_wr)
                          && after_wr->guard;
            if( anti_po_loc_fr( rd, after_wr ) ) {
              //write-read coherence: avoiding cycles po o fr
              fr = fr && !cond;
            }else if( is_po_new( rd, after_wr ) ) {
              //write-read coherence: avoiding cycles po o (ws;rf)
              if( is_rd_wr_coherence_needed() )
                fr = fr && implies( b, mem_enc.mk_ghbs(wr,after_wr) );
            }else{
              auto new_fr = mem_enc.mk_ghbs( rd, after_wr );
              // if( is_rd_rd_coherence_preserved() ) {
                // read-read coherence, avoding cycles po U (fr o rf)
                for( auto before_rd : prev_rds[rd] ) {
                  if( rd->access_same_var( before_rd ) ) {
                    expr anti_coherent_b =
                      get_rf_bvar( v1, after_wr, before_rd, false );
                    new_fr = !anti_coherent_b && new_fr;
                  }
                }
              // }
              // if( auto& rmw_w = rd->rmw_other ) {
              //   // rmw & (fr o mo) empty
              //   new_fr = new_fr && hb_encoding.mk_ghbs( rmw_w, after_wr );
              // }
              fr = fr && implies( cond , new_fr );
            }
          }
        }
      }
      wf = wf && implies( rd->guard, some_rfs );
    }

    auto it1 = wrs.begin();
    for( ; it1 != wrs.end() ; it1++ ) {
      const me_ptr& wr1 = *it1;
      auto it2 = it1;
      it2++;
      for( ; it2 != wrs.end() ; it2++ ) {
        const me_ptr& wr2 = *it2;
        // write serialization
        // todo: what about ws;rf
        if( wr1->tid != wr2->tid && // Why this condition?
            !wr1->is_pre() && !wr2->is_pre() // no initializations
            ) {
          ws = ws && ( mem_enc.mk_ghbs( wr1, wr2 ) ||
                       mem_enc.mk_ghbs( wr2, wr1 ) );
        }
      }
    }

    // if( is_no_thin_mm() ) {
    //   // dependency
    //   for( const hb_enc::se_ptr& wr : wrs ) {
    //     for( auto& dep : wr->data_dependency )
    //       thin = thin && z3::implies(dep.cond,hb_encoding.mk_hb_thin(dep.e,wr));
    //     // for( auto& dep : wr->ctrl_dependency )
    //     //   thin = thin && z3::implies(dep.cond, hb_encoding.mk_hb_thin( dep.e, wr ));
    //   }
    //   // for( const hb_enc::se_ptr& rd : rds ) {
    //   //   for( auto& dep : rd->ctrl_dependency )
    //   //     thin = thin && z3::implies(dep.cond, hb_encoding.mk_hb_thin( dep.e, rd ));
    // // }
    // }
  }
}






//----------------------------------------------------------------------------
// declare all events happen at different time points

void ses::distinct_events() {

  expr_vector es( solver_ctx );

  es.push_back( b_obj.edata.init_loc->get_solver_symbol() );

  if( b_obj.edata.post_loc )
    es.push_back( b_obj.edata.post_loc->get_solver_symbol() );

  for( unsigned t=0; t < b_obj.edata.ev_threads.size(); t++ ) {
    auto& thread = b_obj.edata.get_thread(t);
    for(auto& e : thread.events )
      es.push_back( e->get_solver_symbol() );
    es.push_back( thread.start_event->get_solver_symbol() );
    es.push_back( thread.final_event->get_solver_symbol() );
  }
  dist = distinct(es);

}


//----------------------------------------------------------------------------
// build preserved programming order(ppo)
// todo: deal with double barriers that may cause bugs since they are not 
//       explicitly ordered



void ses::ppo_sc( const thread_events& thread ) {

  for( auto& e : thread.events ) {
    po = po && mem_enc.mk_ghbs( e->prev_events, e );
  }
  auto& e = thread.final_event;
  po = po && mem_enc.mk_ghbs( e->prev_events, e );
}

bool ses::is_non_mem_ordered( const me_ptr& e1,
                                         const me_ptr& e2  ) {
  if( e1->is_block_head() || e2->is_block_head()  ) return false;
  if( e2->is_barrier() ||e2->is_before_barrier() ||e2->is_thread_create())
    return true;
  if( e1->is_barrier() || e1->is_after_barrier() || e1->is_thread_join() )
    return true;
  if( e2->is_thread_join() || e2->is_after_barrier() ||
      e1->is_thread_create() || e1->is_before_barrier()  ) return false;
  assert(false);
  return false;
}

bool ses::is_ordered_sc( const me_ptr& e1,
                                    const me_ptr& e2  ) {
  assert( e1->is_mem_op() && e2->is_mem_op() );

  return true;
}





bool ses::check_ppo( //mm_t mm,
                                const me_ptr& e1,
                                const me_ptr& e2 ) {
  if( e1->is_non_mem_op() || e2->is_non_mem_op() ) {
    return is_non_mem_ordered( e1, e2 );
  }
  // if( e1->is_barr_type() || e2->is_barr_type() ) {
  //   return is_barrier_ordered( e1, e2 );
  // }
  //switch( mm ) {
  //case mm_t::sc     : 
    return is_ordered_sc   ( e1, e2 ); //break;
  //default:
    //std::string msg = "unsupported memory model: " + string_of_mm( mm ) + "!!";
    //llvm_bmc_error( "bmc", msg );
  //}
  return false; // dummy return
}

/* bool ses::check_ppo( const me_ptr& e1,
                                const me_ptr& e2 ) {
  //return check_ppo( p.get_mm(), e1, e2 );
  return false; // dummy return
} */

// void ses::ppo_traverse( const tara::thread& thread ) {
//   hb_enc::se_to_ses_map pending_map, ordered_map;
//   auto& se = thread.start_event;
//   pending_map[se].insert(se); // this is how it should start

//   for( auto& e : thread.events ) {
//     pending_map[e].insert(e);
//     hb_enc::se_set tmp_pendings;
//     for( auto& ep : e->prev_events )
//       helpers::set_insert( tmp_pendings, pending_map[ep] );
//     hb_enc::se_set& pending = pending_map[e];
//     hb_enc::se_set& ordered = ordered_map[e];
//     hb_enc::se_set seen_set;
//     while( !tmp_pendings.empty() ) {
//       auto ep = *tmp_pendings.begin();
//       tmp_pendings.erase( ep );
//       if( helpers::exists( seen_set, ep ) ) continue;
//       seen_set.insert( ep );
//       if( check_ppo( ep, e ) ) {
//         po = po && hb_encoding.mk_ghbs( ep, e );
//         ordered.insert( ep );
//       }else{
//         pending.insert( ep );
//         helpers::set_insert( tmp_pendings, ordered_map[ep] );
//       }
//     }
//   }

//   auto& fe = thread.final_event;
//   for( auto& e : fe->prev_events ) {
//     for( auto& ep : pending_map[e] ) {
//       po = po && hb_encoding.mk_ghbs( ep, fe );
//     }
//   }
// }

void ses::ppo() {
  // wmm_test_ppo();

  for( unsigned t=0; t < b_obj.edata.ev_threads.size(); t++ ) {
    auto& thr = b_obj.edata.get_thread(t);

    // May be not needed
    auto& cr_e = b_obj.edata.create_map[thr.name];
    expr cr_ord = mem_enc.mk_hbs( cr_e ,thr.start_event );
    po = po && z3::implies( cr_e->guard, thr.start_event->guard && cr_ord );

    ppo_sc ( thr );

    const auto& it = b_obj.edata.join_map.find( thr.name );
    if( it != b_obj.edata.join_map.end() ) {
      const auto& jp_pair = it->second;
      const auto join_point = jp_pair.first;
      expr join_guard = jp_pair.second;
      expr join_order = mem_enc.mk_hbs( thr.final_event, join_point);
      po = po && z3::implies( thr.final_event->guard, join_guard && join_order);
    }
  }
  po = po.simplify();
}


// collecting stats about the events
void ses::update_orderings() {
  for( unsigned i = 0; i < b_obj.edata.ev_threads.size(); i ++ ) {
    for( auto& e : b_obj.edata.get_thread(i).events ) {
      update_must_before( b_obj.edata.get_thread(i).events, e );
    }
  }
   
  /// To be added?
  //b_obj.edata.update_seq_orderings();

  for( unsigned i = 0; i < b_obj.edata.ev_threads.size(); i ++ ) {
    auto rit = b_obj.edata.get_thread(i).events.rbegin();
    auto rend = b_obj.edata.get_thread(i).events.rend();
    for (; rit!= rend; ++rit)
      update_must_after( b_obj.edata.get_thread(i).events, *rit );
  }
  /* if( !p.is_mm_c11() && !p.is_mm_power()) {
    //todo: check if this condition is correct
    // assert(false);
    for( unsigned i = 0; i < p.size(); i ++ ) {
      for( auto& e : p.get_thread(i).events ) {
        update_ppo_before( p.get_thread(i).events, e );
      }
    }
  } */

  if(0) { // todo : may after disabled for now
    for( unsigned i = 0; i < b_obj.edata.ev_threads.size(); i ++ ) {
      auto rit = b_obj.edata.get_thread(i).events.rbegin();
      auto rend = b_obj.edata.get_thread(i).events.rend();
      for (; rit!= rend; ++rit)
        update_may_after( b_obj.edata.get_thread(i).events, *rit );
    }
  }

  if( o.verbosity > 2 ) {
    std::cout << "============================\n";
    std::cout << "must after/before relations:\n";
    std::cout << "============================\n";
    for( unsigned i = 0; i < b_obj.edata.ev_threads.size(); i ++ ) {
      me_vec es = b_obj.edata.get_thread(i).events;
      es.push_back( b_obj.edata.get_thread(i).start_event );
      es.push_back( b_obj.edata.get_thread(i).final_event );
      for( auto& e : es ) {
        std::cout << e->name() << "\nbefore: ";
        debug_print( std::cout, b_obj.edata.must_before[e] );
        std::cout << "after: ";
        debug_print( std::cout, b_obj.edata.must_after [e] );
        std::cout << "may after: ";
        debug_print( std::cout, b_obj.edata.may_after [e] );
        std::cout << "ppo before: ";
        debug_print( std::cout, b_obj.edata.ppo_before [e] );
        std::cout << "c11 release sequence heads: ";
        debug_print( std::cout, b_obj.edata.c11_rs_heads [e] );
        std::cout << "seq dominated wr before: ";
        debug_print( std::cout, b_obj.edata.seq_dom_wr_before [e] );
        std::cout << "seq dominated wr after: ";
        debug_print( std::cout, b_obj.edata.seq_dom_wr_after [e] );
        std::cout << "seq before: ";
        debug_print( std::cout, b_obj.edata.seq_before[e] );
        std::cout << "\n";
      }
    }
  }
}

void ses::update_must_before( const me_vec& es,
                                         me_ptr e ) {
  // hb_enc::se_tord_set to_be_visited = { e };
  me_to_ses_map local_ordered;
  for( auto& ep : es ) {
    if( ep->get_topological_order() > e->get_topological_order() )
      continue;
    std::vector<me_set> ord_sets( ep->prev_events.size() );
    unsigned i = 0;
    for( auto& epp : ep->prev_events ) {
      ord_sets[i] = local_ordered[epp];
      if( check_ppo( epp, e ) ) {
        ord_sets[i].insert( epp );
        set_insert( ord_sets[i], b_obj.edata.must_before[epp] );
      }
      i++;
    }
    set_intersection( ord_sets, local_ordered[ep] );
    if( e == ep ) break;
  }
  b_obj.edata.must_before[e] = local_ordered[e];
}


void ses::update_must_after( const me_vec& es,
                                        me_ptr e ) {
  me_to_ses_map local_ordered;
  auto rit = es.rbegin();
  auto rend = es.rend();
  for (; rit!= rend; ++rit) {
    auto& ep = *rit;
    if( ep->get_topological_order() < e->get_topological_order() )
      continue;
    std::vector<me_set> ord_sets( ep->post_events.size() );
    unsigned i = 0;
    for( auto it = ep->post_events.begin(); it != ep->post_events.end(); it++) {
      const depends& dep = *it;
      me_ptr epp = dep.e;
      ord_sets[i] = local_ordered[epp];
      if( check_ppo( e, epp ) ) {
        ord_sets[i].insert( epp );
        set_insert( ord_sets[i], b_obj.edata.must_after[epp] );
      }
      i++;
    }
    set_intersection( ord_sets, local_ordered[ep] );
    if( e == ep ) break;
  }
  b_obj.edata.must_after[e] = local_ordered[e];
}

void ses::pointwise_and( const depends_set& dep_in,
                                    expr cond,
                                    depends_set& dep_out ) {
  for( const depends& d : dep_in ) {
    expr c = d.cond && cond;
    c = c.simplify();
    dep_out.insert( depends( d.e, c ));
  }
}

void ses::update_may_after( const me_vec& es,
                                       me_ptr e ) {
  me_to_depends_map local_ordered;
  auto rit = es.rbegin();
  auto rend = es.rend();
  for (; rit!= rend; ++rit) {
    auto ep = *rit;
    if( ep->get_topological_order() < e->get_topological_order() )
      continue;
    std::vector<depends_set> temp_vector;
    // unsigned i = 0;
    for( const depends& dep : ep->post_events ){
      const me_ptr epp = dep.e;
      depends_set temp;
      expr epp_cond = solver_ctx.bool_val(false);
      // std::cout << e->name() << " "<< ep->name() << " "<< epp->name();
      // std::cout << "\n";
      // tara::debug_print( std::cout, p.may_after[epp] );
      // tara::debug_print( std::cout, local_ordered[epp] );
      //todo: rmo support is to be added
      //      check_ppo does the half work for rmo
      if( check_ppo( e, epp ) ) {
        depends_set temp3;
        join_depends_set( b_obj.edata.may_after[epp], local_ordered[epp], temp3 );
        pointwise_and( temp3, dep.cond, temp );
        epp_cond = dep.cond;
      } else {
     	pointwise_and( local_ordered[epp], dep.cond, temp );
      }
      temp.insert( depends( epp, epp_cond ) );
      temp_vector.push_back( temp );
      // i++;
    }
    join_depends_set( temp_vector, local_ordered[ep] );
    if( e == ep ) break;
  }
  b_obj.edata.may_after[e] = local_ordered[e];
}

void ses::update_ppo_before( const me_vec& es,
                                       me_ptr e ) {
  me_to_depends_map local_ordered;
  for( auto& ep : es ) {
    if( ep->get_topological_order() > e->get_topological_order() ) continue;
    std::vector<depends_set> ord_sets( ep->prev_events.size() );
    unsigned i = 0;
    for( auto& epp : ep->prev_events ) {
      ord_sets[i] = local_ordered[epp];
      if( check_ppo( epp, e ) ) {
        if( epp->is_mem_op() )
                join_depends_set(  epp, solver_ctx.bool_val(true), ord_sets[i] );
        join_depends_set(   b_obj.edata.ppo_before[epp], ord_sets[i] );
      }else{
        if( epp->is_mem_op() )
          join_depends_set( epp, solver_ctx.bool_val(true), ord_sets[i] );
      }
      i++;
    }
    meet_depends_set( ord_sets, local_ordered[ep] );
    if( e == ep ) break;
  }
  b_obj.edata.ppo_before[e] = local_ordered[e];
}


//////////////////////////////////////////////////////////////need to be deleted
/* void ses::print_rel(std::map<event_pair,expr>& a,std::ostream& out)
{
	std::string s="";
	for(auto a1:a)
	{
		out<<"(implies "<<a1.second<<" (<"
			 <<a1.first.first->name()<<" "
			 <<a1.first.second->name()<<"))\n";
	}
} */
//////////////////////////////////////////////////////////////

void ses::run() {
  update_orderings();

  ppo(); // build hb formulas to encode the preserved program order
  distinct_events();
  ses_();

 if ( o.verbosity > 2 ) {
   std::cout << "(" << "\n"
           << "phi_po : \n" << (po && dist) << "\n"
           << "wf     : \n" << wf           << "\n"
           << "rf     : \n" << rf           << "\n"
           << "grf    : \n" << grf          << "\n"
           << "fr     : \n" << fr           << "\n"
           << "ws     : \n" << ws           << "\n"
           // << "co     : \n" << co_expr      << "\n"
           << "thin   : \n" << thin         << "\n"
           // << "phi_prp: \n" << b_obj.phi_prp    << "\n"
           << ")\n";
   // if(p.is_mm_power()) {
   // 	o.out()<<"ii0 :  ";
   // 	print_rel(ii0,o.out());
   // 	o.out()<<"ci0 :  ";
   // 	print_rel(ci0,o.out());
   // 	o.out()<<"cc0 :  ";
   // 	print_rel(cc0,o.out());
   // 	o.out()<< "ppo : \n" 	<< ppo_expr << endl
   //      					 << "     &&" 	<< fixpoint << endl
   //      					 << "fence :" 	<< fence 		<< endl
   //      					 << "hb : \n" 	<< "ppo && grf && fence" << endl
   //      					 << "obs : \n"  << obs_expr	<< endl
   //      					 << "prop : \n" << prop_expr<< endl;
   // }
 }

  b_obj.edata.phi_po  = po && dist;
  b_obj.edata.phi_ses = wf && grf && fr && ws; // && po_loc; ///Confirm not needed
  //if( !p.is_mm_arm8_2() ) {
    b_obj.edata.phi_ses = b_obj.edata.phi_ses && thin; //todo : undo this update
  //}
}


void accesses( const me_ptr& ep,
                 const me_set& ep_sets,
                 me_set& new_prevs ) {
    // if( ep->is_pre() || ep->is_mem_op() )
    if( !ep->is_block_head() )
      new_prevs.insert( ep );
    for( auto& epp : ep_sets )
      // if( ep->is_pre() || epp->is_mem_op() )
      if( !epp->is_block_head() )
        new_prevs.insert( epp );
  }


void dominate_wr_accesses( const me_ptr& ep,
                             const me_set& ep_sets,
                             me_set& new_prevs ) {
    if( ep->is_wr() )
      new_prevs.insert( ep );
    for( auto& epp : ep_sets )
      if( epp->is_wr() )
        if( !ep->is_wr() || !ep->access_same_var( epp ) )
          new_prevs.insert( epp );
  }


bool events_data::is_seq_before( me_ptr x, me_ptr y ) const {
  if( !seq_ordering_has_been_called )
    llvm_bmc_error( "bmc", "update_seq_orderning has not been called yet!!" );
  assert( !x->is_block_head() && !y->is_block_head() );
  auto& bfr = seq_before.at(y);
  return exists( bfr , x );
}


void events_data::update_seq_orderings() {
  if( seq_ordering_has_been_called )
    llvm_bmc_error( "bmc", "update_seq_orderning must not be called twice!!" );
  seq_ordering_has_been_called = true;

  seq_dom_wr_before.clear();
  seq_before.clear();
  seq_dom_wr_after.clear();

  // create solver
  std::vector< std::pair<me_ptr,me_ptr> > thread_syncs;

  all_es.push_back( init_loc );
  for( unsigned i = 0; i < ev_threads.size(); i++ ) {
    for( auto& e : get_thread(i).events ) {
      all_es.push_back(e);
//      for( auto& ep : e->prev_events ) {
//        ord_solver.add( mem_enc.mk_hbs(ep,e) );
//      }
    }
    auto& se = get_thread(i).start_event;
    auto& fe = get_thread(i).final_event;
    all_es.push_back(se);
    all_es.push_back(fe);//todo: check if the final event is in (i).events
    //for( auto& ep : get_thread(i).final_event->prev_events ) {
    //  ord_solver.add( mem_enc.mk_hbs(ep,fe) );
    //}
    auto& ce = get_create_event(i);
    if( ce ) {
      //ord_solver.add( mem_enc.mk_hbs(ce,se));
      thread_syncs.push_back({ce,se});
    }
    auto& je = get_join_event(i);
    if( je ) {
      //ord_solver.add( mem_enc.mk_hbs(fe,je));
      thread_syncs.push_back({fe,je});
    }
  }
  if( post_loc ) all_es.push_back( post_loc );

  //auto res = ord_solver.check();
  //assert( res == z3::check_result::sat);
  //auto m = ord_solver.get_model();

  std::map< me_ptr, int > order_map;
  //for( auto e : all_es ) {
    //auto v = m.eval( e->get_solver_symbol() );
    //unsigned  o_val = _z3.get_numeral_int( v );
    //order_map[e] = o_val;
    //e->set_topological_order( o_val );
  //}

//  std::sort( all_es.begin(), all_es.end(),
//             [&](const me_ptr& x, const me_ptr& y) {
//               return order_map.at(x) < order_map.at(y);
//               } );

  for( auto e : all_es ) {
    auto& prevs = seq_dom_wr_before[e];
    auto& rd_prevs = seq_before[e];
    prevs.clear();
    for( auto& ep : e->prev_events ) {
      dominate_wr_accesses( ep, seq_dom_wr_before.at(ep), prevs );
      accesses( ep, seq_before.at(ep), rd_prevs );
    }
    for( const auto& sync : thread_syncs ) {
      if( sync.second != e ) continue;
      me_ptr ep = sync.first;
      dominate_wr_accesses( ep, seq_dom_wr_before.at(ep), prevs );
      accesses( ep, seq_before.at(ep), rd_prevs );
    }
  }

  auto rit = all_es.rbegin(), rend = all_es.rend();
  for (; rit!= rend; ++rit) {
    me_ptr e = *rit;
    auto& prevs = seq_dom_wr_after[e];
    prevs.clear();
    for( auto& ep : e->post_events ) {
      dominate_wr_accesses( ep.e, seq_dom_wr_after.at(ep.e), prevs );
    }
    for( const auto& sync : thread_syncs ) {
      if( sync.first != e ) continue;
      me_ptr ep = sync.second;
      dominate_wr_accesses( ep, seq_dom_wr_after.at(ep), prevs );
    }
  }


}
