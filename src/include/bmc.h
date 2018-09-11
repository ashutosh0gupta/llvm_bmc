#ifndef LLVM_BMC_H
#define LLVM_BMC_H

#include "include/options.h"
#include "z3++.h"

#include "include/bmc_ds.h"
#include "include/loopdata.h"
#include "include/glb_model.h"

//for comments
#include "lib/utils/llvm_utils.h"

class glb_model;
class comments;

#define OUTSIDE_ANY_LOOP_CODE_PTR NULL

class bmc {
public:
  options& o;
  z3::context& solver_ctx;
  value_expr_map& def_map;
  std::unique_ptr<llvm::Module>& module;
  std::map< const llvm::BasicBlock*, comments >& bb_comment_map;

  std::map< const llvm::Function*, bmc_fun*> func_formula_map;

  // loop_formula_map[NULL] maps to data for the code that is not in any loop
  std::map< const llvm::Loop*, bmc_loop*> loop_formula_map;
  std::map<llvm::Loop*, loopdata*>& ld_map;

  name_map& localNameMap;
  std::map< const llvm::BasicBlock*,rev_name_map > revStartLocalNameMap;//todo:likely useless
  std::map< const llvm::BasicBlock*, rev_name_map > revEndLocalNameMap;

  bmc(std::unique_ptr<llvm::Module>& m_,
      std::map<const bb*, comments >& bb_comment_map_,
      options& o_, z3::context& z3_,
      value_expr_map& def_map_,
      std::map<llvm::Loop*, loopdata*>& ldm,
      name_map& lMap
      );

  ~bmc();

  //-------------------------------------------
  // Global model
  std::vector<z3::expr> glb_bmc_vec;
  glb_model g_model;
  glb_state populate_glb_state();
  void init_glb();

  //-------------------------------------------
  // Checking Specs and Reporting results
  // void eliminate_vars(bmc_ds*);
  void check_all_spec(bmc_ds*);
  bool run_solver(z3::expr &, bmc_ds*);

  void produce_witness_call( z3::model mdl, const llvm::CallInst* call );
  void produce_witness( z3::model, bmc_ds*, unsigned call_count=0 );
  std::string get_val_for_instruction( const llvm::Instruction* I,
                                       z3::model& mdl,
                                       std::map<std::string, std::string>&,
                                       bmc_ds*,  unsigned call_count );

  //-------------------------------------------
  void run_bmc_pass();
  // void collect_aggr_pass();

  std::map< const llvm::Function*, bmc_fun*>& get_func_formula_map();
  std::map< const llvm::Loop*, bmc_loop*>& get_loop_formula_map();
};

#endif // LLVM_BMC_H
