#include "lib/bmc/bmc_concurrency.h"

char bmc_concur_pass::ID = 0;

bmc_concur_pass::bmc_concur_pass( options& o_, solver_context& ctx_, bmc& b_)
  : bmc_pass(o_,ctx_,b_), translate_specs(), llvm::FunctionPass(ID)
{}

bmc_concur_pass::~bmc_concur_pass() {}


llvm::StringRef bmc_concur_pass::getPassName() const {
  return "Constructs BMC formula for a concurrent program";
}


bool bmc_concur_pass::runOnFunction( llvm::Function &f ) {

  std::string fname = demangle(f.getName().str());

  unsigned j = 0;
  for (;j < bmc_obj.threads.size(); j++) {
    thread_name = bmc_obj.threads.at(j).name;
    EntryFn = bmc_obj.threads.at(j).entry_function;
    if (fname != EntryFn) continue;
    else break;
  }
  if( j == bmc_obj.threads.size() ) return false;
  // collect all the declared arrays in the function
  populate_array_name_map(&f);

  bmc_fun *bmc_fun_ptr = new bmc_fun(o, ary_to_int, bmc_obj.m_model); // local
  assert(bmc_fun_ptr);
  bmc_ds_ptr = bmc_fun_ptr;                 // set the pointer in base class
  auto pair = std::make_pair( &f, bmc_fun_ptr);
  bmc_obj.get_func_formula_map().insert( pair );

  collect_loop_backedges(this, bmc_fun_ptr->loop_ignore_edges,
                         bmc_fun_ptr->rev_loop_ignore_edges);
  bmc_fun_ptr->bb_vec.clear();
  computeTopologicalOrder(f, bmc_fun_ptr->rev_loop_ignore_edges,
                          bmc_fun_ptr->bb_vec, bmc_fun_ptr->block_to_id);
  bmc_fun_ptr->eb = &f.getEntryBlock();
  bmc_fun_ptr->setup_prevs_non_repeating();


  bmc_ds_ptr->init_array_model( o.ar_model );

  bmc_ds_ptr->thread_id = bmc_obj.threads.at(j).thread_num;

  translateParams(f);
  //translate pre condition here <<---
  //bmc_obj.m_model.print();

  translatePrecond(bmc_obj, bmc_ds_ptr, o.solver_ctx);
  
  for (unsigned l = 0; l < bmc_obj.threads.at(j).period; l++) {
    do_bmc();

     unsigned bidx = 0;
     for( const bb* src : bmc_ds_ptr->bb_vec ) {
     if (llvm::isa<llvm::ReturnInst>(src->getTerminator() )) {
      translatePostcond(bmc_obj, bmc_ds_ptr, o.solver_ctx, bidx);
     }
     bidx++;
    }
  }
 
  //if( o.verbosity > 10 ) {
    // Print collected events events here
 for (auto m = bmc_obj.all_events.begin(); m != bmc_obj.all_events.end(); m++) {
      std::cout << "Thread ID is " << m->second << " Event is " << *(m->first) << "\n";
   } 
  // Add code for stitching the events, when both are processed
  return false;
}


void bmc_concur_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}
