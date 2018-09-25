#include "include/heap_model.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/solver_utils.h"


array_state& array_model::get_state( unsigned b ) {
  return exit_ary_map.at(b);
}
void array_model::set_array_state( unsigned b, array_state& s ) {
  exit_ary_map[b] = s;
}

expr array_model::get_array_state_var( unsigned b, unsigned ith_ary ) {
  return exit_ary_map.at(b).get_name_vec()[ith_ary];
}

expr array_model::join_array_state( std::vector<expr>& conds,
                                        std::vector<unsigned>& prevs,
                                        unsigned src
                                        ) {
  assert( conds.size() > 0  &&  prevs.size() == conds.size() );
  auto& s_names = exit_ary_map[src].get_name_vec(); // fresh state created
  unsigned ar_size = exit_ary_map.at(prevs.at(0)).get_name_vec().size();
  std::vector<expr> vec;
  for( unsigned j=0; j < ar_size; j++ ) {
    //check if all equal
    auto& o_name = exit_ary_map.at(prevs.at(0)).get_name_vec().at(j);
    bool is_all_equal = true;
    for( unsigned i=1; i < conds.size(); i++ ) {
      auto& next_name = exit_ary_map.at(prevs.at(i)).get_name_vec().at(j);
      if( !is_equal( o_name, next_name) ) {
        is_all_equal = false;
        break;
      }
    }
    if( is_all_equal ) {
      // if all symbols are euqal; no need to join.
      s_names.push_back( o_name );
    }else{
      expr new_name = get_fresh_ary_name(j);
      for( unsigned i=0; i < conds.size(); i++ ) {
        auto& p_st = exit_ary_map.at(prevs.at(i)).get_name_vec();
        vec.push_back( implies( conds[i], new_name == p_st.at(j) ) );
      }
      s_names.push_back( new_name );
    }
  }
  return _and( vec, solver_ctx );
}


void array_model_full::set_array_num( unsigned len ) {
  num_arrays = len;
  for( unsigned i = 0; i < num_arrays; i++) {
    ar_sorts.push_back( solver_ctx.array_sort( solver_ctx.int_sort(),
                                               solver_ctx.int_sort() ) );
  }
}

expr array_model_full::get_fresh_ary_name( unsigned i ) {
  sort ar_sort = ar_sorts.at(i);
  if( !ar_sort.is_array() ) {
    llvm_bmc_error( "bmc", "bad sort is passed!!" );
  }
  auto ar = get_fresh_const( solver_ctx, ar_sort, "arr" );
  return ar;
}

void array_model_full::init_state( unsigned eb ) {
  array_state& s = exit_ary_map[eb];
  auto& vec = s.get_name_vec();
  vec.clear();
  for( unsigned i = 0; i < num_arrays; i++) {
    vec.push_back( get_fresh_ary_name( i ) );
  }
}

void array_model_full::init_state( unsigned eb, array_state& s ) {
  if( s.get_name_vec().size() == 0 )
    init_state(eb);
  else
    exit_ary_map[eb] = s;
}

void array_model_full::copy_to_init_state( array_state& in ) {
  array_state& s = exit_ary_map.at(0);
  auto& vec = s.get_name_vec();

  auto& in_vec = in.get_name_vec();
  for( unsigned i = 0; i < num_arrays; i++) {
    vec[i] = in_vec.at(i);
  }
}

arr_write_expr
array_model_full::array_write( unsigned bidx, const llvm::StoreInst* I,
                               expr& idx, expr& val ) {
  array_state& ar_st = get_state( bidx );
  auto i = ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  expr new_ar = get_fresh_ary_name(i);
  vec[i] = new_ar;
  expr lower_bound_arr(idx >= 0);
  expr upper_bound_arr(idx <= (get_lengths_vec().at(i) - 1));
  std::vector<expr> temp_vec;
  temp_vec.push_back(lower_bound_arr);
  temp_vec.push_back(upper_bound_arr);
  expr bound_guard = _and(temp_vec);
  return arr_write_expr( (new_ar == store( ar_name, idx, val )), bound_guard, new_ar );
}

arr_read_expr
array_model_full::array_read( unsigned bidx, const llvm::LoadInst* I,
                              expr& idx ) {
  array_state& ar_st = get_state( bidx );
  auto i = ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  expr lower_bound_arr(idx >= 0);
  expr upper_bound_arr(idx <= (get_lengths_vec().at(i) - 1));
  std::vector<expr> temp_vec;
  temp_vec.push_back(lower_bound_arr);
  temp_vec.push_back(upper_bound_arr);
  expr bound_guard = _and(temp_vec);
  return arr_read_expr( select( ar_name, idx), bound_guard );
}

void array_model_full::
update_names( unsigned eb,
              std::vector<const llvm::Instruction*>& arrays_updated ) {
  array_state& s = exit_ary_map.at(eb);
  auto& vec = s.get_name_vec();
  for( auto I : arrays_updated) {
    auto i = ary_access_to_index.at(&(*I));
    expr new_ar = get_fresh_ary_name(i);
    vec[i] = new_ar;
    //vec[i] = get_fresh_ary_name(i);
  }
}

void array_model_full::update_name( unsigned eb, unsigned i) {
  array_state& s = exit_ary_map.at(eb);
  auto& vec = s.get_name_vec();
  expr new_ar = get_fresh_ary_name(i);
  vec[i] = new_ar;
}

//=======================================================================

expr array_model_fixed_len::get_fresh_ary_name( unsigned i ) {
  return get_fresh_int(solver_ctx);
}

void array_model_fixed_len::init_state( unsigned //const bb*
                                        eb ) {
  array_state& s = exit_ary_map[eb];
  auto& vec = s.get_name_vec();
  vec.clear();
  for( unsigned i = 0; i < num_partition; i++) {
    vec.push_back( get_fresh_int(solver_ctx) );
  }
}

arr_write_expr array_model_fixed_len::array_write( unsigned bidx,
                                    const llvm::StoreInst* I,
                                    expr& idx,
                                    expr& val ) {
  llvm_bmc_error( "bmc", "stub!!" );
  arr_write_expr ret;
  return ret;
}

arr_read_expr array_model_fixed_len::array_read( unsigned bidx,
                                            const llvm::LoadInst* I,
                                            expr& idx) {
  llvm_bmc_error( "bmc", "stub!!" );
  arr_read_expr ret;
  return ret;
}

// array_state&
// array_model_fixed_len::join_array_state(std::vector<const bb*> prevs,
//                                         const bb* b ) {
//   exit_ary_map[b];
//   array_state& st = exit_ary_map.at(b); // tobe added

//   return st;
// }
