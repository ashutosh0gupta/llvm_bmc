#include "include/value_expr_map.h"

#include "lib/utils/utils.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/solver_utils.h"

//----------------------------------------------------------------------
// value_expr_map

void value_expr_map::insert_term_map( const llvm::Value* op, expr e ) {
  assert( op );
  auto it = versions.find(op);
  if( it == versions.end() ) {
    insert_term_map( op, 0, e );
  }else{
    insert_term_map( op, (it->second).back() + 1, e );
  }
}

void value_expr_map::insert_term_map( const llvm::Value* op, unsigned c_count,
                                      expr e ) {
  assert( op );
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
expr value_expr_map::insert_new_def( const llvm::Value* op, unsigned cnt ) {
  assert( op );
  return get_term( op, cnt );
}

expr value_expr_map::insert_new_def( const llvm::Value* op ) {
  assert( op );
  auto it = versions.find(op);
  unsigned count = ( it == versions.end() ) ? 0 : versions[op].back() + 1;
  return insert_new_def( op, count );
}

expr value_expr_map::get_term( const llvm::Value* op ) {
  assert( op );
  expr c = read_constant( op );
  if( c ) return c;
  auto it = versions.find(op);
  if( it == versions.end() ) {
    // llvm_bmc_error("bmc", "call insert_new_def instead of get_term !!");
    return get_term( op, 0 );
  }else{
    return get_term(op, (it->second).back() );
  }
}

expr value_expr_map::get_term( const llvm::Value* op, unsigned c_count ) {
  assert( op );
  expr e = read_term( op, c_count );
  if( e ) return e;
  // create new name
  expr name = create_fresh_name( op );
  insert_term_map( op, c_count, name );
  return name;
}

expr
value_expr_map::get_earlier_term( const llvm::Value* op, unsigned c_count ) {
  assert( op );
  expr c = read_constant( op );
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

expr value_expr_map::create_fresh_name( const llvm::Value* op  ) {
  assert( op );
  llvm::Type* ty = op->getType();
  if( auto i_ty = llvm::dyn_cast<llvm::IntegerType>(ty) ) {
    if( o.bit_precise ) {
      unsigned bw = (unsigned)i_ty->getBitWidth();
      return get_fresh_bv( ctx, bw, op->getName().str() );
    }else{
      int bw = i_ty->getBitWidth();
      if(bw == 32 || bw == 64 ) {
        expr i =  get_fresh_int(ctx, op->getName().str());
        return i;
      }else if(bw == 1 || bw == 8) {
        expr bit =  get_fresh_bool(ctx, op->getName().str());
        return bit;
      }
    }
  }else{
    if( o.bit_precise ) {
      sort s = llvm_to_sort( o, op->getType() );
      return get_fresh_const( ctx, s, op->getName().str() );
    }
  }
  ty->print( llvm::errs() ); llvm::errs() << "\n";
  llvm_bmc_error("llvm_utils", "unsupported type!!");
  expr e(ctx);
  return e;
}

expr value_expr_map::read_term( const llvm::Value* op, unsigned c_count ) {
  assert( op );
  auto it = vmap.find( {op,c_count} );
  if( it != vmap.end() ) {
    return it->second;
  }else{
    expr e(ctx);
    return e; // contains no expression;
  }
}

expr value_expr_map::read_constant( const llvm::Value* op ) {
  assert( op );
  return read_const(o, op);
}

unsigned value_expr_map::get_max_version( const llvm::Value* op ) {
  assert( op );
  expr c = read_constant( op );
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
  assert( op );
  expr c = read_constant( op );
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
    expr val = it->second;
    //    I->dump();
    o << I << " " << version << "~~>" << val << "\n";
  }
}

void value_expr_map::dump() {
  print( std::cout );
}
