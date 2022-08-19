#ifndef TILER_BMC_FUN_PASS_H
#define TILER_BMC_FUN_PASS_H

#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include "lib/bmc/bmc_pass.h"

class bmc_fun_pass : public bmc_pass, public llvm::FunctionPass {

public:
  static char ID;
  std::vector<std::string> global_vars;
  std::vector <std::string> precond_var_names;
  std::vector <expr> precond_declarations;
  std::vector <std::string> postcond_var_names;
  std::vector <expr> postcond_declarations;

  std::string thread_name, EntryFn;

public:
  bmc_fun_pass( options&, solver_context& ctx_, bmc&);
  ~bmc_fun_pass();

  virtual bool runOnFunction( llvm::Function & );
  void translatePrecond( bmc& );
  void translatePostcond( bmc&, unsigned );
  std::vector<std::string> read_variables( std::string );
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};

#endif // TILER_BMC_FUN_PASS_H
