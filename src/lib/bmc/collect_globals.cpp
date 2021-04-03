#include "lib/utils/utils.h"
#include "lib/utils/llvm_utils.h"
#include "lib/bmc/memory_event.h"
#include "lib/bmc/memory_cons.h"
#include "include/value_expr_map.h"
#include "include/options.h"
#include "include/collect_globals.h"
#include "llvm/IR/DIBuilder.h"

char collect_globals_pass::ID = 0;

collect_globals_pass::collect_globals_pass(llvm::Module &m, solver_context& solver_ctx__, options& o)
  : llvm::ModulePass(ID), solver_ctx(solver_ctx__), mem_enc(mem_enc), o(o)
{
    fname1 = "_ada_mnguidancedriver";
    fname2 = "_ada_mjguidancedriver";
    //solver_ctx = o.solver_ctx;
}

collect_globals_pass::~collect_globals_pass() {}


bool collect_globals_pass::runOnModule(llvm::Module &m)
{
    for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module
	        bool modified = runOnFunction(*mit);
    }
    insert_concurrent(fname1, fname2);

    for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module
	        CreateRdWrEvents(*mit);
    }

    return true;
}


bool collect_globals_pass::runOnFunction( llvm::Function &f ) {
  
if ((f.getName().str() == fname1) ||(f.getName().str() == fname2)) {

   for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function       
		       
	auto bb = &(*bbit);
	for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
			      auto I = &(*it);

				if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
				      llvm::Value* addr = store->getOperand(1);
				      
				      if( auto g = llvm::dyn_cast<llvm::GlobalVariable>( addr ) ) {

					if (list_gvars.empty())
						list_gvars.push_back(g);
					else {
					if (find(list_gvars.begin(), list_gvars.end(), g) == list_gvars.end())
 					  list_gvars.push_back(g);
					 }
					}
				  }	

				if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
				      llvm::Value* addr = load->getOperand(0);
				      
				      if( auto g = llvm::dyn_cast<llvm::GlobalVariable>( addr ) ) {
					 if (list_gvars.empty())
						list_gvars.push_back(g);
					else {
					if (find(list_gvars.begin(), list_gvars.end(), g) == list_gvars.end())
 					  list_gvars.push_back(g);
					 }
					 }
					}
				  } 
				}    

			std::cout << "Function name is " << f.getName().str() << "\n" << "No. of global variables is " << list_gvars.size() << " \n";

			for(int i=0; i < list_gvars.size(); i++)
   				std::cout << (std::string)((list_gvars.at(i))->getName()) << "\n";

		    auto pair = std::make_pair( f.getName().str() , list_gvars );
  		    fn_gvars_map.insert( pair );

		    list_gvars.clear();   
	} 

      return true;
    } 


void collect_globals_pass::insert_concurrent(std::string FnName1, std::string FnName2)
{
	if( fn_gvars_map.find(FnName1) != fn_gvars_map.end() ) {
	     list_gvars = fn_gvars_map[FnName1];
	     for (auto i = fn_gvars_map.begin(); i != fn_gvars_map.end(); i++) {
		 if (i->first ==  FnName2) {
			for(int j=0; j < list_gvars.size(); j++)
			{
   				auto g1 = list_gvars.at(j);
				if (find(i->second.begin(), i->second.end(), g1) != i->second.end()) {
					if (concurrent_list.empty())
						concurrent_list.push_back(g1);
					else {
					if (find(concurrent_list.begin(), concurrent_list.end(), g1) == concurrent_list.end())
 					  concurrent_list.push_back(g1);
					 }	
				}
			}
		 } 
 	     }
	}
	for(int i=0; i < concurrent_list.size(); i++)
   		std::cout << "Concurrent variable number " << i << " is " << (std::string)((concurrent_list.at(i))->getName()) << "\n";
	
}


 void collect_globals_pass::CreateRdWrEvents(llvm::Function &f) {

  std::string name = (std::string)f.getName();
  unsigned thr_id = 1; //To be corrected later

  me_set prev_events;
  expr start_bit = get_fresh_bool(solver_ctx,"start");
  std::vector< expr > history = { start_bit };
  source_loc loc( name );
  
  auto start = mk_me_ptr( mem_enc, thr_id, prev_events, start_bit, history,
                          loc, event_t::barr );
  set_start_event( thr_id, start, start_bit );

  prev_events.insert( start );

  expr path_cond = solver_ctx.bool_val(true);

	for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function       
		       
	auto bb = &(*bbit);
	for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
		auto I = &(*it);

		if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
		      llvm::Value* addr = store->getOperand(1);
		      auto loc = getInstructionLocation( I );
		      expr val = read_const( o, store->getOperand(0) );
		      me_set new_events;
		      if (auto g = llvm::dyn_cast<llvm::GlobalVariable>( addr ) ) {
				if (find(concurrent_list.begin(), concurrent_list.end(), g) != concurrent_list.end()) {			
					auto wr = mk_me_ptr( mem_enc, thr_id, prev_events, path_cond,  //thread_id to be passed correctly
							     history, g, loc, event_t::w,
							     translate_ordering_tags( store->getOrdering()) );

					new_events.insert( wr );
					/*const auto& data_dep_set = get_depends( store->getOperand(0) );
					wr->set_data_dependency( data_dep_set );
					wr->set_ctrl_dependency( get_ctrl(b) );
					if(p->is_mm_power())
						wr->set_ctrl_isync_dep(get_ctrl_isync(b));
					block_ssa = block_ssa && ( wr->wr_v() == val ); */
				       }
		      }
		      add_event( thr_id, new_events );
		      /* p->set_c11_rs_heads( new_events, local_release_heads[b] );
		      prev_events = new_events;
		      assert( !recognized );recognized = true; */
		}
	
		else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
			llvm::Value* addr = load->getOperand(0);
			auto loc = getInstructionLocation( I );
			expr val = read_const( o, load->getOperand(1) );
		        me_set new_events;
			if( auto g = llvm::dyn_cast<llvm::GlobalVariable>( addr ) ) {
			  if (find(concurrent_list.begin(), concurrent_list.end(), g) != concurrent_list.end()) {			
			  auto rd = mk_me_ptr( mem_enc, thr_id, prev_events, path_cond,  //thread_id to be passed correctly
							     history, g, loc, event_t::r,
							     translate_ordering_tags( load->getOrdering()) );
			  /* local_map[I].insert( hb_enc::depends( rd, z3.mk_true() ) );
			  rd->set_ctrl_dependency( get_ctrl(b) );
			  if(p->is_mm_power())
			  	rd->set_ctrl_isync_dep( get_ctrl_isync(b) ); 
			  new_events.insert( rd );
			  block_ssa = block_ssa && ( rd->rd_v() == l_v);
			} */
			add_event( thr_id, new_events);
			/* p->set_c11_rs_heads( new_events, local_release_heads[b] );
			prev_events = new_events;
			assert( !recognized );recognized = true;
		      } */		 
	  	  }
		}
	   }
	}
     }
}


unsigned collect_globals_pass::add_thread( std::string str) {
      //auto thr = std::make_shared<thread>( _z3, str );
      threads.push_back( str );
      thread_num++;
      return thread_num-1;
    }


o_tag_t
collect_globals_pass::translate_ordering_tags( llvm::AtomicOrdering ord ) {
  switch( ord ) {
  case llvm::AtomicOrdering::NotAtomic: return o_tag_t::na; break;
  case llvm::AtomicOrdering::Unordered: return o_tag_t::uo; break;
  case llvm::AtomicOrdering::Monotonic: return o_tag_t::mon; break;
  case llvm::AtomicOrdering::Acquire: return o_tag_t::acq; break;
  case llvm::AtomicOrdering::Release: return o_tag_t::rls; break;
  case llvm::AtomicOrdering::AcquireRelease: return o_tag_t::acqrls; break;
  case llvm::AtomicOrdering::SequentiallyConsistent: return o_tag_t::sc; break;
  default:
    llvm_bmc_error("bmc", "Unsupported nondet type!");
  }
  return o_tag_t::na; // dummy return;
}


source_loc collect_globals_pass::getInstructionLocation(const llvm::Instruction* I ) {
  const llvm::DebugLoc d = I->getDebugLoc();
  source_loc l;
  if( d ) {
    l.line = d.getLine();
    l.col  = d.getCol();
    l.file = llvm::cast<llvm::DIScope>(d.getScope())->getFilename();
  }
  return l;
}


void collect_globals_pass::add_event( unsigned i, me_ptr e )   {
    if( i < threads.size() ) {
      add_event( e );
      /*if( e->is_rd() ) rd_events[e->prog_v].push_back( e );
      if( e->is_wr() ) wr_events[e->prog_v].insert( e );
      if( e->is_sc() ) all_sc.insert( e ); */ //To be added later
    }
    // todo what to do with pre/post events
//    se_store[e->name()] = e;
  }


llvm::StringRef collect_globals_pass::getPassName() const {
  return "Collect global variables read and written by a function";
}

void collect_globals_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}
