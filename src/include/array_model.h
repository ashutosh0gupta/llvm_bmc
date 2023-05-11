#ifndef TILER_GLB_MODEL_H
#define TILER_GLB_MODEL_H

#include "include/options.h"
#include "include/solver.h"
#include "include/llvm_decls.h"

class arr_write_expr {
public:
  arr_write_expr();
  arr_write_expr( expr updated_expr_, expr size_bound_guard_, expr new_name_ ) : 
  updated_expr(updated_expr_), size_bound_guard(size_bound_guard_), new_name(new_name_) {

  }
  expr updated_expr;
  expr size_bound_guard;
  expr new_name; 
};

class arr_read_expr {
public:
  arr_read_expr();
  arr_read_expr( expr return_val_, expr size_bound_guard_ ) : 
  return_val(return_val_), size_bound_guard(size_bound_guard_) {

  }
  expr return_val;
  expr size_bound_guard;
};

class array_state{
public:

  // array_state( unsigned total_partitions ) {
  //   pm_state = new partition_model_state();
  // }
  array_state() {}

  //anything else is needed???
  std::vector<expr>& get_name_vec() { return array_index_names; };
  std::vector<expr>& get_M_name() {return M_name; };
private:
  std::vector<expr> array_index_names;
  std::vector<expr> M_name;
};

class array_model_full;
class single_array_model;
class multiple_array_model;
// class array_model_fixed_len; 
// class array_model_partition; 

class array_model{
public:
  array_model( options& o_ ) :
    o(o_), solver_ctx(o.solver_ctx) {}
std::map< unsigned, array_state > exit_ary_map;
  virtual expr join_array_state( std::vector<expr>&,
                         std::vector<unsigned>& prevs,
                         unsigned src ) = 0;
  virtual expr get_fresh_ary_name( unsigned ) = 0;

  array_state& get_state( unsigned b );
  void set_array_state( unsigned b, array_state& s );
  expr get_array_state_var( unsigned b, unsigned ith_ary );

private:
  options& o;
  solver_context& solver_ctx;
  array_model_t model = NONE;
  array_model_memory_arch memory_arch = NOT_DEFINED;
  //std::map< unsigned, array_state > exit_ary_map;

  friend single_array_model;
  friend multiple_array_model;
  friend array_model_full;
};

class array_model_full : public array_model {

public:
  array_model_full( options& o ) : array_model(o) {
    model = FULL;
  }
  
  //Virtuals
  virtual void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access, std::map< unsigned, unsigned >& array_start_add ) = 0;
  virtual arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val ) = 0;
  virtual arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& ) = 0;
  virtual void init_state( unsigned ) = 0;
  virtual void init_state( unsigned eb, array_state& s ) = 0;
  virtual void copy_to_init_state( array_state& ) = 0;

  //Setter
  void set_array_info(std::map< const llvm::Value*, unsigned >& ary_id);
  void set_array_length( unsigned, std::vector<expr>& len );
  void update_names( unsigned, std::vector<const llvm::Instruction*>&);
  void update_name( unsigned, unsigned );
  void set_num_arrays(unsigned);
  
  //Getter
  unsigned get_num_arrays();
  unsigned get_accessed_array( const llvm::Instruction* I );
  sort get_address_sort();
  sort get_solver_array_ty( const llvm::ArrayType* ty );
  sort get_solver_array_ty( const llvm::PointerType* ty );
  std::vector< std::vector<expr> > get_array_lengths();
  std::vector< std::string > get_array_names();
  std::vector< sort > get_array_sorts();
  std::vector<expr> get_array_length( const llvm::Value* arr );
  void get_array_length( const llvm::ArrayType*, std::vector<expr>&);


  //Debug
  void dump_ary_access_to_index();

  //Misc
  expr access_bound_cons( exprs& , exprs& );
  expr get_fresh_ary_name( unsigned );

  // Data members
  unsigned num_arrays;
  std::vector< std::vector<expr> > lengths;
  std::vector< std::string > ar_names;
  std::vector< sort > ar_sorts;
  std::map< const llvm::Instruction*, unsigned > ary_access_to_index;

};

class single_array_model : public array_model_full {
public:
  single_array_model( options& o ) : array_model_full(o) {
    memory_arch = SINGLE; 
  }

  inline
  void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access,
   std::map< unsigned, unsigned >& array_start_add ) {
    ary_access_to_index = array_access;
    ar_bases = array_start_add;
  };

  //Virtual defined
  arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val );
  arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& );
  expr join_array_state( std::vector<expr>&,std::vector<unsigned>& prevs,unsigned src );

  //Overridden functions
  void init_state( unsigned );
  void init_state( unsigned eb, array_state& s );
  void copy_to_init_state( array_state& );

  std::string M_array_name =  "M";
  std::map< unsigned, unsigned > ar_bases;

};

class multiple_array_model : public array_model_full {
public:
  multiple_array_model( options& o ) : array_model_full(o) {
    memory_arch = MULTIPLE;
  }

  inline
  void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access,
   std::map< unsigned, unsigned >& array_start_add ) {
    ary_access_to_index = array_access;
  };

  //Virtual defined
  arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val );
  arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& );
  expr join_array_state( std::vector<expr>&,std::vector<unsigned>& prevs,unsigned src );

  //Misc
  void init_state( unsigned );
  void init_state( unsigned eb, array_state& s );
  void copy_to_init_state( array_state& );
};




#endif // TILER_GLB_MODEL_H
