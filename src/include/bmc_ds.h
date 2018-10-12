#ifndef TILER_BMC_DS_H
#define TILER_BMC_DS_H

#include <unordered_map>
#include "include/heap_model.h"
#include "include/memory_model.h"
#include "include/value_expr_map.h"

enum spec_reason_t{
  UNKNOWN,      // unspecified
  COMMENT,      // property found in a comment
  ASSERT,       // property occured in code
  OUT_OF_BOUND, // out of range access to arrays
  OUT_OF_RANGE // overflow/underflow
};


class spec{
  expr e;
  spec_reason_t reason;
  src_loc loc;
public:
  spec( expr e_, spec_reason_t reason_, src_loc& loc_ ) :
    e(e_), reason(reason_), loc(loc_) {}

  //getters
  expr get_formula() {return e; }
  src_loc get_location() {return loc; }

  //printers
  void dump();
  void print(std::ostream& os);
};

class bmc_ds {
public:
  options& o;
  solver_context& solver_ctx;
  value_expr_map m;

  bmc_ds( options& o_, //solver_context& solver_ctx_,
          std::map<const llvm::Instruction*, unsigned>& aim,
          std::vector<expr>& alv,
          memory_model& m_model_ )
    : o(o_)
    , solver_ctx( o.solver_ctx )
    , m(o)
    , m_model( m_model_ )
    , ar_model_full( o.solver_ctx )
    , ar_model_fixed( o.solver_ctx )
    , ary_to_int(aim)
    , array_lengths(alv)
{}
  //--------------------------------------------------------------------------
  //interface to memory model

  memory_model& m_model; // TODO: reference or copy?

  std::pair<expr,expr> write(unsigned, const llvm::StoreInst*, expr& );
  expr read( unsigned, const llvm::LoadInst*);
  expr join_state( std::vector<expr>&, std::vector<unsigned>&, unsigned );

  //--------------------------------------------------------------------------
  //interface to array model

  array_model_t ar_model_init = NONE;
  array_model_full      ar_model_full;
  array_model_fixed_len ar_model_fixed;
  // array_model_partition ar_model_part;

  std::map< const llvm::Instruction*, unsigned > ary_access_to_index;
  std::map< const llvm::Instruction*, unsigned >& ary_to_int;
  std::vector<expr>& array_lengths;

  arr_write_expr array_write( unsigned, const llvm::StoreInst*, expr&, expr& );
  arr_read_expr array_read( unsigned, const llvm::LoadInst*, expr& );
  expr join_array_state( std::vector<expr>&,
                             std::vector<unsigned>&, unsigned );

  array_state& get_array_state( const llvm::BasicBlock* b );
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
                              std::map<const llvm::Instruction*,unsigned>&,
                              std::vector<expr>& );
  void init_fixed_len_array_model( unsigned,
                                   std::map<const llvm::Instruction*,unsigned>&);
  void init_array_model( array_model_t );
  void init_array_model( array_model_t ar_model_local, array_state& );
  void refresh_array_state( unsigned, std::vector<const llvm::Instruction*>& );
  void refresh_array_state( unsigned, const llvm::Instruction* );

  //--------------------------------------------------------------------------

  void import_expr_map( value_expr_map& m_ );
  expr get_expr( const llvm::Value* v );

  const llvm::BasicBlock* eb; //todo: deprecate

  unsigned processed_bidx = 0;
  std::vector<const llvm::BasicBlock*> bb_vec; // index in this vector is the block id
  std::map< unsigned, std::vector<unsigned> > pred_idxs;
  std::vector< std::pair<unsigned,unsigned> > exits; //block_position,succ_no
  std::vector< unsigned > latches;

  std::map< const llvm::BasicBlock*, unsigned> block_to_id; // todo: deprecate

  std::map< unsigned, expr > block_to_path_bit;
  std::map< unsigned, std::vector<expr> > block_to_exit_bits;

  void print_formulas( unsigned print_from = 0, unsigned print_spec_from = 0);

  void insert_prev_idx( unsigned bidx, unsigned prev_bidx);
  std::vector<unsigned>& get_prev_idxs( unsigned bidx);

  unsigned find_block_idx( const llvm::BasicBlock* b);

  void add_latch( unsigned lidx  );

  void add_latch( const llvm::BasicBlock* latch  );

  void add_latches( std::vector<const llvm::BasicBlock*> latches  );

  void add_exit( unsigned lidx, unsigned succ_num  );

  void add_exit( const llvm::BasicBlock* exit, unsigned succ_num  );

  void add_exits( std::vector< std::pair< const llvm::BasicBlock*, unsigned > > es );

  void get_exit_block_positions( const llvm::BasicBlock* prev,
                                 std::vector<unsigned>& positions );

  expr get_path_bit( unsigned bidx );

  void set_path_bit( unsigned bidx, expr b );

  std::vector< expr >& get_exit_bits( unsigned bidx );

  expr get_exit_bit( unsigned bidx, unsigned succ_num );

  void set_exit_bits( unsigned bidx, std::vector<expr>& b );

  expr get_exit_branch_path( unsigned bidx, unsigned succ_num);

  void add_bmc_formulas(  std::vector< expr > fs );

  void add_spec( expr e, spec_reason_t reason, src_loc& );
  void add_spec( expr e, spec_reason_t reason );
  void add_spec( expr e );

  void setup_prevs_non_repeating();
  void copy_and_stich_segments( unsigned times );
  void copy_and_stich_segments( std::vector<const llvm::BasicBlock*>&,
                                std::map< unsigned, std::vector<unsigned> >&,
                                std::vector< std::pair<unsigned,unsigned> >&,
                                std::vector< unsigned >& latches,
                                unsigned times
                                );
  std::vector<expr> bmc_vec;  //final result;
  std::vector<spec> spec_vec; //specs from the code;
  std::vector<expr> quant_elim_vars;
  std::vector<llvm::Value*> quant_elim_val;

  // expr_tag subexpr_tags;

  std::set<std::string> locals;
  std::map< const llvm::Instruction*, std::string > dbg_name_map;

  std::map< const llvm::BasicBlock*, std::set<const llvm::BasicBlock*> >
  loop_ignore_edges, rev_loop_ignore_edges;

  bool ignore_edge( const llvm::BasicBlock* cb, const llvm::BasicBlock* prev);
  
  virtual ~bmc_ds() {}
};

class bmc_fun : public bmc_ds {

public:
  bmc_fun( options& o,
           std::map<const llvm::Instruction*, unsigned>& aim,
           std::vector<expr>& alv,
           memory_model& m_model)
    : bmc_ds( o, aim, alv, m_model) {}

  // Call sites
  std::vector<const llvm::CallInst*> call_sites;
  unsigned get_call_count( const llvm::CallInst* call );

  virtual ~bmc_fun() = default;
};

class loopdata;

class bmc_loop : public bmc_ds {

  loopdata* ld = 0;
public:
  bmc_loop( options& o,
            std::map<const llvm::Instruction*, unsigned>& aim,
            std::vector<expr>& alv,
            memory_model& m_model,
            loopdata* ld_ )
    : bmc_ds( o, aim, alv, m_model)
    , ld(ld_) {}

  loopdata* get_loopdata();

  // void collect_loop_back_edges(llvm::Loop*);
  virtual ~bmc_loop() = default;
};



#endif // TILER_BMC_DS_H
