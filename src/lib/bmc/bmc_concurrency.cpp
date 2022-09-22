#include "lib/bmc/bmc_concurrency.h"

char bmc_concur_pass::ID = 0;

bmc_concur_pass::bmc_concur_pass( options& o_, solver_context& ctx_, bmc& b_)
  : bmc_pass(o_,ctx_,b_), llvm::FunctionPass(ID)
{}


bmc_concur_pass::~bmc_concur_pass() {}


llvm::StringRef bmc_concur_pass::getPassName() const {
  return "Constructs BMC formula for a concurrent program";
}


bool bmc_concur_pass::runOnFunction( llvm::Function &f ) {
  return true;
}


void bmc_concur_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}


// -- run do_bmc for all the threads.
