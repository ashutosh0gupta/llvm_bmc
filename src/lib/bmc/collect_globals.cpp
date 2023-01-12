#include "lib/bmc/collect_globals.h"
//#include "lib/utils/utils.h"
#include "lib/utils/llvm_utils.h"
//#include "include/value_expr_map.h"

//collect_globals::collect_globals( std::unique_ptr<llvm::Module>& m_,
//                                  solver_context& solver_ctx__,
//                                  memory_cons& mem_enc_,
//                                  options& o, bmc& b)
//  : module(m_), solver_ctx(solver_ctx__), mem_enc(mem_enc_),
//    o(o), b(b) {
//  collect_globals_internal(module, b);
//  insert_concurrent(b);
//  CreateRdWrEvents(module, b);
//}

collect_globals::collect_globals( std::unique_ptr<llvm::Module>& m_,
                                  bmc& b, memory_cons& mem_enc_,
                                  solver_context& solver_ctx__, options& o )
  : module(m_), b(b), mem_enc(mem_enc_), solver_ctx(solver_ctx__), o(o) {
  collect_globals_internal(module, b);
  insert_events(b, mem_enc, solver_ctx, o);
  //CreateRdWrEvents(module, b);
}

collect_globals::~collect_globals() {}


void collect_globals::
collect_globals_internal( std::unique_ptr<llvm::Module>& m, bmc &b ) {
  std::set<const llvm::Value*> written;
  for (unsigned j = 0; j < b.sys_spec.threads.size(); j++) {
    auto EntryFn = b.sys_spec.threads.at(j).entry_function;
    for (auto mit = m->begin(); mit != m->end(); mit++) {
      auto Str1 = mit->getName().str();
      auto dstr = demangle( Str1);
      if ( Str1 != EntryFn && dstr != EntryFn ) continue;
      auto f = &(*mit);
      auto& list_gvars = fn_gvars_map[f->getName().str()];
      for (auto bbit = f->begin(); bbit != f->end(); bbit++) {
        auto bb = &(*bbit);
        for( auto it = bb->begin(); it != bb->end(); ++it) {
          auto I = &(*it);
          llvm::Value* addr = NULL;
          //I->print( llvm::outs() );     std::cout << "\n";
          if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
            addr = store->getOperand(1);
            auto glb = identify_global_in_addr( addr );
            if( glb && !exists( list_gvars, glb ) )
              list_gvars.push_back(glb);
            if(glb) written.insert( glb );
          }else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
            addr = load->getOperand(0);
            auto glb = identify_global_in_addr( addr );
            if( glb && !exists( list_gvars, glb ) ) {
              list_gvars.push_back(glb);
            }
          }else if( auto rmw = llvm::dyn_cast<llvm::AtomicRMWInst>(I) ) {
            addr = rmw->getPointerOperand();
            auto glb = identify_global_in_addr( addr );
            if( glb && !exists( list_gvars, glb ) )
              list_gvars.push_back(glb);
            if(glb) written.insert( glb );
          }else {continue;}
        }
      }
    }
  }
  for (auto fpair1 : fn_gvars_map) {
    auto& glist1 = fpair1.second;
    for (auto fpair2 : fn_gvars_map) {
      if( fpair1.first == fpair2.first ) continue;
      for( auto g : glist1 ) {
        // if( !exists( fpair2.second, g ) ) continue;
        //if( !exists( written, g) ) continue;
        if( auto g1 = llvm::dyn_cast<llvm::GlobalVariable>(g) ) {
          if( !exists(b.concurrent_vars, g1) ) {
            b.concurrent_vars.push_back(g1);
          }
        }
      }
    }
  }
}



void collect_globals::insert_events( bmc& b, memory_cons& mem_enc,
                                  solver_context& solver_ctx, options& o )
{
  me_set prev_events;
  src_loc sloc,floc;  //"the_launcher",   "the_finisher";
  std::vector<expr> history;
  expr tru = solver_ctx.bool_val(true);
  auto start = mk_me_ptr( mem_enc, INT_MAX, prev_events, tru, history, sloc,
                          event_t::pre, o_tag_t::sc);
  auto final = mk_me_ptr( mem_enc, INT_MAX, prev_events, tru, history, floc,
                          event_t::post, o_tag_t::sc);

  b.edata.init_loc = start;
  b.edata.post_loc = final;

  for (unsigned k = 0; k < b.sys_spec.threads.size(); k++) {
    auto FnName1 = b.sys_spec.threads.at(k).entry_function;
    if( fn_gvars_map.find(FnName1) != fn_gvars_map.end() ) {
      list_gvars = fn_gvars_map[FnName1];
      for (auto i = fn_gvars_map.begin(); i != fn_gvars_map.end(); i++) {
        if (i->first !=  FnName1) {
          // for(unsigned j=0; j < list_gvars.size(); j++)
          //   {
          //     auto g1 = list_gvars.at(j);
          for( auto g : list_gvars ) {
            if( !exists( i->second, g) ) continue;
            if( auto g1 = llvm::dyn_cast<llvm::GlobalVariable>(g) ) {
            // if (find(i->second.begin(), i->second.end(), g1) != i->second.end()) {
            const std::string gvar = (std::string)(g1->getName());
            llvm::Type* ty = g1->getType();
            if( auto pty = llvm::dyn_cast<llvm::PointerType>(ty) ) {
              auto el_ty = pty->getPointerElementType();
              sort z_sort = llvm_to_sort( o, el_ty);
              b.edata.add_global( gvar, z_sort );
              b.edata.wr_events[ b.edata.get_global( gvar ) ].insert( start );

              for( auto glb_idx_pair : b.m_model.ind_in_mem_state ) {
                auto g = glb_idx_pair.first;
                auto idx = glb_idx_pair.second;
                const std::string var_name = (std::string)(g->getName());
                if (gvar == var_name) {
                  variable tmp_v = b.edata.get_global( gvar )+"@pre" ;
                  b.m_model.store_state_map[0].mem_state_vec[idx].e = (expr) (tmp_v);
                  //std::cout << "Name is " << to_string(tmp_v) << "\n";
                }
              }
            }
            // if (b.concurrent_vars.empty()) {
            //   b.concurrent_vars.push_back(g1);
            // }else{
            //   if (find(b.concurrent_vars.begin(), b.concurrent_vars.end(), g1) == b.concurrent_vars.end()) {
            //     b.concurrent_vars.push_back(g1);
            //   }
            // }
            }
          }
        }
      }
    }
  }
  /*for(unsigned i=0; i < b.concurrent_vars.size(); i++)
    std::cout << "Concurrent variable number " << i << " is " << (std::string)((b.concurrent_vars.at(i))->getName()) << "\n"; */

}


//void collect_globals::CreateRdWrEvents(std::unique_ptr<llvm::Module>& m, bmc& b) {
//for (auto mit = m->begin(); mit != m->end(); mit++) { //Iterate over functions in module
//  std::string name = mit->getName().str();
//  auto f = &(*mit);
//  //std::cout << "Fn is " << name << "\n";

//  for (unsigned i = 0; i < b.sys_spec.threads.size(); i++) {
//  	if (name == b.sys_spec.threads.at(i).entry_function) {
//      		thread_num = b.sys_spec.threads.at(i).thread_num;
//		//std::cout << "Fn is " << name << " Thread num " << thread_num << "\n";
//	    }
//  }


//  unsigned thr_id = thread_num; //To be corrected later

//  me_set prev_events;
//  expr start_bit = get_fresh_bool(solver_ctx,"start");
//  std::vector< expr > history = { start_bit };
//  // src_loc loc( name );
//  src_loc loc;

//  auto start = mk_me_ptr( mem_enc, thr_id, prev_events, start_bit, history,
//                          loc, event_t::barr );
//  set_start_event( thr_id, start, start_bit );

//  prev_events.insert( start );

//  expr path_cond = solver_ctx.bool_val(true);

//  for (auto bbit = f->begin(); bbit != f->end(); bbit++) {
//    //Iterate over basic blocks in function
//    auto bb = &(*bbit);
//    for( auto it = bb->begin(); it != bb->end(); ++it) {
//      auto I = &(*it);
////I->print( llvm::outs() );     std::cout << "\n";

//      if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
//        llvm::Value* addr = store->getOperand(1);
////std::cout << "Store var is " << (std::string)((addr)->getName()) << "\n";
//        auto loc = getInstructionLocation( I );
//        //expr val = read_const( o, store->getOperand(0) );
//        me_set new_events;
//        if (auto g = llvm::dyn_cast<llvm::GlobalVariable>( addr ) ) {
//          if (find(b.concurrent_vars.begin(), b.concurrent_vars.end(), g) != b.concurrent_vars.end()) {
//            auto wr = mk_me_ptr( mem_enc, thr_id, prev_events, path_cond,  //thread_id to be passed correctly
//                                 history, g, loc, event_t::w,
//                                 translate_ordering_tags( store->getOrdering()) );

//            new_events.insert( wr );
////I->print( llvm::outs() );     std::cout << "\n";
//            /*const auto& data_dep_set = get_depends( store->getOperand(0) );
//              wr->set_data_dependency( data_dep_set );
//              wr->set_ctrl_dependency( get_ctrl(b) );
//              if(p->is_mm_power())
//              wr->set_ctrl_isync_dep(get_ctrl_isync(b));
//              block_ssa = block_ssa && ( wr->wr_v() == val ); */
//          }
//        }
//        add_event( thr_id, new_events );
//        /* p->set_c11_rs_heads( new_events, local_release_heads[b] );
//           prev_events = new_events;
//           assert( !recognized );recognized = true; */
//      }

//      else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
//        llvm::Value* addr = load->getOperand(0);
////std::cout << "Load var is " << (std::string)((addr)->getName()) << "\n";
//        auto loc = getInstructionLocation( I );
//        //expr val = read_const( o, load->getOperand(1) );
//        me_set new_events;
//        if( auto g = llvm::dyn_cast<llvm::GlobalVariable>( addr ) ) {
//          if (find(b.concurrent_vars.begin(), b.concurrent_vars.end(), g) != b.concurrent_vars.end()) {
//            auto rd = mk_me_ptr( mem_enc, thr_id, prev_events, path_cond,  //thread_id to be passed correctly
//                                 history, g, loc, event_t::r,
//                                 translate_ordering_tags( load->getOrdering()) );
//new_events.insert( rd );
////I->print( llvm::outs() );     std::cout << "\n";
//            /* local_map[I].insert( hb_enc::depends( rd, z3.mk_true() ) );
//               rd->set_ctrl_dependency( get_ctrl(b) );
//               if(p->is_mm_power())
//               rd->set_ctrl_isync_dep( get_ctrl_isync(b) );
//               new_events.insert( rd );
//               block_ssa = block_ssa && ( rd->rd_v() == l_v);
//               } */
//            add_event( thr_id, new_events);
//            /* p->set_c11_rs_heads( new_events, local_release_heads[b] );
//               prev_events = new_events;
//               assert( !recognized );recognized = true;
//               } */
//          }
//        }
//      }
//    }
//   }
//  }
//}


//unsigned collect_globals::add_thread( std::string str) {
//  //auto thr = std::make_shared<thread>( _z3, str );
//  //b.sys_spec.threads.push_back( str );
//  thread_num++;
//  return thread_num-1;
//}


//o_tag_t
//collect_globals::translate_ordering_tags( llvm::AtomicOrdering ord ) {
//  switch( ord ) {
//  case llvm::AtomicOrdering::NotAtomic: return o_tag_t::na; break;
//  case llvm::AtomicOrdering::Unordered: return o_tag_t::uo; break;
//  case llvm::AtomicOrdering::Monotonic: return o_tag_t::mon; break;
//  case llvm::AtomicOrdering::Acquire: return o_tag_t::acq; break;
//  case llvm::AtomicOrdering::Release: return o_tag_t::rls; break;
//  case llvm::AtomicOrdering::AcquireRelease: return o_tag_t::acqrls; break;
//  case llvm::AtomicOrdering::SequentiallyConsistent: return o_tag_t::sc; break;
//  default:
//    llvm_bmc_error("bmc", "Unsupported nondet type!");
//  }
//  return o_tag_t::na; // dummy return;
//}


//src_loc collect_globals::getInstructionLocation(const llvm::Instruction* I ) {
//  const llvm::DebugLoc d = I->getDebugLoc();
//  src_loc l;
//  if( d ) {
//    l.line = d.getLine();
//    l.col  = d.getCol();
//    l.file = llvm::cast<llvm::DIScope>(d.getScope())->getFilename();
//  }
//  return l;
//}


//void collect_globals::add_event( unsigned i, me_ptr e )   {
//  if( i < b.sys_spec.threads.size() ) {
//    add_event( e );
//    /*if( e->is_rd() ) rd_events[e->prog_v].push_back( e );
//      if( e->is_wr() ) wr_events[e->prog_v].insert( e );
//      if( e->is_sc() ) all_sc.insert( e ); */ //To be added later
//  }
//  // todo what to do with pre/post events
//  //    se_store[e->name()] = e;
//}


//llvm::StringRef collect_globals::getPassName() const {
//  return "Collect global variables read and written by a function";
//}

//void collect_globals::getAnalysisUsage(llvm::AnalysisUsage &au) const {
//  au.setPreservesAll();
//  au.addRequired<llvm::LoopInfoWrapperPass>();
//}
