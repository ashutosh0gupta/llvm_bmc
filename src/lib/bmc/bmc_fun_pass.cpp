#include "lib/bmc/bmc_fun_pass.h"

char bmc_fun_pass::ID = 0;

bmc_fun_pass::bmc_fun_pass( options& o_, solver_context& ctx_, bmc& b_)
  : bmc_pass(o_,ctx_,b_), translate_specs(), llvm::FunctionPass(ID)
{}

bmc_fun_pass::~bmc_fun_pass() {}

bool bmc_fun_pass::runOnFunction( llvm::Function &f ) {
  std::string fname = demangle(f.getName().str());
  if (o.check_spec) {
    thread_name = bmc_obj.sys_spec.threads.at(0).name;
    EntryFn = bmc_obj.sys_spec.threads.at(0).entry_function;
    if( fname != EntryFn ) return false;
  }
  else {
    if (fname != o.funcName) return false;
  }

  // collect all the declared arrays in the function
  populate_array_name_map(&f);

  //
  // allocating BMC data structure
  //
  bmc_fun *bmc_fun_ptr = new bmc_fun(o, ary_to_int, bmc_obj.m_model); // local
  assert(bmc_fun_ptr);
  bmc_ds_ptr = bmc_fun_ptr;                 // set the pointer in base class
  auto pair = std::make_pair( &f, bmc_fun_ptr);
  bmc_obj.get_func_formula_map().insert( pair );

  //
  // Collecting information about the block of function
  //
  collect_loop_backedges(this, bmc_fun_ptr->loop_ignore_edges,
                         bmc_fun_ptr->rev_loop_ignore_edges);
  bmc_fun_ptr->bb_vec.clear();
  computeTopologicalOrder(f, bmc_fun_ptr->rev_loop_ignore_edges,
                          bmc_fun_ptr->bb_vec, bmc_fun_ptr->block_to_id);
  bmc_fun_ptr->eb = &f.getEntryBlock();
  bmc_fun_ptr->setup_prevs_non_repeating();

  //
  // initialize array model
  //
  bmc_ds_ptr->init_array_model( o.ar_model );

  translateParams(f);

  translatePrecond(bmc_obj, bmc_ds_ptr, o.solver_ctx);

  do_bmc();
  //bmc_obj.m_model.print();

  unsigned bidx = 0;
  for( const bb* src : bmc_ds_ptr->bb_vec ) {
    if (llvm::isa<llvm::ReturnInst>(src->getTerminator() )) {
      translatePostcond(bmc_obj, bmc_ds_ptr, o.solver_ctx, bidx);
    }
    bidx++;
  }
  return false;
}


llvm::StringRef bmc_fun_pass::getPassName() const {
  return "Constructs BMC formula for a function - unroll param needed";
}

void bmc_fun_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}

