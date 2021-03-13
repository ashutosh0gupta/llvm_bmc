#include "lib/utils/utils.h"
#include "lib/bmc/memory_event.h"
#include "lib/bmc/memory_cons.h"
#include "include/collect_globals.h"

char collect_globals_pass::ID = 0;

collect_globals_pass::collect_globals_pass(llvm::Module &m, solver_context& solver_ctx__)
  : llvm::ModulePass(ID), solver_ctx(solver_ctx__), mem_enc(mem_enc)
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
    return true;
}


bool collect_globals_pass::runOnFunction( llvm::Function &f ) {
  
if ((f.getName().str() == fname1) ||(f.getName().str() == fname2)) {

  std::string name = (std::string)f.getName();
  unsigned thread_id = add_thread(name);
  std::cout << "Function name is " << name << " " << "Thread ID is " << thread_id << "\n";

  me_set prev_events;
  expr start_bit = get_fresh_bool(solver_ctx,"start");
  std::vector< expr > history = { start_bit };
  source_loc loc( name );
  
  auto start = mk_me_ptr( mem_enc, thread_id, prev_events, start_bit, history,
                          loc, event_t::barr );
  set_start_event( thread_id, start, start_bit );

  prev_events.insert( start );

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


 unsigned collect_globals_pass::add_thread( std::string str) {
      //auto thr = std::make_shared<thread>( _z3, str );
      threads.push_back( str );
      thread_num++;
      return thread_num-1;
    }



llvm::StringRef collect_globals_pass::getPassName() const {
  return "Collect global variables read and written by a function";
}

void collect_globals_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}
