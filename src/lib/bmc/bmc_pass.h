#ifndef TILER_BMC_PASS_H
#define TILER_BMC_PASS_H

#include "include/options.h"
#include "lib/utils/solver_utils.h"
#include "lib/utils/llvm_utils.h"
#include "include/bmc_ds.h"
#include "include/bmc.h"
#include "include/heap_model.h"

class bmc;       // forward declaration of the bmc class

class bmc_pass {

public:
  options& o;
  solver_context& solver_ctx;
  bmc& bmc_obj;
  bmc_ds* bmc_ds_ptr = 0;

  // Permanent facts accross do_run calls. the facts may be extended
  // accross run calls but infomration does not go stale.
  std::map< const llvm::Value*, unsigned > ary_to_int;
  std::vector<expr> array_lengths;

private:
  //--------------------------------------------------------------------------
  // debug info management
  std::set<const llvm::Value*> seen_dbg_val;


  //--------------------------------------------------------------------------

  void translateBlock( unsigned bidx, const bb* );
  void translateCommentProperty( unsigned, const bb*);

  void translateUnaryInst(unsigned, const llvm::UnaryInstruction*  );
  // void translateTerminatorInst(unsigned, const llvm::TerminatorInst *);

  void translateRetInst(const llvm::ReturnInst *);
  void translateBinOp( unsigned, const llvm::BinaryOperator*);
  void translateCmpInst( unsigned, const llvm::CmpInst*);
  void translatePhiNode(  unsigned, const llvm::PHINode* );
  void translateSelectInst( unsigned, const llvm::SelectInst* );
  void translateBranch( unsigned, const llvm::BranchInst* );
  void translateCallInst( unsigned, const llvm::CallInst* );
  void translateIntrinsicInst( unsigned, const llvm::IntrinsicInst* );
  void translateDebugInfo( unsigned, const llvm::DbgInfoIntrinsic* );
  void translateCastInst( unsigned, const llvm::CastInst*);
  void translateAllocaInst(const llvm::AllocaInst*);
  void translateLoadInst(unsigned, const llvm::LoadInst*);
  void translateStoreInst(unsigned, const llvm::StoreInst*);
  void translateGetElementPtrInst(const llvm::GetElementPtrInst*);
  void translateSwitchInst(unsigned, const llvm::SwitchInst *);
  void translateUnreachableInst(unsigned, const llvm::UnreachableInst *);
  void init_path_exit_bit(bb_vec_t & //, const bb*
                          );
  void loadFromArrayHelper(unsigned, const llvm::LoadInst*, expr);
  void storeToArrayHelper(unsigned, const llvm::StoreInst*, const llvm::Value*, expr);

  void translateNondet(unsigned, const llvm::CallInst*);
  void assume_to_bmc(unsigned bidx, const llvm::CallInst*);
  bool is_assume(const llvm::CallInst*);
  void assert_to_spec( unsigned bidx, const llvm::CallInst*);
  bool is_assert(const llvm::CallInst*);
  void populate_globals_map( std::unique_ptr<llvm::Module>& );

  // expr extend_path( const bb* pre_b, unsigned idx_succ );
  // expr extend_path( const bb* b, const bb* pre_b );
  expr extend_path( unsigned bidx, unsigned pre_bidx );

  void print_bb_exprs(const bb*);
  void print_bb_vecs();

protected:
  void populateArrAccMap(llvm::Function*);

public:
  bmc_pass( options&, solver_context&, bmc&);
  virtual ~bmc_pass();

  void translateParams(llvm::Function &);
  void do_bmc();

};

#endif // TILER_BMC_PASS_H
