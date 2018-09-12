#ifndef TILER_COLLECT_LOOPDATA_H
#define TILER_COLLECT_LOOPDATA_H

#include "llvm/Analysis/LoopPass.h"
#include "include/options.h"
#include "include/loopdata.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/build_name_map.h"

class collect_loopdata : public llvm::LoopPass {

public:
  static char ID;
  options& o;
  std::map<llvm::Loop*, loopdata*>& ld_map;
  name_map& localNameMap;
  llvm::ScalarEvolution* SE;
  std::unique_ptr<llvm::Module>& module;

  collect_loopdata( options&,
                    std::map<llvm::Loop*, loopdata*>& ,
                    name_map& ,
                    std::unique_ptr<llvm::Module>& );
  ~collect_loopdata();

  llvm::PHINode* getInductionVariable(llvm::Loop*, llvm::ScalarEvolution*);
  void populate_head_phi_names(llvm::Loop *, loopdata*);
  void populate_ctr_data(llvm::Loop*, loopdata*);
  void populate_step_count( llvm::PHINode*, loopdata*);
  void populate_init_bound(llvm::Value*, loopdata*);
  void populate_exit_bound(llvm::Loop*, loopdata*);
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
  void compute_peel_direction(llvm::Loop*, loopdata*);

  virtual bool doInitialization(llvm::Loop *, llvm::LPPassManager &);
  virtual bool runOnLoop(llvm::Loop *, llvm::LPPassManager &);
  virtual bool doFinalization();
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};

#endif // TILER_COLLECT_LOOPDATA_H
