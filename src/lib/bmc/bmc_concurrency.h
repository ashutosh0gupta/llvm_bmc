#ifndef TILER_BMC_CONCURRENCY_H
#define TILER_BMC_CONCURRENCY_H

#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include "lib/bmc/bmc_pass.h"

// -- high level architecture
// -- create all read write events
// -- encode constraints

class bmc_concur_pass : public bmc_pass, public llvm::FunctionPass {

public:
  static char ID;
  std::vector<std::string> global_vars;
  std::vector <std::string> precond_var_names;
  std::vector <expr> precond_declarations;
  std::vector <std::string> postcond_var_names;
  std::vector <expr> postcond_declarations;

public:
  bmc_concur_pass( options&, solver_context& ctx_, bmc&);
  ~bmc_concur_pass();

  virtual bool runOnFunction( llvm::Function & );
  void translatePrecond( bmc& );
  void translatePostcond( bmc&, unsigned );
  std::vector<std::string> read_variables( std::string );
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};

#endif // TILER_BMC_CONCURRENCY_H
