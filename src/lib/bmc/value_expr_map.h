#ifndef VALUE_EXPR_UTILS_H
#define VALUE_EXPR_MAP_H

#include "lib/utils/utils.h"

namespace z3 { class expr; class context; }
namespace llvm { class Value; }

class value_expr_map {
public:
  value_expr_map( z3::context& ctx_ ) : ctx( ctx_ ) {};
  void insert_term_map( const llvm::Value*, unsigned, z3::expr );
  void insert_term_map( const llvm::Value*, z3::expr );
  z3::expr insert_new_def( const llvm::Value* op, unsigned c_count );
  z3::expr insert_new_def( const llvm::Value* );
  z3::expr read_constant( const llvm::Value* );
  z3::expr read_term( const llvm::Value*, unsigned );
  z3::expr get_earlier_term( const llvm::Value*, unsigned );
  z3::expr get_term( const llvm::Value*, unsigned );
  z3::expr get_term( const llvm::Value* op );
  z3::expr get_latest_term( const llvm::Value* );
  z3::expr create_fresh_name( const llvm::Value*  );
  unsigned get_max_version( const llvm::Value*);
  const std::vector<unsigned>& get_versions( const llvm::Value* );
  void copy_values(value_expr_map& m);
  void dump();
  void print( std::ostream& o );
private:
  z3::context& ctx;
  std::map< std::pair<const llvm::Value*,unsigned>, z3::expr > vmap;
  std::map< const llvm::Value*, std::vector<unsigned> > versions;
  std::vector<unsigned> dummy_empty_versions;
};

#endif
