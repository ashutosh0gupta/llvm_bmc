#include "include/array_model.h"
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

expr multiple_array_model::join_array_state( std::vector<expr>& conds,
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

expr single_array_model::join_array_state( std::vector<expr>& conds,
                                        std::vector<unsigned>& prevs,
                                        unsigned src
                                        ) {
  assert( conds.size() > 0  &&  prevs.size() == conds.size() );

  std::vector<expr> vec;
  auto& m_name = exit_ary_map[src].get_M_name(); // fresh state created
  sort array_sort = solver_ctx.array_sort( solver_ctx.int_sort(), solver_ctx.int_sort() );
  auto new_name = get_fresh_const(solver_ctx, array_sort, "Global_M");
  for( unsigned i=0; i < conds.size(); i++ ) {
    auto& p_st = exit_ary_map.at(prevs.at(i)).get_M_name();
    vec.push_back( implies( conds[i], new_name == p_st.at(0) ) );
  }
  m_name.push_back( new_name );

  return _and( vec, solver_ctx );
}

//---------------------------------------------------------------
// collect info about the arrays

sort array_model_full::get_address_sort() {
  return solver_ctx.int_sort();
}

// sort array_model_full::get_solver_array_ty( const llvm::ArrayType* ty ) {
sort array_model_full::get_solver_array_ty( const llvm::Type* ty ) {
  return llvm_to_sort( o, ty);
  // auto elemTy = ty->getArrayElementType();
  // auto s  = llvm_to_sort( o, elemTy );
  // return solver_ctx.array_sort( get_address_sort(ty), s );
}

// sort array_model_full::get_solver_array_ty( const llvm::PointerType* ty ) {
//   auto T = ty->getPointerElementType();
//   if( auto ar_ty = llvm::dyn_cast<llvm::ArrayType>(T)){
//     return get_solver_array_ty( ar_ty );
//   }else if( auto pty = llvm::dyn_cast<llvm::PointerType>(T) ) {
//     // llvm::errs()<<"got here";
//     // todo: creating array of arrays; not multidim array; Z3 may complain
//     auto e_ty = get_solver_array_ty( pty );
//     return solver_ctx.array_sort( get_address_sort(), e_ty );
//     //dump(pty);
//     //assert(false); //todo: fix it when hit it.
//     //return get_solver_array_ty( pty );
//   }else{
//     // llvm::errs()<<"got here";
//     auto e_sort= llvm_to_sort( o, T);
//     return solver_ctx.array_sort( get_address_sort(), e_sort );
//   }
// }

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
  // https://llvm.org/docs/OpaquePointers.html
  std::vector<expr> idxs;
  if( llvm::isa< const llvm::AllocaInst >(arr) ) {
    // since we can know symbol for the length of the array
    // at the time of translatation we place a dummy
    idxs.push_back( solver_ctx.int_val(1) );
    return idxs;
  }
  if( auto g = llvm::dyn_cast<llvm::GlobalVariable>(arr) ) {
    auto typ = g->getValueType();
    if( auto a1 = llvm::dyn_cast<llvm::ArrayType>(typ) ) {
      get_array_length( a1, idxs );
    }
  }
  if( auto pty = llvm::dyn_cast<llvm::PointerType>(arr->getType()) ) {
  //   auto T1 = pty->getPointerElementType();
  //   if( auto a1 = llvm::dyn_cast<llvm::ArrayType>(T1) ) {
  //     get_array_length( a1, idxs );
  //   }
  }
  return idxs;
}

void array_model_full::set_array_length( unsigned ar_num, std::vector<expr>& len ) {
  lengths[ar_num] = len;
}

void array_model_full::
set_debug_map(std::map<const llvm::Value*,const llvm::Instruction*>* dmap_) {
  debug_map = dmap_;
}

void array_model_full::
set_array_info(std::map< const llvm::Value*, unsigned >& ary_ids) {
  num_arrays = ary_ids.size();
  std::vector<const llvm::Type*  > ar_types;
  std::vector<const llvm::DIType*> ar_ditypes;
  ar_types.resize  ( num_arrays );
  ar_ditypes.resize( num_arrays );
  ar_names.resize  ( num_arrays );
  lengths.clear();

  // inserting dummy lengths
  std::vector<expr> idxs;
  for( unsigned i = 0; i < num_arrays; i++ ) {
    lengths.push_back( idxs );
  }
  for( auto& ar_int_pair : ary_ids ) {
    auto ar = ar_int_pair.first;
    auto indx = ar_int_pair.second;
    ar_types[indx] = get_type_of_pointer( ar );
    // if( ar_types[indx] == NULL )
    //   ar_ditypes[indx] = find_type_from_debug( ar, *debug_map);
    ar_names[indx] = ar->getName();
    lengths[indx]  = get_array_length( ar );
  }
  for( unsigned i = 0; i < num_arrays; i++) {
    if( ar_types[i] ) {
      ar_sorts.push_back( get_solver_array_ty( ar_types[i] ) );
    }
    // else{
    //   // We try to get the type information from debug info
    //   ar_sorts.push_back( ditype_to_sort( o.solver_ctx, ar_ditypes[i] ) );
    // }
  }
}


expr array_model_full::get_fresh_ary_name( unsigned i ) {
  sort ar_sort = ar_sorts.at(i);
  if( !ar_sort.is_array() ) {
    llvm_bmc_error( "bmc", "bad sort is passed!!" );
  }
  auto ar = get_fresh_const( solver_ctx, ar_sort, "arr_"+ar_names[i] );
  return ar;
}

void multiple_array_model::init_state( unsigned eb ) {
  array_state& s = exit_ary_map[eb];
  auto& vec = s.get_name_vec();
  vec.clear();
  for( unsigned i = 0; i < num_arrays; i++) {
    vec.push_back( get_fresh_ary_name( i ) );
  }
}

void multiple_array_model::init_state( unsigned eb, array_state& s ) {
  if( s.get_name_vec().size() == 0 )
    init_state(eb);
  else
    exit_ary_map[eb] = s;
}

void multiple_array_model::copy_to_init_state( array_state& in ) {
  array_state& s = exit_ary_map.at(0);
  auto& vec = s.get_name_vec();

  auto& in_vec = in.get_name_vec();
  for( unsigned i = 0; i < num_arrays; i++) {
    vec[i] = in_vec.at(i);
  }
}

void single_array_model::init_state( unsigned eb ) {
  array_state& s = exit_ary_map[eb];
  auto& vec = s.get_M_name();
  vec.clear();
  sort array_sort = solver_ctx.array_sort( get_address_sort(), solver_ctx.int_sort() );
  auto ar = get_fresh_const(solver_ctx, array_sort, "Global_M");
  vec.push_back( ar );
}

void single_array_model::init_state( unsigned eb, array_state& s ) {
  if( s.get_M_name().size() == 0 )
    init_state(eb);
  else
    exit_ary_map[eb] = s;
}

void single_array_model::copy_to_init_state( array_state& in ) {
  array_state& s = exit_ary_map.at(0);
  auto& vec = s.get_M_name();
  auto& in_vec = in.get_M_name();
  vec = in_vec;
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
multiple_array_model::array_write( unsigned bidx, const llvm::StoreInst* I,
                               exprs& idxs, expr& val ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  expr new_ar = get_fresh_ary_name(i);
  vec[i] = new_ar;

  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  return arr_write_expr( (new_ar == store( ar_name, idxs, val )),
                         bound_guard, new_ar );
}

arr_read_expr
multiple_array_model::array_read( unsigned bidx, const llvm::LoadInst* I,
                              exprs& idxs ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  return arr_read_expr( select( ar_name, idxs), bound_guard );
}

arr_read_expr
multiple_array_model::array_read( unsigned bidx, const llvm::ExtractValueInst* I,
                              exprs& idxs ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  return arr_read_expr( select( ar_name, idxs), bound_guard );
}

arr_write_expr
single_array_model::array_write( unsigned bidx, const llvm::StoreInst* I,
                               exprs& idxs, expr& val ) {

  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& M_vec = ar_st.get_M_name();
  expr ar_name = M_vec.back();
  sort array_sort = solver_ctx.array_sort( get_address_sort(), solver_ctx.int_sort() );
  auto new_ar = get_fresh_const(solver_ctx, array_sort, "Global_" + M_array_name);
  M_vec.clear();
  M_vec.push_back(new_ar);

  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  idxs[0] = (idxs[0] + static_cast<int>(ar_bases[i])).simplify();
  return arr_write_expr( (new_ar == store( ar_name, idxs, val )),
                         bound_guard, new_ar );
}

arr_read_expr
single_array_model::array_read( unsigned bidx, const llvm::LoadInst* I,
                              exprs& idxs ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_M_name();
  expr ar_name = vec.back();

  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);

  idxs[0] = (idxs[0] + static_cast<int>(ar_bases[i])).simplify();

  return arr_read_expr( select( ar_name, idxs), bound_guard );
}

arr_read_expr
single_array_model::array_read( unsigned bidx, const llvm::ExtractValueInst* I,
                              exprs& idxs ) {
  array_state& ar_st = get_state( bidx );
  auto i = get_accessed_array(I); //ary_access_to_index.at(I);
  auto& vec = ar_st.get_M_name();
  expr ar_name = vec.back();

  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);

  idxs[0] = (idxs[0] + static_cast<int>(ar_bases[i])).simplify();

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
