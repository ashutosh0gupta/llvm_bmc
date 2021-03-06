#ifndef TILER_BMC_FUN_PASS_H
#define TILER_BMC_FUN_PASS_H

#include "lib/bmc/bmc_pass.h"

class bmc_fun_pass : public bmc_pass, public llvm::FunctionPass {

public:
  static char ID;

public:
  bmc_fun_pass( options&, solver_context&, bmc&);
  ~bmc_fun_pass();

  virtual bool runOnFunction( llvm::Function & );
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};

#endif // TILER_BMC_FUN_PASS_H
