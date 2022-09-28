#ifndef TILER_BMC_CONCURRENCY_H
#define TILER_BMC_CONCURRENCY_H

#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include "lib/bmc/bmc_pass.h"
#include "lib/bmc/translate_specs.h"

// -- high level architecture
// -- create all read write events
// -- encode constraints

class bmc_concur_pass : public bmc_pass, public translate_specs, public llvm::FunctionPass {

public:
  static char ID;
  std::string thread_name, EntryFn;
  
public:
  bmc_concur_pass( options&, solver_context& ctx_, bmc&);
  ~bmc_concur_pass();

  virtual bool runOnFunction( llvm::Function & );
  
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};

#endif // TILER_BMC_CONCURRENCY_H
