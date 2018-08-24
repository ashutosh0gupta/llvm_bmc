#ifndef VALUE_EXPR_UTILS_H
#define VALUE_EXPR_MAP_H

#include "lib/utils/utils.h"
#include "lib/utils/z3_utils.h"

namespace llvm { class Value; }

class value_expr_map {
public:
  value_expr_map( solver_context& ctx_ ) : ctx( ctx_ ) {};
  void insert_term_map( const llvm::Value*, unsigned, expr );
  void insert_term_map( const llvm::Value*, expr );
  expr insert_new_def( const llvm::Value* op, unsigned c_count );
  expr insert_new_def( const llvm::Value* );
  expr read_constant( const llvm::Value* );
  expr read_term( const llvm::Value*, unsigned );
  expr get_earlier_term( const llvm::Value*, unsigned );
  expr get_term( const llvm::Value*, unsigned );
  expr get_term( const llvm::Value* op );
  expr get_latest_term( const llvm::Value* );
  expr create_fresh_name( const llvm::Value*  );
  unsigned get_max_version( const llvm::Value*);
  const std::vector<unsigned>& get_versions( const llvm::Value* );
  void copy_values(value_expr_map& m);
  void dump();
  void print( std::ostream& o );
private:
  solver_context& ctx;
  std::map< std::pair<const llvm::Value*,unsigned>, expr > vmap;
  std::map< const llvm::Value*, std::vector<unsigned> > versions;
  std::vector<unsigned> dummy_empty_versions;
};

#endif