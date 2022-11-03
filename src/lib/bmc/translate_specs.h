#ifndef TILER_BMC_TRANSLATESPECS_H
#define TILER_BMC_TRANSLATESPECS_H

#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include "include/bmc.h"

class translate_specs {

public:
  
  std::vector<std::string> global_vars;
  std::vector <std::string> precond_var_names;
  std::vector <expr> precond_declarations;
  std::vector <std::string> postcond_var_names;
  std::vector <expr> postcond_declarations;
  
public:
  translate_specs();
  ~translate_specs();

  void translatePrecond( bmc&, bmc_ds*, solver_context&, std::vector <expr> );
  void translatePostcond( bmc&, bmc_ds*, solver_context&, unsigned, std::vector <expr> );
  std::vector<std::string> read_variables( std::string );

};

#endif // TILER_BMC_TRANSLATESPECS_H
