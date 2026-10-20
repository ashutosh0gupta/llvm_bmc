#ifndef TILER_BMC_PASS_H
#define TILER_BMC_PASS_H

#include "include/options.h"
#include "lib/utils/solver_utils.h"
#include "lib/utils/llvm_utils.h"
#include "include/bmc_ds.h"
#include "include/bmc.h"
#include "include/array_model.h"
#include "include/memory_event.h"

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

  me_ptr start_event, final_event;
  me_set prev_events, final_prev_events;
  //me_vec it_events;
 

  expr start_cond = solver_ctx.bool_val(true);
  expr final_cond = solver_ctx.bool_val(true);

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
  void translateCatchBr( unsigned, const llvm::BranchInst*, unsigned );
  void translateInvokeInst( unsigned bidx, const llvm::InvokeInst *I);
  // void translateCallInst( unsigned, const llvm::CallInst* );
  int translateCallInst( unsigned, const llvm::CallInst* );
  // void translateIntrinsicInst( unsigned, const llvm::IntrinsicInst* );
  int translateIntrinsicInst( unsigned, const llvm::IntrinsicInst* );
  void translateFloatAbs(unsigned, const llvm::Instruction*, const llvm::Value*);
  void translateCopySign(unsigned, const llvm::Instruction*, const llvm::Value*,
                          const llvm::Value*);
  void translateAtan( unsigned, const llvm::CallBase* );
  void translateLibmCall( unsigned, const llvm::CallBase* );
  void translateInsertValueInst( unsigned, const llvm::InsertValueInst* );
  void translateSqrt( unsigned, const llvm::CallBase* );
  void need_bv_mode( const char* );
  void translateFunnelShift( unsigned, const llvm::IntrinsicInst*, bool );
  void translateMinMax( unsigned, const llvm::IntrinsicInst*, bool, bool );
  void translateByteSwap( unsigned, const llvm::IntrinsicInst* );
  void translateMemIntrinsic(unsigned, const llvm::MemIntrinsic*);
  void translateMemCall( unsigned, const llvm::CallInst*, llvm::StringRef );
  void translateMemFill( unsigned, const llvm::Instruction*,
                         const llvm::Value*, const llvm::Value*,
                         const llvm::Value*, bool );
  void seed_global_arrays();
  void translateDebugInfo( unsigned, const llvm::DbgInfoIntrinsic* );
  void translateCastInst( unsigned, const llvm::CastInst*);
  void translateAllocaInst(const llvm::AllocaInst*);
  void translateLoadInst(unsigned, const llvm::LoadInst*);
  void translateExtractValueInst(unsigned, const llvm::ExtractValueInst*);
  void extractValFromArrayHelper( unsigned , const llvm::ExtractValueInst*, exprs&);
  void extract_exception_info(unsigned, const llvm::ExtractValueInst*);
  void addEVIExprs( const llvm::ExtractValueInst*, exprs& );
  // llvm::Value getCatchArg(unsigned bidx, const llvm::CallInst* call);
  void translateStoreInst(unsigned, const llvm::StoreInst*);
  void translateGetElementPtrInst(unsigned, const llvm::GetElementPtrInst*);
  void translateSwitchInst(unsigned, const llvm::SwitchInst *);
  void translateUnreachableInst(unsigned, const llvm::UnreachableInst *);
  void translateLandingPadInst( unsigned, const llvm::LandingPadInst *);
  void init_path_exit_bit(bb_vec_t & //, const bb*
                          );
  void translateGEP( const llvm::GEPOperator* gep, exprs& );
  unsigned gep_cell_scale( const llvm::GEPOperator* gep );
  unsigned gep_step_units( const llvm::GEPOperator* gep );
  bool ptr_object_shape( const llvm::Value*, std::vector<uint64_t>&,
                         uint64_t& );
  void split_numeral_idxs( exprs&, const std::vector<uint64_t>& );
  std::vector<uint64_t> ptr_dims( const llvm::Value* );
  void offset_to_idxs( expr, const std::vector<uint64_t>&, exprs& );
  expr idxs_to_offset( const exprs&, const std::vector<uint64_t>& );
  void add_bound_spec( unsigned, expr );
  expr ptr_phi_offset( const llvm::PHINode* );
  uint64_t const_ptr_offset( const llvm::Value* );
  expr* find_ptr_base( const llvm::Value* );
  std::map< const llvm::Value*, expr > ptr_base;
  expr ptr_mem_offset( const llvm::LoadInst* );
  bool run_offset_term( const llvm::Value*, expr&, const llvm::DataLayout& );
  void loadFromArrayHelper(unsigned, const llvm::LoadInst*, exprs&);
  void storeToArrayHelper(unsigned, const llvm::StoreInst*,
                          const llvm::Value*, exprs&);

  void translateNondet(unsigned, const llvm::CallInst*);
  void assume_to_bmc(unsigned bidx, const llvm::CallInst*);
  void assert_to_spec( unsigned bidx, const llvm::CallInst*);
  void populate_globals_map( std::unique_ptr<llvm::Module>& );


  // expr extend_path( const bb* pre_b, unsigned idx_succ );
  // expr extend_path( const bb* b, const bb* pre_b );
  expr extend_path( unsigned bidx, unsigned pre_bidx );

  void print_bb_exprs(const bb*);
  void print_bb_vecs();

  //todo : concurrency support
  me_ptr create_write_event( unsigned, const llvm::StoreInst* store, llvm::Value* );
  me_ptr create_read_event( unsigned, const llvm::LoadInst* load, llvm::Value* );
  // void create_read_event( const llvm::StoreInst* store );
  // void create_block_event( const llvm::StoreInst* store );
  // void create_join_event( const llvm::StoreInst* store );
  // void create_fork_event( const llvm::StoreInst* store );

protected:
  void populate_array_name_map(llvm::Function*);

public:
  bmc_pass( options&, solver_context&, bmc&);
  virtual ~bmc_pass();

  void translateParams(llvm::Function &);
  void do_bmc();

  // void set_start_event( me_ptr e, expr cond ) {
  // }

  void set_start_event( unsigned i, me_ptr e, expr cond );
  void set_final_event( unsigned i, me_ptr e, expr cond );

  o_tag_t translate_ordering_tags( llvm::AtomicOrdering ord );
  char nth_letter(int n);

};

#endif // TILER_BMC_PASS_H
