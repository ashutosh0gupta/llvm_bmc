#include "value_expr_map.h"

#include<lib/utils/llvm_utils.h>

//----------------------------------------------------------------------
// value_expr_map

void value_expr_map::insert_term_map( const llvm::Value* op, z3::expr e ) {
  auto it = versions.find(op);
  if( it == versions.end() ) {
    insert_term_map( op, 0, e );
  }else{
    insert_term_map( op, (it->second).back() + 1, e );
  }
}

void value_expr_map::insert_term_map( const llvm::Value* op, unsigned c_count,
                                      z3::expr e ) {
  auto it = versions.find(op);
  if( it == versions.end() ) {
    // assert( c_count == 0 );
  }else{
    assert( (it->second).back() < c_count);
  }
  versions[op].push_back( c_count );
  auto pair = std::make_pair( std::make_pair( op, c_count ), e );
  vmap.insert( pair );
}

//insert_new_def with 2 param is alias of get_term
z3::expr value_expr_map::insert_new_def( const llvm::Value* op,
                                         unsigned c_count ) {
  return get_term( op, c_count );
}

z3::expr value_expr_map::insert_new_def( const llvm::Value* op ) {
  unsigned count = versions.find(op) == versions.end() ? 0 : versions[op].back() + 1;
  return insert_new_def( op, count );
}

z3::expr value_expr_map::get_term( const llvm::Value* op ) {
  z3::expr c = read_constant( op );
  if( c ) return c;
  auto it = versions.find(op);
  if( it == versions.end() ) {
    // llvm_bmc_error("bmc", "call insert_new_def instead of get_term !!");
    return get_term( op, 0 );
  }else{
    return get_term(op, (it->second).back() );
  }
}

z3::expr value_expr_map::get_term( const llvm::Value* op, unsigned c_count ) {
  z3::expr e = read_term( op, c_count );
  if( e ) return e;
  // create new name
  z3::expr name = create_fresh_name( op );
  insert_term_map( op, c_count, name );
  return name;
}

z3::expr
value_expr_map::get_earlier_term( const llvm::Value* op, unsigned c_count ) {
  z3::expr c = read_constant( op );
  if( c ) return c;
  auto it = versions.find(op);
  if( it != versions.end() ) {
    auto vs = it->second;
    unsigned i = vs.size();
    while( i > 0  ) {
      i--;
      if( vs[i] <= c_count ) {
        c_count = vs[i];
        break;
      }
    }
    return read_term( op, c_count);
  }
}

z3::expr value_expr_map::create_fresh_name( const llvm::Value* op  ) {
  llvm::Type* ty = op->getType();
  if( auto i_ty = llvm::dyn_cast<llvm::IntegerType>(ty) ) {
    int bw = i_ty->getBitWidth();
    if(bw == 32 || bw == 64 ) {
      z3::expr i =  get_fresh_int(ctx, op->getName().str());
      return i;
    }else if(bw == 1 || bw == 8) {
      z3::expr bit =  get_fresh_bool(ctx, op->getName().str());
      return bit;
    }
  }
  ty->print( llvm::errs() ); llvm::errs() << "\n";
  llvm_bmc_error("llvm_utils", "unsupported type!!");
  z3::expr e(ctx);
  return e;
}

z3::expr value_expr_map::read_term( const llvm::Value* op, unsigned c_count ) {
  auto it = vmap.find( {op,c_count} );
  if( it != vmap.end() ) {
    return it->second;
  }else{
    z3::expr e(ctx);
    return e; // contains no expression;
  }
}

z3::expr value_expr_map::read_constant( const llvm::Value* op ) {
  return read_const(op, ctx);
}

unsigned value_expr_map::get_max_version( const llvm::Value* op ) {
  z3::expr c = read_constant( op );
  if( c ) return 0;
  auto it = versions.find(op);
  if( it == versions.end() ) {
    // llvm_bmc_error("bmc", "call insert_new_def instead of get_term !!");
    return 0;
  }else{
    return (it->second).back();
  }
}

const std::vector<unsigned>&
value_expr_map::get_versions( const llvm::Value* op ) {
  z3::expr c = read_constant( op );
  if( c ) return dummy_empty_versions;
  auto it = versions.find(op);
  if( it == versions.end() ) {
    // llvm_bmc_error("bmc", "call insert_new_def instead of get_term !!");
    return dummy_empty_versions;
  }else{
    return (it->second);
  }
}

// todo: violates invaiant of the system of multiple copies
void value_expr_map::copy_values(value_expr_map& m) {
  for(auto it = vmap.begin(); it != vmap.end(); ++it) {
    m.insert_term_map(it->first.first, it->first.second, it->second);
  }
}

void value_expr_map::print( std::ostream& o ) {
  for(auto it = vmap.begin(); it != vmap.end(); ++it) {
    const llvm::Value* I = it->first.first;
    unsigned version = it->first.second;
    z3::expr val = it->second;
    //    I->dump();
    o << I << " " << version << "~~>" << val << "\n";
  }
}

inline void value_expr_map::dump() {
  print( std::cout );
}
