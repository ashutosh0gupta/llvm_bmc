#include "include/array_model.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/solver_utils.h"

array_state &array_model::get_state(unsigned b) { return exit_ary_map.at(b); }
void array_model::set_array_state(unsigned b, array_state &s) {
  exit_ary_map[b] = s;
}

expr array_model::get_array_state_var(unsigned b, unsigned ith_ary) {
  return exit_ary_map.at(b).get_name_vec()[ith_ary];
}

expr multiple_array_model::join_array_state(std::vector<expr> &conds,
                                            std::vector<unsigned> &prevs,
                                            unsigned src) {
  assert(conds.size() > 0 && prevs.size() == conds.size());
  auto &s_names = exit_ary_map[src].get_name_vec(); // fresh state created
  unsigned ar_size = exit_ary_map.at(prevs.at(0)).get_name_vec().size();
  std::vector<expr> vec;
  for (unsigned j = 0; j < ar_size; j++) {
    // check if all equal
    auto &o_name = exit_ary_map.at(prevs.at(0)).get_name_vec().at(j);
    bool is_all_equal = true;
    for (unsigned i = 1; i < conds.size(); i++) {
      auto &next_name = exit_ary_map.at(prevs.at(i)).get_name_vec().at(j);
      if (!is_equal(o_name, next_name)) {
        is_all_equal = false;
        break;
      }
    }
    if (is_all_equal) {
      // if all symbols are euqal; no need to join.
      s_names.push_back(o_name);
    } else {
      expr new_name = get_fresh_ary_name(j);
      for (unsigned i = 0; i < conds.size(); i++) {
        auto &p_st = exit_ary_map.at(prevs.at(i)).get_name_vec();
        vec.push_back(implies(conds[i], new_name == p_st.at(j)));
      }
      s_names.push_back(new_name);
    }
  }

  return _and(vec, solver_ctx);
}

expr single_array_model::join_array_state(std::vector<expr> &conds,
                                          std::vector<unsigned> &prevs,
                                          unsigned src) {
  assert(conds.size() > 0 && prevs.size() == conds.size());

  std::vector<expr> vec;
  auto &m_name = exit_ary_map[src].get_M_name(); // fresh state created

  sort array_sort = solver_ctx.array_sort(get_address_sort(), get_data_sort());

  auto new_name = get_fresh_const(solver_ctx, array_sort, "Global_M");
  for (unsigned i = 0; i < conds.size(); i++) {
    auto &p_st = exit_ary_map.at(prevs.at(i)).get_M_name();
    vec.push_back(implies(conds[i], new_name == p_st.at(0)));
  }
  m_name.push_back(new_name);

  if( !o.bit_precise ) {
    auto& mr_name = exit_ary_map[src].get_MR_name();
    sort rsort = solver_ctx.array_sort(get_address_sort(),get_real_data_sort());
    auto new_r = get_fresh_const(solver_ctx, rsort, "Global_MR");
    for( unsigned i=0; i < conds.size(); i++ ) {
      auto& p_st = exit_ary_map.at(prevs.at(i)).get_MR_name();
      vec.push_back( implies( conds[i], new_r == p_st.at(0) ) );
    }
    mr_name.push_back( new_r );
  }

  return _and(vec, solver_ctx);
}

//---------------------------------------------------------------
// collect info about the arrays

sort array_model_full::get_address_sort() {
  if (o.bit_precise)
    return solver_ctx.bv_sort(64);
  return solver_ctx.int_sort();
}
sort array_model_full::get_real_data_sort() {
  return solver_ctx.real_sort();
}
sort array_model_full::get_data_sort() {
  if (o.bit_precise)
    // return solver_ctx.bv_sort(32);
    return solver_ctx.bv_sort(o.mem_cell_bits);
  return solver_ctx.int_sort();
}

// sort array_model_full::get_solver_array_ty( const llvm::ArrayType* ty ) {
sort array_model_full::get_solver_array_ty(const llvm::Type *ty) {
  return llvm_to_sort(o, ty);
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

void array_model_full::get_array_length(const llvm::ArrayType *a1,
                                        std::vector<expr> &lengths) {
  int n1 = a1->getNumElements();
  if (o.bit_precise) {
    lengths.push_back(solver_ctx.bv_val(n1, 64)); // todo: why 64?
  } else {
    lengths.push_back(solver_ctx.int_val(n1));
  }
  auto T2 = a1->getElementType();
  if (auto a2 = llvm::dyn_cast<llvm::ArrayType>(T2)) {
    get_array_length(a2, lengths);
  }
}

std::vector<expr> array_model_full::get_array_length(const llvm::Value *arr) {
  // https://llvm.org/docs/OpaquePointers.html
  std::vector<expr> idxs;
  const llvm::Type* dim_ty = nullptr;
  if (auto al = llvm::dyn_cast<const llvm::AllocaInst>(arr)) {
  //   idxs.push_back( solver_ctx.int_val(1) );
  //   return idxs;
    dim_ty = al->getAllocatedType();
  } else if (auto g = llvm::dyn_cast<llvm::GlobalVariable>(arr)) {
    dim_ty = g->getValueType();
  }
  if (dim_ty) {
    std::vector<uint64_t> dims;
    get_type_dims(dim_ty, dims);
    // for (auto d : dims) {
    for (auto d : dims)
      idxs.push_back(o.bit_precise ? solver_ctx.bv_val((uint64_t)d, 64)
                                   : solver_ctx.int_val((uint64_t)d));
    return idxs;
  }
  if (llvm::isa<llvm::PointerType>(arr->getType())) {
    //   auto T1 = pty->getPointerElementType();
    //   if( auto a1 = llvm::dyn_cast<llvm::ArrayType>(T1) ) {
    //     get_array_length( a1, idxs );
    //   }
  }
  return idxs;
}

void array_model_full::set_array_length(unsigned ar_num,
                                        std::vector<expr> &len) {
  lengths[ar_num] = len;
}

void array_model_full::set_debug_map(
    std::map<const llvm::Value *, const llvm::Instruction *> *dmap_) {
  debug_map = dmap_;
}

void array_model_full::set_array_info(
    std::map<const llvm::Value *, unsigned> &ary_ids) {
  num_arrays = ary_ids.size();
  std::vector<const llvm::Type *> ar_types;
  std::vector<const llvm::DIType *> ar_ditypes;
  ar_types.resize(num_arrays);
  ar_ditypes.resize(num_arrays);
  ar_names.resize(num_arrays);
  lengths.clear();

  // inserting dummy lengths
  std::vector<expr> idxs;
  for (unsigned i = 0; i < num_arrays; i++) {
    lengths.push_back(idxs);
  }
  for (auto &ar_int_pair : ary_ids) {
    auto ar = ar_int_pair.first;
    auto indx = ar_int_pair.second;
    ar_types[indx] = get_type_of_pointer(ar);
    // if( ar_types[indx] == NULL )
    //   ar_ditypes[indx] = find_type_from_debug( ar, *debug_map);
    ar_names[indx] = ar->getName();
    lengths[indx] = get_array_length(ar);
  }
  for (unsigned i = 0; i < num_arrays; i++) {
    if (ar_types[i]) {
      ar_sorts.push_back(get_solver_array_ty(ar_types[i]));
    }
    // else{
    //   // We try to get the type information from debug info
    //   ar_sorts.push_back( ditype_to_sort( o.solver_ctx, ar_ditypes[i] ) );
    // }
  }
}


expr array_model_full::get_fresh_ary_name(unsigned i) {
  sort ar_sort = ar_sorts.at(i);
  if (!ar_sort.is_array()) {
    llvm_bmc_error("bmc", "bad sort is passed!!");
  }
  auto ar = get_fresh_const(solver_ctx, ar_sort, "arr_" + ar_names[i]);
  return ar;
}

void multiple_array_model::init_state(unsigned eb) {
  array_state &s = exit_ary_map[eb];
  auto &vec = s.get_name_vec();
  vec.clear();
  for (unsigned i = 0; i < num_arrays; i++) {
    vec.push_back(get_fresh_ary_name(i));
  }
}

void multiple_array_model::init_state(unsigned eb, array_state &s) {
  if (s.get_name_vec().size() == 0)
    init_state(eb);
  else
    exit_ary_map[eb] = s;
}

void multiple_array_model::copy_to_init_state(array_state &in) {
  array_state &s = exit_ary_map.at(0);
  auto &vec = s.get_name_vec();

  auto &in_vec = in.get_name_vec();
  for (unsigned i = 0; i < num_arrays; i++) {
    vec[i] = in_vec.at(i);
  }
}

void single_array_model::init_state(unsigned eb) {
  array_state &s = exit_ary_map[eb];
  auto &vec = s.get_M_name();
  vec.clear();

  sort array_sort = solver_ctx.array_sort(get_address_sort(), get_data_sort());
  auto ar = get_fresh_const(solver_ctx, array_sort, "Global_M");
  if (is_initial_mem) {
    initial_mem = ar.to_string();
    is_initial_mem = false;
  }
  // final_mem = ar.to_string();
  set_final_mem( ar );
  vec.push_back(ar);

  auto& rvec = s.get_MR_name();
  rvec.clear();
  if( !o.bit_precise ) {
    sort rsort = solver_ctx.array_sort(get_address_sort(),get_real_data_sort());
    rvec.push_back( get_fresh_const(solver_ctx, rsort, "Global_MR") );
  }
}

void single_array_model::init_state(unsigned eb, array_state &s) {
  if (s.get_M_name().size() == 0)
    init_state(eb);
  else
    exit_ary_map[eb] = s;
}

void single_array_model::copy_to_init_state(array_state &in) {
  array_state &s = exit_ary_map.at(0);
  auto &vec = s.get_M_name();
  auto &in_vec = in.get_M_name();
  vec = in_vec;
}

unsigned array_model_full::get_accessed_array(const llvm::Instruction *I) {
  try {
    return ary_access_to_index.at(I);
  } catch (...) {
    // dump_ary_access_to_index();
    // llvm_bmc_error("array model full", "array for the access not found")
    std::string acc;
    llvm::raw_string_ostream os(acc);
    I->print(os);
    llvm_bmc_error( "array model full", "no array was found for the access"
                    << acc )
  }
}


expr array_model_full::access_bound_cons(exprs &idxs, exprs &ls) {
  // if( idxs.size() < ls.size() ) {
  //   assert( false );
  while (idxs.size() < ls.size()) {
    idxs.push_back(o.bit_precise ? solver_ctx.bv_val(0, 64)
                                 : solver_ctx.int_val(0));
  }
  // todo : HACK!!! removing dummy accesses at the end.
  //        check if it is a correct fix :- Ans it was not
  //  if( ls.size() > 0 ) {
  //    while( idxs.size() != ls.size() ){
  //      idxs.pop_back();
  //    }
  //  }

  if (ls.size() > 0) {
    while (idxs.size() > ls.size()) {
      idxs.erase(idxs.begin());
    }
    assert(idxs.size() == ls.size());
  }
  {
    bool known = true, in_bound = true;
    for( unsigned k = 0; k < ls.size(); k++ ) {
      int64_t i, l;
      if( !numeral_sval( idxs[k], i ) || !numeral_sval( ls[k], l ) ) {
        known = false;
        break;
      }
      if( i < 0 || i >= l ) in_bound = false;
    }
    if( known ) return solver_ctx.bool_val( in_bound );
  }

  // bounds constraints
  std::vector<expr> temp_vec;
  unsigned pos = 0;
  for (auto &l : ls) {
    expr idx = idxs[pos];
    if (o.bit_precise) {
      expr zero = solver_ctx.bv_val(0, idx.get_sort().bv_size());
      expr lower_bound_arr(idx >= zero);
      temp_vec.push_back(lower_bound_arr);
      expr upper_bound_arr(!(idx >= l));
      temp_vec.push_back(upper_bound_arr);
    } else {
      expr lower_bound_arr(idx >= 0);
      temp_vec.push_back(lower_bound_arr);
      expr upper_bound_arr(idx <= l - 1);
      temp_vec.push_back(upper_bound_arr);
    }
    pos++;
  }
  expr bound_guard = _and(temp_vec, solver_ctx);
  return bound_guard;
}

arr_write_expr
multiple_array_model::array_write(unsigned bidx, const llvm::StoreInst* I,
                               exprs& idxs, expr& val) {
  return array_write_id(bidx, get_accessed_array(I), idxs, val);
}

arr_write_expr
multiple_array_model::array_write_id(unsigned bidx, unsigned i,
                                                 exprs &idxs, expr &val) {
  array_state &ar_st = get_state(bidx);
  auto &vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  expr new_ar = get_fresh_ary_name(i);
  vec[i] = new_ar;

  auto &ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  while (idxs.size() > 1)
    idxs.pop_back();
  return arr_write_expr((new_ar == store(ar_name, idxs[0], val)), bound_guard,
                        new_ar);
}

arr_read_expr multiple_array_model::array_read(unsigned bidx,
                                               const llvm::LoadInst *I,
                                               exprs &idxs) {
  return array_read_id(bidx, get_accessed_array(I), idxs, I->getType());
}

arr_read_expr
multiple_array_model::array_read_id(unsigned bidx, unsigned i, exprs& idxs,
                                     const llvm::Type* ty) {
  array_state &ar_st = get_state(bidx);
  auto &vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  auto &ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  while (idxs.size() > 1)
    idxs.pop_back();
  return arr_read_expr(select(ar_name, idxs[0]), bound_guard);
}

arr_read_expr multiple_array_model::array_read(unsigned bidx,
                                               const llvm::ExtractValueInst *I,
                                               exprs &idxs) {
  array_state &ar_st = get_state(bidx);
  auto i = get_accessed_array(I); // ary_access_to_index.at(I);
  auto &vec = ar_st.get_name_vec();
  expr ar_name = vec.at(i);
  auto &ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  return arr_read_expr(select(ar_name, idxs), bound_guard);
}

arr_write_expr single_array_model::array_write(unsigned bidx,
                                               const llvm::StoreInst *I,
                                               exprs &idxs, expr &val) {
  return array_write_id(bidx, get_accessed_array(I), idxs, val);
}

unsigned single_array_model::get_slot_cells(unsigned i) {
  if (!o.bit_precise) return 1;
  auto it = ar_slot_cells.find(i);
  return it == ar_slot_cells.end() ? 1 : it->second;
}

bool single_array_model::cell_unit_index( unsigned i ) {
  return ar_cell_indexed.count(i) > 0 || get_slot_cells(i) == 1;
}

expr single_array_model::slot_address(unsigned i, exprs& idxs, exprs& ls) {
  expr lin = idxs[0];
  // for (std::size_t k = 1; k < idxs.size(); k++)
  //   lin = (lin * ls[k] + idxs[k]).simplify();
  for (std::size_t k = 1; k < idxs.size(); k++) {
    if( k >= ls.size() )
      llvm_bmc_error("array_model", "array " << ar_names.at(i) << " is accessed"
                     " with " << idxs.size() << " indices and no length is"
                     " recorded for dimension " << k << "; an array reached"
                     " through a pointer has no declared bounds");
    lin = fold_mul_add( lin, ls[k], idxs[k] );
  }
  unsigned cells = get_slot_cells(i);
  // if (cells > 1)
  //   lin = (lin * static_cast<int>(cells)).simplify();
  // return (lin + static_cast<int>(ar_bases.at(i))).simplify();
  if( cells > 1 && ar_cell_indexed.count(i) == 0 )
    lin = fold_mul_num( lin, cells );
  if( ar_bases.count(i) == 0 )
    llvm_bmc_error("array_model", "array " << ar_names.at(i) << " is accessed"
                   " but no base was handed out for it, so init_array_model"
                   " never saw an access that reaches it");
  return fold_add_num( lin, ar_bases.at(i) );  // base LAST
}

expr single_array_model::last_cell_in_bound( exprs& idxs, exprs& ls,
                                             unsigned n ) {
  expr last = fold_add_num( idxs[0], n-1 );
  return fold_not( fold_sge( last, ls.at(0) ) );
}

expr single_array_model::cell_address(expr& addr, unsigned k) {
  if (k == 0) return addr;
  // return (addr + static_cast<int>(k)).simplify();
  return fold_add_num( addr, k );
}

expr single_array_model::value_to_bits(expr& val) {
  if (val.is_fpa()) return val.mk_to_ieee_bv();
  if (val.is_bool())
    return ite(val, solver_ctx.bv_val(1,1), solver_ctx.bv_val(0,1));
  if (!val.is_bv())
    // llvm_bmc_error("array_model", "value of this type can not be written in the memory");
    llvm_bmc_error("array_model", "a value of sort " << val.get_sort()
                   << " can not be written in the memory: " << val );
  return val;
}

expr single_array_model::bits_to_value(expr& bits, const llvm::Type* ty) {
  if (!ty) return bits;
  unsigned w = scalar_bits(ty);
  expr v = w < bits.get_sort().bv_size() ? bits.extract(w-1, 0) : bits;
  if (ty->isFloatingPointTy())
    return v.mk_from_ieee_bv(llvm_to_bv_sort(solver_ctx, ty));
  return v;
}

arr_write_expr
single_array_model::array_write_id(unsigned bidx, unsigned i,
                                    exprs& idxs, expr& val) {
  array_state &ar_st = get_state(bidx);
  auto &M_vec = ar_st.get_M_name();
  expr ar_name = M_vec.back();

  sort array_sort = solver_ctx.array_sort(get_address_sort(), get_data_sort());
  auto new_ar =
      get_fresh_const(solver_ctx, array_sort, "Global_" + M_array_name);
  M_vec.clear();
  M_vec.push_back(new_ar);
  // final_mem = new_ar.to_string();
  // for (std::size_t k = 1; k < idxs.size(); k++) {
  // lin = (lin + static_cast<int>(ar_bases.at(i)))
  // idxs.clear();
  // idxs.push_back(lin);
  // if (o.bit_precise &&
      // ar_name.get_sort().array_range().bv_size() > val.get_sort().bv_size())
    // val = z3::zext(val, ar_name.get_sort().array_range().bv_size() -
                            // val.get_sort().bv_size());
  set_final_mem( new_ar );

  auto &ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  expr addr = slot_address(i, idxs, ls);

  // for (std::size_t k = 1; k < idxs.size(); k++) {
  // lin = (lin + static_cast<int>(ar_bases.at(i))).simplify();
  // idxs.clear();
  // idxs.push_back(lin);
  // while (idxs.size() > 1) {
  if (!o.bit_precise) {
    // if (val.is_real())
    //   llvm_bmc_error("array_model", "floats in memory are not supported in integer mode, use -b");
    if( val.is_real() ) {
      auto& MR_vec = ar_st.get_MR_name();
      expr mr_name = MR_vec.back();
      sort rsort = solver_ctx.array_sort(get_address_sort(),get_real_data_sort());
      auto new_mr = get_fresh_const(solver_ctx, rsort, "Global_MR");
      MR_vec.clear();
      MR_vec.push_back(new_mr);
      expr upd = (new_ar == ar_name) &&
                 (new_mr == store( mr_name, addr, val ));
      return arr_write_expr( upd, bound_guard, new_ar );
    }
    expr v = val.is_bool() ?
      ite(val, solver_ctx.int_val(1), solver_ctx.int_val(0)) : val;
    return arr_write_expr((new_ar == store(ar_name, addr, v)),
                           bound_guard, new_ar);
}

  expr bits = value_to_bits(val);
  unsigned w = get_data_sort().bv_size();
  unsigned n = (bits.get_sort().bv_size() + w - 1)/w;
  // if (n > get_slot_cells(i))
  if( n > get_slot_cells(i) && !cell_unit_index(i) )
    llvm_bmc_error("array_model", "value is wider than the memory of the array");
  if( n > 1 && cell_unit_index(i) )
    bound_guard = fold_and( bound_guard, last_cell_in_bound( idxs, ls, n ) );
  if (n*w > bits.get_sort().bv_size())
    bits = z3::zext(bits, n*w - bits.get_sort().bv_size());
  expr M = ar_name;
  for (unsigned k = 0; k < n; k++) {
    expr cell = n == 1 ? bits : bits.extract((k+1)*w-1, k*w);
    M = store(M, cell_address(addr,k), cell);
  }
  return arr_write_expr((new_ar == M), bound_guard, new_ar);
}

arr_write_expr
array_model_full::array_fill_id( unsigned, unsigned, exprs&, exprs&, expr&,
                                 uint64_t ) {
  llvm_bmc_error( "array_model", "this array model has no bulk fill" );
}

arr_write_expr
array_model_full::array_copy_id( unsigned, unsigned, exprs&, exprs&,
                                 unsigned, exprs&, exprs&, uint64_t ) {
  llvm_bmc_error( "array_model", "this array model has no bulk copy" );
}

arr_write_expr
array_model_full::array_fill_cells( unsigned, unsigned, expr&, expr&, expr& ) {
  llvm_bmc_error( "array_model", "this array model has no bulk fill" );
}

arr_write_expr
array_model_full::array_copy_cells( unsigned, unsigned, expr&, unsigned,
                                    expr&, expr& ) {
  llvm_bmc_error( "array_model", "this array model has no bulk copy" );
}

bool single_array_model::has_bulk_update() { return o.bit_precise; }

expr single_array_model::start_new_memory( unsigned bidx, expr& old_name ) {
  array_state& ar_st = get_state( bidx );
  auto& M_vec = ar_st.get_M_name();
  old_name = M_vec.back();
  sort array_sort = solver_ctx.array_sort(get_address_sort(),get_data_sort());
  auto new_ar = get_fresh_const(solver_ctx, array_sort,
                                "Global_" + M_array_name);
  M_vec.clear();
  M_vec.push_back(new_ar);
  set_final_mem( new_ar );
  return new_ar;
}

expr single_array_model::in_cell_run( expr& k, expr& addr, uint64_t cells ) {
  unsigned w = addr.get_sort().bv_size();
  expr n = solver_ctx.bv_val( cells, w );
  return in_cell_run( k, addr, n );
}

expr single_array_model::in_cell_run( expr& k, expr& addr, expr& cells ) {
  expr end = ( addr + cells ).simplify();
  return ( z3::ule( addr, k ) && z3::ult( k, end ) ).simplify();
}

expr single_array_model::cell_run_address( unsigned i, expr& off ) {
  if( ar_bases.count(i) == 0 )
    llvm_bmc_error( "array_model", "array " << ar_names.at(i) << " is copied"
                    " into but no base was handed out for it, so"
                    " init_array_model never saw an access that reaches it" );
  unsigned w = get_address_sort().bv_size();
  return ( solver_ctx.bv_val( ar_bases.at(i), w ) + off ).simplify();
}

expr single_array_model::cell_run_in_bound( unsigned i, expr& off,
                                            expr& cells ) {
  auto& ls = lengths.at(i);
  if( ls.empty() )
    llvm_bmc_error( "array_model", "array " << ar_names.at(i) << " is copied"
                    " into and no length is recorded for it; an array reached"
                    " through a pointer has no declared bounds" );
  unsigned w = ls.at(0).get_sort().bv_size();
  expr total = solver_ctx.bv_val( get_slot_cells(i), w );
  for( auto& l : ls ) total = ( total * l );
  return z3::ule( (off + cells).simplify(), total.simplify() ).simplify();
}

arr_write_expr
single_array_model::array_fill_cells( unsigned bidx, unsigned i, expr& off,
                                      expr& cells, expr& cell_val ) {
  expr ar_name( solver_ctx );
  expr new_ar = start_new_memory( bidx, ar_name );
  expr bound_guard = cell_run_in_bound( i, off, cells );
  expr addr = cell_run_address( i, off );
  expr k = get_fresh_const( solver_ctx, get_address_sort(), "cell" );
  expr run = in_cell_run( k, addr, cells );
  expr body = ite( run, cell_val, select( ar_name, k ) );
  return arr_write_expr( (new_ar == z3::lambda( k, body )), bound_guard,
                         new_ar );
}

arr_write_expr
single_array_model::array_copy_cells( unsigned bidx, unsigned dst, expr& doff,
                                      unsigned src, expr& soff,
                                      expr& cells ) {
  expr ar_name( solver_ctx );
  expr new_ar = start_new_memory( bidx, ar_name );
  expr bound_guard = fold_and( cell_run_in_bound( dst, doff, cells ),
                               cell_run_in_bound( src, soff, cells ) );
  expr daddr = cell_run_address( dst, doff );
  expr saddr = cell_run_address( src, soff );
  expr k = get_fresh_const( solver_ctx, get_address_sort(), "cell" );
  expr run = in_cell_run( k, daddr, cells );
  expr from = ( k - daddr + saddr ).simplify();
  expr body = ite( run, select( ar_name, from ), select( ar_name, k ) );
  return arr_write_expr( (new_ar == z3::lambda( k, body )), bound_guard,
                         new_ar );
}

expr single_array_model::uniform_cell( expr& val ) {
  expr bits = value_to_bits( val );
  unsigned w = get_data_sort().bv_size();
  unsigned cpe = ( bits.get_sort().bv_size() + w - 1 )/w;
  if( cpe*w > bits.get_sort().bv_size() )
    bits = z3::zext( bits, cpe*w - bits.get_sort().bv_size() );
  expr c0 = ( cpe == 1 ? bits : bits.extract( w-1, 0 ) ).simplify();
  for( unsigned k = 1; k < cpe; k++ ) {
    expr ck = bits.extract( (k+1)*w-1, k*w ).simplify();
    if( !z3::eq( ck, c0 ) )
      llvm_bmc_error( "array_model", "a bulk fill needs every cell of the "
                      "element to hold the same bits" );
  }
  return c0;
}

arr_write_expr
single_array_model::array_fill_id( unsigned bidx, unsigned i, exprs& first,
                                   exprs& last, expr& val, uint64_t elems ) {
  expr ar_name( solver_ctx );
  expr new_ar = start_new_memory( bidx, ar_name );

  auto& ls = lengths.at(i);
  expr bound_guard = fold_and( access_bound_cons( first, ls ),
                               access_bound_cons( last, ls ) );
  expr addr = slot_address( i, first, ls );
  expr cell_val = uniform_cell( val );
  uint64_t cells = elems * get_slot_cells(i);

  expr k = get_fresh_const( solver_ctx, get_address_sort(), "cell" );
  expr run = in_cell_run( k, addr, cells );
  expr body = ite( run, cell_val, select( ar_name, k ) );
  return arr_write_expr( (new_ar == z3::lambda( k, body )), bound_guard,
                         new_ar );
}

arr_write_expr
single_array_model::array_copy_id( unsigned bidx,
                                   unsigned dst, exprs& dfirst, exprs& dlast,
                                   unsigned src, exprs& sfirst, exprs& slast,
                                   uint64_t elems ) {
  expr ar_name( solver_ctx );
  expr new_ar = start_new_memory( bidx, ar_name );

  auto& dls = lengths.at(dst);
  auto& sls = lengths.at(src);
  expr bound_guard = fold_and( fold_and( access_bound_cons( dfirst, dls ),
                                         access_bound_cons( dlast, dls ) ),
                               fold_and( access_bound_cons( sfirst, sls ),
                                         access_bound_cons( slast, sls ) ) );
  expr daddr = slot_address( dst, dfirst, dls );
  expr saddr = slot_address( src, sfirst, sls );
  if( get_slot_cells(dst) != get_slot_cells(src) )
    llvm_bmc_error( "array_model", "a bulk copy needs both arrays to take the "
                    "same number of cells per element" );
  uint64_t cells = elems * get_slot_cells(dst);

  expr k = get_fresh_const( solver_ctx, get_address_sort(), "cell" );
  expr run = in_cell_run( k, daddr, cells );
  expr from = ( k - daddr + saddr ).simplify();
  expr body = ite( run, select( ar_name, from ), select( ar_name, k ) );
  return arr_write_expr( (new_ar == z3::lambda( k, body )), bound_guard,
                         new_ar );
}

arr_read_expr
single_array_model::array_read(unsigned bidx, const llvm::LoadInst* I,
                              exprs& idxs) {
  return array_read_id(bidx, get_accessed_array(I), idxs, I->getType());
}

arr_read_expr
single_array_model::array_read_id(unsigned bidx, unsigned i, exprs& idxs,
                                   const llvm::Type* ty) {
  array_state& ar_st = get_state(bidx);
  auto& vec = ar_st.get_M_name();
  expr ar_name = vec.back();

  auto& ls = lengths.at(i);
  auto bound_guard = access_bound_cons(idxs, ls);
  expr addr = slot_address(i, idxs, ls);

  if (!o.bit_precise) {
    // if (ty && ty->isFloatingPointTy())
    //   llvm_bmc_error("array_model", "floats in memory are not supported in integer mode, use -b");
    if( ty && ty->isFloatingPointTy() ) {
      auto& MR_vec = ar_st.get_MR_name();
      return arr_read_expr( select( MR_vec.back(), addr ), bound_guard );
    }
    expr v = select(ar_name, addr);
    if (ty && ty->isIntegerTy(1)) v = (v == 1);
    return arr_read_expr(v, bound_guard);
  }

  unsigned w = get_data_sort().bv_size();
  unsigned bits = ty ? scalar_bits(ty) : w;
  if (bits == 0)
    llvm_bmc_error("array_model", "value of this type can not be read from the memory");
  unsigned n = (bits + w - 1)/w;
  // if (n > get_slot_cells(i))
  if( n > get_slot_cells(i) && !cell_unit_index(i) )
    llvm_bmc_error("array_model", "value is wider than the memory of the array");
  if( n > 1 && cell_unit_index(i) )
    bound_guard = fold_and( bound_guard, last_cell_in_bound( idxs, ls, n ) );
  expr cells = select(ar_name, addr);
  for (unsigned k = 1; k < n; k++)
    cells = concat(select(ar_name, cell_address(addr,k)), cells);
  return arr_read_expr(bits_to_value(cells, ty), bound_guard);
}

arr_read_expr
single_array_model::array_read(unsigned bidx, const llvm::ExtractValueInst* I,
                                             exprs &idxs) {
  array_state &ar_st = get_state(bidx);
  auto i = get_accessed_array(I); // ary_access_to_index.at(I);
  auto &vec = ar_st.get_M_name();
  expr ar_name = vec.back();

  auto &ls = lengths.at(i);

  auto bound_guard = access_bound_cons(idxs, ls);

  // idxs[0] = (idxs[0] + static_cast<int>(ar_bases[i])).simplify();

  return arr_read_expr(select(ar_name, idxs), bound_guard);
}

void array_model_full::update_names(
    unsigned eb, std::vector<const llvm::Instruction *> &arrays_updated) {
  array_state &s = exit_ary_map.at(eb);
  auto &vec = s.get_name_vec();
  for (auto I : arrays_updated) {
    auto i = get_accessed_array(&(*I)); // ary_access_to_index.at(&(*I));
    expr new_ar = get_fresh_ary_name(i);
    vec[i] = new_ar;
  }
}

void array_model_full::update_name(unsigned eb, unsigned i) {
  array_state &s = exit_ary_map.at(eb);
  auto &vec = s.get_name_vec();
  expr new_ar = get_fresh_ary_name(i);
  vec[i] = new_ar;
}

// Debugging code

void array_model_full::dump_ary_access_to_index() {
  for (auto pr : ary_access_to_index) {
    auto I = pr.first;
    I->print(llvm::outs());
    std::cout << "-->" << pr.second << "\n";
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
