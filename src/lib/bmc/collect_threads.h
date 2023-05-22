#ifndef LLVMBMC_COLLECT_THREADS_H
#define LLVMBMC_COLLECT_THREADS_H

/*#include "include/solver.h"*/
#include "lib/utils/solver_utils.h"
#include "include/options.h"
#include "include/bmc.h"
#include "include/memory_cons.h"
#include "include/memory_event.h"

#include <string.h>
#include<iostream>

class collect_threads {

public:
  std::unique_ptr<llvm::Module>& module;
  bmc& b;
  memory_cons& mem_enc;
  solver_context& solver_ctx;
  options& o;

  // std::map< std::string,  std::vector<const llvm::Value*>> fn_gvars_map;
  // std::vector<const llvm::GlobalVariable*> list_gvars;

  // std::vector<const llvm::Value*> list_gvars;


public:
/*  collect_threads( std::unique_ptr<llvm::Module>& m_,*/
/*                        solver_context& solver_ctx__, memory_cons& mem_enc_,*/
/*                        options& o, bmc& b);*/
   collect_threads( std::unique_ptr<llvm::Module>& m_,
                    bmc& b,
                    memory_cons& mem_enc_,
                    solver_context& solver_ctx__,
                    options& o );
   ~collect_threads();

  void collect_threads_internal( std::unique_ptr<llvm::Module>& m, bmc &b );


};


#endif // LLVMBMC_COLLECT_THREADS_H
