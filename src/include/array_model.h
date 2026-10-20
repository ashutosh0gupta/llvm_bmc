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
  std::vector<expr>& get_MR_name() {return MR_name; };
private:
  std::vector<expr> array_index_names;
  std::vector<expr> M_name;
  std::vector<expr> MR_name;
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
  // virtual void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access, std::map< unsigned, unsigned >& array_start_add ) = 0;
  // virtual void set_access_map(std::map< const llvm::Instruction*, unsigned >& array_access, std::map< unsigned, unsigned >& array_start_add, std::map< unsigned, unsigned >& array_slot_cells) = 0;
  virtual void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access, std::map< unsigned, unsigned >& array_start_add, std::map< unsigned, unsigned >& array_slot_cells, std::set< unsigned >& array_cell_indexed ) = 0;
  virtual arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val ) = 0;
  virtual arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& ) = 0;
  virtual arr_read_expr array_read( unsigned bidx, const llvm::ExtractValueInst* I, exprs& ) = 0;
  virtual arr_write_expr array_write_id(unsigned bidx, unsigned ary, exprs& idx, expr& val) = 0;
  virtual arr_read_expr array_read_id(unsigned bidx, unsigned ary, exprs&, const llvm::Type* ty) = 0;
  virtual bool has_bulk_update() { return false; }
  virtual unsigned object_base( unsigned ary );
  virtual arr_read_expr array_read_base( unsigned bidx,
                                         std::vector<unsigned>& ids,
                                         exprs& idxs, const llvm::Type* ty,
                                         expr& base );
  virtual arr_write_expr array_fill_id( unsigned bidx, unsigned ary,
                                        exprs& first, exprs& last, expr& val,
                                        uint64_t elems );
  virtual arr_write_expr array_copy_id( unsigned bidx,
                                        unsigned dst, exprs& dfirst, exprs& dlast,
                                        unsigned src, exprs& sfirst, exprs& slast,
                                        uint64_t elems );
  virtual arr_write_expr array_fill_cells( unsigned bidx, unsigned ary,
                                           expr& off, expr& cells,
                                           expr& cell_val );
  virtual arr_write_expr array_copy_cells( unsigned bidx,
                                           unsigned dst, expr& doff,
                                           unsigned src, expr& soff,
                                           expr& cells );
  virtual void init_state( unsigned ) = 0;
  virtual void init_state( unsigned eb, array_state& s ) = 0;
  virtual void copy_to_init_state( array_state& ) = 0;

  //Setter
  void set_array_info(std::map< const llvm::Value*, unsigned >& ary_id);
  void set_array_length( unsigned, std::vector<expr>& len );
  void update_names( unsigned, std::vector<const llvm::Instruction*>&);
  void update_name( unsigned, unsigned );
  void set_num_arrays(unsigned);
  void set_debug_map(std::map<const llvm::Value*,const llvm::Instruction*>* dmap_);

  //Getter
  unsigned get_num_arrays();
  unsigned get_accessed_array( const llvm::Instruction* I );
  sort get_address_sort();
  sort get_data_sort();
  sort get_real_data_sort();
  sort get_solver_array_ty( const llvm::ArrayType* ty );
  sort get_solver_array_ty( const llvm::PointerType* ty );
  std::vector< std::vector<expr> > get_array_lengths();
  std::vector< std::string > get_array_names();
  std::vector< sort > get_array_sorts();
  std::vector<expr> get_array_length( const llvm::Value* arr );
  void get_array_length( const llvm::ArrayType*, std::vector<expr>&);
  sort get_solver_array_ty( const llvm::Type* ty );

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
  std::map<const llvm::Value*,const llvm::Instruction*>* debug_map;
  // std::string initial_mem="",final_mem="";
  std::string initial_mem="";
  std::vector<expr> final_mem_vec;
  void set_final_mem( expr& e ) {
    final_mem_vec.clear();
    final_mem_vec.push_back( e );
  }
  std::string final_mem() {
    return final_mem_vec.empty() ? "" : final_mem_vec.back().to_string();
  }
  bool is_initial_mem=true;
};

class single_array_model : public array_model_full {
public:
  single_array_model( options& o ) : array_model_full(o) {
    memory_arch = SINGLE; 
  }

  inline
  void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access,
   // std::map< unsigned, unsigned >& array_start_add ) {
   std::map< unsigned, unsigned >& array_start_add,
   // std::map< unsigned, unsigned >& array_slot_cells) {
   std::map< unsigned, unsigned >& array_slot_cells,
   std::set< unsigned >& array_cell_indexed ) {
    ary_access_to_index = array_access;
    ar_bases = array_start_add;
    ar_slot_cells = array_slot_cells;
    ar_cell_indexed = array_cell_indexed;
  };

  //Virtual defined
  arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val );
  arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& );
  arr_read_expr array_read( unsigned bidx, const llvm::ExtractValueInst* I, exprs& );
  arr_write_expr array_write_id(unsigned bidx, unsigned ary, exprs& idx, expr& val);
  arr_read_expr array_read_id(unsigned bidx, unsigned ary, exprs&, const llvm::Type* ty);
  expr join_array_state( std::vector<expr>&,std::vector<unsigned>& prevs,unsigned src );

  //Overridden functions
  void init_state( unsigned );
  void init_state( unsigned eb, array_state& s );
  void copy_to_init_state( array_state& );

  //Misc
  unsigned get_slot_cells(unsigned ary);
  bool cell_unit_index( unsigned ary );
  expr slot_address(unsigned ary, exprs& idxs, exprs& ls);
  expr slot_address( unsigned ary, exprs& idxs, exprs& ls, expr& base );
  unsigned object_base( unsigned ary );
  unsigned common_shape( std::vector<unsigned>& ids );
  arr_read_expr array_read_base( unsigned bidx, std::vector<unsigned>& ids,
                                 exprs& idxs, const llvm::Type* ty,
                                 expr& base );
  arr_read_expr read_at( unsigned bidx, unsigned ary, expr& addr,
                         const llvm::Type* ty, exprs& idxs, exprs& ls,
                         expr bound_guard );
  expr last_cell_in_bound( exprs& idxs, exprs& ls, unsigned n );
  bool has_bulk_update();
  arr_write_expr array_fill_id( unsigned bidx, unsigned ary, exprs& first,
                                exprs& last, expr& val, uint64_t elems );
  arr_write_expr array_copy_id( unsigned bidx,
                                unsigned dst, exprs& dfirst, exprs& dlast,
                                unsigned src, exprs& sfirst, exprs& slast,
                                uint64_t elems );
  arr_write_expr array_fill_cells( unsigned bidx, unsigned ary, expr& off,
                                   expr& cells, expr& cell_val );
  arr_write_expr array_copy_cells( unsigned bidx, unsigned dst, expr& doff,
                                   unsigned src, expr& soff, expr& cells );
  expr cell_run_address( unsigned ary, expr& off );
  expr cell_run_in_bound( unsigned ary, expr& off, expr& cells );
  expr in_cell_run( expr& k, expr& addr, uint64_t cells );
  expr in_cell_run( expr& k, expr& addr, expr& cells );
  expr uniform_cell( expr& val );
  expr start_new_memory( unsigned bidx, expr& old_name );
  expr cell_address(expr& addr, unsigned k);
  expr value_to_bits(expr& val);
  expr bits_to_value(expr& bits, const llvm::Type* ty);

  std::string M_array_name =  "M";
  std::map< unsigned, unsigned > ar_bases;
  std::map< unsigned, unsigned > ar_slot_cells;
  std::set< unsigned > ar_cell_indexed;

};

class multiple_array_model : public array_model_full {
public:
  multiple_array_model( options& o ) : array_model_full(o) {
    memory_arch = MULTIPLE;
  }

  inline
  void set_access_map( std::map< const llvm::Instruction*, unsigned >& array_access,
   // std::map< unsigned, unsigned >& array_start_add ) {
   std::map< unsigned, unsigned >& array_start_add,
   // std::map< unsigned, unsigned >& array_slot_cells) {
   std::map< unsigned, unsigned >& array_slot_cells,
   std::set< unsigned >& array_cell_indexed ) {
    ary_access_to_index = array_access;
  };

  //Virtual defined
  arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val );
  arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& );
  arr_read_expr array_read( unsigned bidx, const llvm::ExtractValueInst* I, exprs& );
  arr_write_expr array_write_id(unsigned bidx, unsigned ary, exprs& idx, expr& val);
  arr_read_expr array_read_id(unsigned bidx, unsigned ary, exprs&, const llvm::Type* ty);
  expr join_array_state( std::vector<expr>&,std::vector<unsigned>& prevs,unsigned src );

  //Misc
  void init_state( unsigned );
  void init_state( unsigned eb, array_state& s );
  void copy_to_init_state( array_state& );
};


// class heap_model : public array_model_full {
// public:
//   heap_model( options& o ) : array_model_full(o) {
//     memory_arch = HEAP;
//   }

//   inline
//   void set_access_map( std::map< const llvm::Instruction*, unsigned >& heap_access,
//                        std::map< unsigned, unsigned >& heap_bases_ ) {
//     ary_access_to_index = heap_access;
//     ar_bases = heap_bases_;
//   };

//   //Virtual defined
//   arr_write_expr array_write( unsigned bidx, const llvm::StoreInst* I, exprs& idx, expr& val );
//   arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& );
//   arr_read_expr array_read( unsigned bidx, const llvm::ExtractValueInst* I, exprs& );
//   expr join_array_state( std::vector<expr>&,std::vector<unsigned>& prevs,unsigned src );

//   //Overridden functions
//   void init_state( unsigned );
//   void init_state( unsigned eb, array_state& s );
//   void copy_to_init_state( array_state& );

//   std::string M_array_name =  "H";
//   std::map< unsigned, unsigned > ar_bases;
// };



#endif // TILER_GLB_MODEL_H
