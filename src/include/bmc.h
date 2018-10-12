#ifndef LLVM_BMC_H
#define LLVM_BMC_H

#include "include/options.h"
#include "include/bmc_ds.h"
#include "include/loopdata.h"
#include "include/heap_model.h"
#include "include/solver.h"
#include "include/llvm_decls.h"


#define OUTSIDE_ANY_LOOP_CODE_PTR NULL

class bmc {
public:
  options& o;
  // solver_context& solver_ctx;
  value_expr_map def_map;
  std::unique_ptr<llvm::Module>& module;
  std::map< const llvm::BasicBlock*, comments >& bb_comment_map;

  std::map< const llvm::Function*, bmc_fun*> func_formula_map;

  // loop_formula_map[NULL] maps to data for the code that is not in any loop
  std::map< const llvm::Loop*, bmc_loop*> loop_formula_map;
  std::map<llvm::Loop*, loopdata*> ld_map;

  name_map localNameMap;
  std::map< const llvm::BasicBlock*,rev_name_map > revStartLocalNameMap;//todo:likely useless
  std::map< const llvm::BasicBlock*, rev_name_map > revEndLocalNameMap;

  bmc(std::unique_ptr<llvm::Module>& m_,
      std::map<const llvm::BasicBlock*, comments >& bb_comment_map_,
      options& o_ );

  ~bmc();

  //-------------------------------------------
  // Memory model
  std::vector<expr> glb_bmc_vec;
  memory_model m_model;
  memory_state populate_mem_state();
  void init();

  //-------------------------------------------
  // Checking Specs and Reporting results
  // void eliminate_vars(bmc_ds*);
  void check_all_spec(bmc_ds*);
  bool run_solver(expr &, bmc_ds*);

  void produce_witness_call( model mdl, const llvm::CallInst* call );
  void produce_witness( model, bmc_ds*, unsigned call_count=0 );
  std::string get_val_for_instruction( const llvm::Instruction* I,
                                       model& mdl,
                                       std::map<std::string, std::string>&,
                                       bmc_ds*,  unsigned call_count );

  //-------------------------------------------
  void run_bmc_pass();
  // void collect_aggr_pass();

  std::map< const llvm::Function*, bmc_fun*>& get_func_formula_map();
  std::map< const llvm::Loop*, bmc_loop*>& get_loop_formula_map();
};

#endif // LLVM_BMC_H
