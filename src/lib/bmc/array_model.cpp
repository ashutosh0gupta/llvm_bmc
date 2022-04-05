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

//---------------------------------------------------------------
// collect info about the arrays

sort array_model_full::get_address_sort() {
  return solver_ctx.int_sort();
}

sort array_model_full::get_solver_array_ty( const llvm::ArrayType* ty ) {
  return llvm_to_sort( o, ty);
  // auto elemTy = ty->getArrayElementType();
  // auto s  = llvm_to_sort( o, elemTy );
  // return solver_ctx.array_sort( get_address_sort(ty), s );
}

sort array_model_full::get_solver_array_ty( const llvm::PointerType* ty ) {
  auto T = ty->getPointerElementType();
  if( auto ar_ty = llvm::dyn_cast<llvm::ArrayType>(T)){
    return get_solver_array_ty( ar_ty );
  }else if( auto pty = llvm::dyn_cast<llvm::PointerType>(T) ) {
    assert(false); //todo: fix it when hit it.
    return get_solver_array_ty( pty );
  }else{
    auto e_sort= llvm_to_sort( o, T);
    return solver_ctx.array_sort( get_address_sort(), e_sort );
  }
}

void
array_model_full::
get_array_length( const llvm::ArrayType* a1, std::vector<expr>& lengths) {
  int n1 = a1->getNumElements();
  if(o.bit_precise ) {
    lengths.push_back( solver_ctx.bv_val(n1, 64) ); // todo: why 64?
  }else{
    lengths.push_back( solver_ctx.int_val(n1) );
  }
  auto T2 = a1->getElementType();
  if( auto a2 = llvm::dyn_cast<llvm::ArrayType>(T2) ){
    get_array_length( a2, lengths );
  }
}

std::vector<expr>
array_model_full::get_array_length( const llvm::Value* arr ) {
  std::vector<expr> idxs;
  if( llvm::isa< const llvm::AllocaInst >(arr) ) {
    // since we can know symbol for the length of the array
    // at the time of translatation we place a dummy
    idxs.push_back( solver_ctx.int_val(1) );
    return idxs;
  }
  if( auto pty = llvm::dyn_cast<llvm::PointerType>(arr->getType()) ) {
    auto T1 = pty->getPointerElementType();
    if( auto a1 = llvm::dyn_cast<llvm::ArrayType>(T1)) {
      get_array_length( a1, idxs );
    }
    // if( auto a1 = llvm::dyn_cast<llvm::ArrayType>(T1)) {
    //   int n1 = a1->getNumElements();
    //   idxs.push_back( solver_ctx.int_val(n1) );
    //   auto T2 = a1->getElementType();
    //   if( auto a2 = llvm::dyn_cast<llvm::ArrayType>(T2)){
    //     int n2 = a2->getNumElements();
    //     idxs.push_back( solver_ctx.int_val(n2) );
    //     // std::cout << "Dim1 of array is " << n1 << "\n";
    //     // std::cout << "Dim2 of array is " << n2 << "\n";
    //   }
    // }
  }
  return idxs;
}

void array_model_full::set_array_length( unsigned ar_num, std::vector<expr>& len ) {
  lengths[ar_num] = len;
}

void array_model_full::
set_array_info(std::map< const llvm::Value*, unsigned >& ary_ids) {
  num_arrays = ary_ids.size();
  std::vector<const llvm::Type*> ar_types;
  ar_types.resize( num_arrays );
  ar_names.resize( num_arrays );
  lengths.clear();

  // inserting dummy lengths
  std::vector<expr> idxs;
  for( unsigned i = 0; i < num_arrays; i++ ) {
    lengths.push_back( idxs );
  }

  //
  for( auto& ar_int_pair : ary_ids ) {
    auto ar = ar_int_pair.first;
    auto indx = ar_int_pair.second;
    ar_types[indx] = ar->getType();
    ar_names[indx] = ar->getName();
    lengths[indx] = get_array_length( ar );
  }
  for( unsigned i = 0; i < num_arrays; i++) {
    if( auto pty = llvm::dyn_cast<llvm::PointerType>(ar_types[i]) ) {
      ar_sorts.push_back( get_solver_array_ty( pty ) );
    } else {
      //todo: why this path??
      ar_sorts.push_back( solver_ctx.array_sort( get_address_sort(),
                                                 solver_ctx.int_sort() ) );
    }
  }
}

//-----------------------------------------------------------------------


expr array_model_full::get_fresh_ary_name( unsigned i ) {
  sort ar_sort = ar_sorts.at(i);
  if( !ar_sort.is_array() ) {
    llvm_bmc_error( "bmc", "bad sort is passed!!" );
  }
  auto ar = get_fresh_const( solver_ctx, ar_sort, "arr_"+ar_names[i] );
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


unsigned array_model_full::get_accessed_array( const llvm::Instruction* I ) {
  try{
    return ary_access_to_index.at(I);
  }catch(...){
    dump_ary_access_to_index();
    llvm_bmc_error( "array model full", "array for the access not found")
  }
}


expr array_model_full::access_bound_cons( exprs& idxs, exprs& ls) {
  // auto s1 = idxs.size(); auto s2 = ls.size();
  // std::cout << "idxs.size is " << s1 << " ls.size is " << s2 << "\n";
  // assert( idxs.size() >= ls.size() );
  if( idxs.size() < ls.size() ) {
    assert( false );
  }
  //todo : HACK!!! removing dummy accesses at the end.
  //       check if it is a correct fix
  while( idxs.size() != ls.size() ){
    idxs.pop_back();
  }
  // bounds constraints
  std::vector<expr> temp_vec;
  unsigned pos = 0;
  for( auto& l : ls ) {
    expr idx = idxs[pos];
    if( o.bit_precise ) {
      expr zero = solver_ctx.bv_val(0,idx.get_sort().bv_size());
      expr lower_bound_arr( idx >= zero );
      temp_vec.push_back(lower_bound_arr);
      expr upper_bound_arr( !(idx >= l) );
      temp_vec.push_back(upper_bound_arr);

      // sort s1 = idx.get_sort(); sort s2 = l.get_sort();
      // std::cout << "idx sort is " << s1 << " l sort is " << s2 << "\n";
      // if (s1.is_bv()) {
      //   expr zero = solver_ctx.bv_val(0,idx.get_sort().bv_size());
      //   expr lower_bound_arr( idx >= zero );
      //   temp_vec.push_back(lower_bound_arr);
      //   expr upper_bound_arr( !(idx >= l) );
      //   temp_vec.push_back(upper_bound_arr);
      // }
      // else {
      //   expr idxn = idx;
      //   if( s1.is_int() ) {
      //    idxn = idx.ctx().bv_val(idx,64);
      //   }        
      //   expr lower_bound_arr( idxn >= 0 );
      //   temp_vec.push_back(lower_bound_arr);
      //   expr l_bv = solver_ctx.bv_val(l,64);
      //   expr upper_bound_arr( !(idxn >= l_bv) );
      //   temp_vec.push_back(upper_bound_arr);
      //   idxs[pos] = idxn;
      // }

    } else {
	expr lower_bound_arr(idx >= 0);
    	temp_vec.push_back(lower_bound_arr);
    	expr upper_bound_arr(idx <= l - 1);
    	temp_vec.push_back(upper_bound_arr);
    }
    pos++;
  }
  expr bound_guard = _and(temp_vec);
  return bound_guard;
}

arr_write_expr
array_model_full::array_write( unsigned bidx, const llvm::StoreInst* I,
                               exprs& idxs, expr& val ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  expr new_ar = get_fresh_ary_name(i);
  vec[i] = new_ar;

  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);

  // // bounds constraints
  // std::vector<expr> temp_vec;
  // expr lower_bound_arr(idx >= 0);
  // temp_vec.push_back(lower_bound_arr);
  // for( auto& l : ls ) {
  //   expr upper_bound_arr(idx[pos] <= l - 1);
  //   temp_vec.push_back(upper_bound_arr);
  // }
  // expr bound_guard = _and(temp_vec);
  // expr bound_guard(idx >= 0);//to be commented
  //
  return arr_write_expr( (new_ar == store( ar_name, idxs, val )),
                         bound_guard, new_ar );
}

arr_read_expr
array_model_full::array_read( unsigned bidx, const llvm::LoadInst* I,
                              exprs& idxs ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);

  // expr lower_bound_arr(idx >= 0);
  // //todo: a trick to avoid bv/arith issue;; may need a fix in future
  // //int idx_num = solver_ctx.int_val(idx);  //To convert idx from bv to int
  // expr upper_bound_arr(idx <= lengths.at(i)-1);
  // std::vector<expr> temp_vec;
  // temp_vec.push_back(lower_bound_arr);
  // temp_vec.push_back(upper_bound_arr);
  // expr bound_guard = _and(temp_vec);
    // expr bound_guard(idx >= 0);//to be commented

  return arr_read_expr( select( ar_name, idxs), bound_guard );
}

void array_model_full::
update_names( unsigned eb,
              std::vector<const llvm::Instruction*>& arrays_updated ) {
  array_state& s = exit_ary_map.at(eb);
  auto& vec = s.get_name_vec();
  for( auto I : arrays_updated) {
    auto i = get_accessed_array(&(*I));//ary_access_to_index.at(&(*I));
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

// Debugging code

void array_model_full::dump_ary_access_to_index() {
  for( auto pr : ary_access_to_index) {
    auto I = pr.first;
    I->print(llvm::outs());
    std::cout << "-->"<< pr.second << "\n";
  }
}



//=======================================================================

// expr array_model_fixed_len::get_fresh_ary_name( unsigned i ) {
//   return get_fresh_int(solver_ctx);
// }

// void array_model_fixed_len::init_state( unsigned //const bb*
//                                         eb ) {
//   array_state& s = exit_ary_map[eb];
//   auto& vec = s.get_name_vec();
//   vec.clear();
//   for( unsigned i = 0; i < num_partition; i++) {
//     vec.push_back( get_fresh_int(solver_ctx) );
//   }
// }

// arr_write_expr array_model_fixed_len::array_write( unsigned bidx,
//                                     const llvm::StoreInst* I,
//                                     expr& idx,
//                                     expr& val ) {
//   llvm_bmc_error( "bmc", "stub!!" );
//   arr_write_expr ret;
//   return ret;
// }

// arr_read_expr array_model_fixed_len::array_read( unsigned bidx,
//                                             const llvm::LoadInst* I,
//                                             expr& idx) {
//   llvm_bmc_error( "bmc", "stub!!" );
//   arr_read_expr ret;
//   return ret;
// }

// array_state&
// array_model_fixed_len::join_array_state(std::vector<const bb*> prevs,
//                                         const bb* b ) {
//   exit_ary_map[b];
//   array_state& st = exit_ary_map.at(b); // tobe added

//   return st;
// }
