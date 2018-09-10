#ifndef TILER_COLLECT_LOOPDATA_H
#define TILER_COLLECT_LOOPDATA_H

#include "llvm/Analysis/LoopPass.h"
#include "loopdata.h"
#include "utils/options.h"
#include "utils/llvmUtils.h"
#include "utils/z3Utils.h"
#include "irtoz3expr/irtoz3expr_index.h"

class collect_loopdata : public llvm::LoopPass {

public:
  static char ID;
  z3::context& z3_ctx;
  options& o;
  value_expr_map& def_map;
  std::map<llvm::Loop*, loopdata*>& ld_map;
  name_map& localNameMap;
  std::map<std::string, llvm::Value*>& exprValMap;
  irtoz3expr_index* ir2e;
  llvm::ScalarEvolution* SE;
  std::unique_ptr<llvm::Module>& module;

  collect_loopdata( z3::context& ,
                    options&,
                    value_expr_map&,
                    std::map<llvm::Loop*, loopdata*>& ,
                    name_map& ,
                    std::map<std::string, llvm::Value*>&,
                    std::unique_ptr<llvm::Module>& );
  ~collect_loopdata();

  llvm::PHINode* getInductionVariable(llvm::Loop*, llvm::ScalarEvolution*);
  void populate_head_phi_names(llvm::Loop *, loopdata*);
  void populate_ctr_data(llvm::Loop*, loopdata*);
  void populate_step_count( llvm::PHINode*, loopdata*);
  void populate_init_bound(llvm::Value*, loopdata*);
  void populate_exit_bound(llvm::Loop*, loopdata*);
  void compute_exit_list(llvm::Value*, bb*, std::list<z3::expr>&, bool&, bool);
  bool hasPhiNode(llvm::Value*);
  void collect_overlap(llvm::Loop*, loopdata*);
  void collect_arr_n_glb_read_write(llvm::Loop*, loopdata*);
  void collect_const_vars(llvm::Loop *, std::vector<llvm::Value*>&);
  void check_inst_add(llvm::Loop*, llvm::Value*, std::vector<llvm::Value*>&);
  void update_children_parent(llvm::Loop *, loopdata*);
  void collect_blocks(llvm::Loop*, loopdata*);
  void collect_nonloop_blocks();
  void collect_allloop_blocks(loopdata* ld,std::vector<llvm::BasicBlock*>& l);

  void collect_tiles(llvm::Loop*, loopdata*);
  z3::expr getTileExprFromList(llvm::Loop*, std::list<z3::expr>);
  bool checkOverlap(z3::expr, z3::expr, int);
  void compute_peel_direction(llvm::Loop*, loopdata*);

  virtual bool doInitialization(llvm::Loop *, llvm::LPPassManager &);
  virtual bool runOnLoop(llvm::Loop *, llvm::LPPassManager &);
  virtual bool doFinalization();
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};

#endif // TILER_COLLECT_LOOPDATA_H
