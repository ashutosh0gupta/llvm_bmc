#ifndef TILER_BMC_DS_H
#define TILER_BMC_DS_H

#include <unordered_map>
#include "lib/utils/z3_utils.h"
#include "lib/utils/llvm_utils.h"
#include "lib/bmc/glb_model.h"
#include "lib/bmc/array_model.h"
#include "lib/bmc/value_expr_map.h"
// #include "aggregation/aggregate.h"

enum aggr_tag {tile, overlap, counter, aggregate, unknown};

typedef std::unordered_map<expr, enum aggr_tag, expr_hash, expr_equal> expr_tag;

class bmc_ds {
public:
  solver_context& solver_ctx;
  value_expr_map m;

  bmc_ds( solver_context& solver_ctx_,
          std::map<const llvm::Instruction*, unsigned>& aim,
          glb_model& g_model_ )
    : solver_ctx( solver_ctx_)
    , m(solver_ctx)
    , g_model( solver_ctx, g_model_ )
    , ar_model_full( solver_ctx )
    , ar_model_fixed( solver_ctx )
    , ary_to_int(aim)
{}
  //--------------------------------------------------------------------------
  //interface to global model

  glb_model g_model;

  std::pair<expr,expr>
  glb_write(unsigned, const llvm::StoreInst*, expr& );
  expr glb_read( unsigned, const llvm::LoadInst*);
  expr join_glb_state( std::vector<expr>&,
                             std::vector<unsigned>&, unsigned );

  glb_state& get_glb_state( const bb* b );
  expr get_glb_state_var( unsigned bidx, const llvm::GlobalVariable*);
  void set_glb_state( unsigned bidx, glb_state& );
  void init_glb_model( glb_state& );
  void init_glb_model();
  void refresh_glb_state( unsigned, const llvm::GlobalVariable* );

  //--------------------------------------------------------------------------
  //interface to array model

  array_model_t ar_model_init = NONE;
  array_model_full      ar_model_full;
  array_model_fixed_len ar_model_fixed;
  // array_model_partition ar_model_part;

  std::map< const llvm::Instruction*, unsigned > ary_access_to_index;
  std::map< const llvm::Instruction*, unsigned >& ary_to_int;

  std::pair<expr,expr>
  array_write(unsigned, const llvm::StoreInst*, expr&, expr& );
  expr array_read( unsigned, const llvm::LoadInst*, expr& idx);
  expr join_array_state( std::vector<expr>&,
                             std::vector<unsigned>&, unsigned );

  array_state& get_array_state( const bb* b );
  void set_array_state( unsigned bidx, array_state& );
  expr get_array_state_var( unsigned bidx, const llvm::AllocaInst*);
  expr get_array_state_var( unsigned bidx, const llvm::Instruction*);

  //--------------------------------------------------------------------------
  // initialization of array models
  // two array models can not be initialized at the sametime;
  // once a model is initialized, call to the other initializations will throw
  // error.
  void init_partition_array_model(unsigned part_num);
  void init_full_array_model( unsigned,
                              std::map<const llvm::Instruction*,unsigned>&);
  void init_fixed_len_array_model( unsigned,
                                   std::map<const llvm::Instruction*,unsigned>&);
  void init_array_model( array_model_t );
  void init_array_model( array_model_t ar_model_local, array_state& );
  void refresh_array_state( unsigned, std::vector<const llvm::Instruction*>& );
  void refresh_array_state( unsigned, const llvm::Instruction* );

  //--------------------------------------------------------------------------

  inline void import_expr_map( value_expr_map& m_ ) {
    // m.copy_values( m_ );
    m_.copy_values( m );
  }

  expr get_expr( const llvm::Value* v );

  const bb* eb; //todo: deprecate

  unsigned processed_bidx = 0;
  bb_vec_t bb_vec; // index in this vector is the block id
  std::map< unsigned, std::vector<unsigned> > pred_idxs;
  std::vector< std::pair<unsigned,unsigned> > exits; //block_position,succ_no
  std::vector< unsigned > latches;

  std::map< const bb*, unsigned> block_to_id; // todo: deprecate

  std::map< unsigned, expr > block_to_path_bit;
  std::map< unsigned, std::vector<expr> > block_to_exit_bits;

  void print_formulas( unsigned print_from = 0, unsigned print_spec_from = 0);

  void insert_prev_idx( unsigned bidx, unsigned prev_bidx);
  std::vector<unsigned>& get_prev_idxs( unsigned bidx);

  unsigned find_block_idx( const bb* b);

  inline void add_latch( unsigned lidx  ) {
    latches.push_back( lidx );
  }

  inline void add_latch( const bb* latch  ) {
    auto l_idx = find_block_idx( latch );
    add_latch( l_idx );
  }

  inline void add_latches( std::vector<const bb*> latches  ) {
    for( const bb* latch : latches )
      add_latch( latch );
  }

  inline void add_exit( unsigned lidx, unsigned succ_num  ) {
    exits.push_back( {lidx, succ_num} );
  }

  inline void add_exit( const bb* exit, unsigned succ_num  ) {
    auto l_idx = find_block_idx( exit );
    add_exit( l_idx, succ_num );
  }

  inline void add_exits( std::vector< std::pair< const bb*, unsigned > > es ) {
    for( auto& exit : es )
      add_exit( exit.first, exit.second );
  }

  inline
  void get_exit_block_positions( const bb* prev,
                                 std::vector<unsigned>& positions ) {
    for( auto& bidx : exits) {
      if( bb_vec[bidx.first] == prev ) positions.push_back( bidx.first );
    }
  }

  inline expr get_path_bit( unsigned bidx ) {
    return block_to_path_bit.at(bidx);
  }

  inline void set_path_bit( unsigned bidx, expr b ) {
    auto pair = std::make_pair( bidx, b);
    block_to_path_bit.insert( pair );
  }

  inline std::vector< expr >& get_exit_bits( unsigned bidx ) {
    return block_to_exit_bits.at(bidx);
  }

  inline expr get_exit_bit( unsigned bidx, unsigned succ_num ) {
    auto& vec= get_exit_bits( bidx );
    if( vec.size() == 0 && succ_num == 0 ) {
      return solver_ctx.bool_val(true);
    }if( vec.size() == 0 && succ_num > 0 ) {
      // special case of artificial wiring; for aggregation module
      // aggregation module interferes with generation of exit and path bits
      return solver_ctx.bool_val(true);
    }else{
      assert(  succ_num < vec.size() );
      return vec[succ_num];
    }
  }

  inline void set_exit_bits( unsigned bidx, std::vector<expr>& b ) {
    block_to_exit_bits[bidx] = b;
  }

  inline expr get_exit_branch_path( unsigned bidx, unsigned succ_num) {
    return get_path_bit( bidx ) && get_exit_bit( bidx, succ_num );
  }

  inline void add_bmc_formulas(  std::vector< expr > fs ) {
    bmc_vec.insert( bmc_vec.begin(), fs.begin(), fs.end() );
  }

  void setup_prevs_non_repeating();
  void copy_and_stich_segments( unsigned times );
  void copy_and_stich_segments( std::vector<const bb*>&,
                                std::map< unsigned, std::vector<unsigned> >&,
                                std::vector< std::pair<unsigned,unsigned> >&,
                                std::vector< unsigned >& latches,
                                unsigned times
                                );
  std::vector<expr> bmc_vec;  //final result;
  std::vector<expr> spec_vec; //specs from the code;
  std::vector<expr> quant_elim_vars;
  std::vector<llvm::Value*> quant_elim_val;

  expr_tag subexpr_tags;

  std::set<std::string> locals;
  std::map< const llvm::Instruction*, std::string > dbg_name_map;

  std::map< const bb*, bb_set_t > loop_ignore_edges;
  std::map< const bb*, bb_set_t > rev_loop_ignore_edges;

  bool ignore_edge( const bb* cb, const bb* prev) {
    if( exists( loop_ignore_edges, cb ) )
      return exists( loop_ignore_edges.at( cb ), prev);
    return false;
  }

  virtual ~bmc_ds() {}
};

class bmc_fun : public bmc_ds {

public:
  bmc_fun( solver_context& solver_ctx_,
           std::map<const llvm::Instruction*, unsigned>& aim,
           glb_model& g_model)
    : bmc_ds( solver_ctx_, aim, g_model) {}

  // Call sites
  std::vector<const llvm::CallInst*> call_sites;
  unsigned get_call_count( const llvm::CallInst* call );

  virtual ~bmc_fun() = default;
};
class bmc_ds_aggr;

// class bmc_loop : public bmc_ds {

//   loopdata* ld = 0;
// public:
//   bmc_loop( solver_context& solver_ctx_,
//             std::map<const llvm::Instruction*, unsigned>& aim,
//             glb_model& g_model,
//             loopdata* ld_ )
//     : bmc_ds( solver_ctx_, aim, g_model)
//     , ld(ld_) {}

//   inline loopdata* get_loopdata() { return ld; }

//   void get_written_arrays( std::vector<const llvm::AllocaInst*>& );
//   void get_written_globals( std::vector<const llvm::GlobalVariable*>& );
//   std::vector<const llvm::AllocaInst*>& get_pure_read_arrays();
//   std::vector<const llvm::GlobalVariable*>& get_pure_read_globals();
//   std::vector<llvm::Value*>& get_read_outer_locals();

//   void collect_loop_back_edges(llvm::Loop*);
//   virtual ~bmc_loop() = default;
//   friend bmc_ds_aggr;
// };



#endif // TILER_BMC_DS_H
