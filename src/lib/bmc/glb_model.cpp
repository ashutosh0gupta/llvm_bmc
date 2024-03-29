//---------------------------------------------
//
// DEPRECATED : DELETE THE FILE
//
//--------------------------------------------

#include "include/heap_model.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/solver_utils.h"

expr glb_model::get_fresh_glb_name( unsigned i ) {
  return get_fresh_glb_name(i, "glb");
}

expr glb_model::get_fresh_glb_name( unsigned i, std::string name_str ) {
  sort glb_sort = glb_sorts[i];
  if( glb_sort.is_array() ) {
    llvm_bmc_error( "bmc", "bad sort is passed!!" );
  }
  auto glb = get_fresh_const(solver_ctx, glb_sort, name_str);
  return glb;
}

void glb_model::init_state( unsigned //const bb*
                            eb ) {
  glb_state& s = exit_glb_map[eb];
  auto& vec = s.get_glb_name_vec();
  vec.clear();
  for( unsigned i = 0; i < glb_to_id.size(); i++) {
    vec.push_back( get_fresh_glb_name( i ) );
  }
}

void glb_model::set_state( unsigned //const bb*
                           eb, glb_state& gs ) {
  glb_state& s = exit_glb_map[eb];
  auto& vec = s.get_glb_name_vec();
  vec.clear();
  for( auto gn : gs.get_glb_name_vec()) {
    vec.push_back( gn );
  }
}

void glb_model::insert_glb_sort( sort sort) {
  glb_sorts.push_back(sort);
}

void glb_model::insert_glb_to_id( const llvm::GlobalVariable* glb, unsigned i) {
  glb_to_id[glb] = i;
}

void glb_model::insert_name_to_glb( std::string s, const llvm::GlobalVariable* glb) {
  name_to_glb[s] = glb;
}

std::pair<expr,expr>
glb_model::glb_write( unsigned bidx, const llvm::StoreInst* I,
                      expr& val ) {
  // auto b = I->getParent();
  // glb_state& glb_st = get_state( b );
  glb_state& glb_st = get_state( bidx );
  if(auto g_var = llvm::dyn_cast<llvm::GlobalVariable>(I->getPointerOperand())) {
    auto i = glb_to_id[g_var];
    auto& vec = glb_st.get_glb_name_vec();
    expr new_glb = get_fresh_glb_name(i);
    vec[i] = new_glb;
    return std::make_pair( (new_glb == val), new_glb);
  } else {
    llvm_bmc_error("bmc","Unable to determine the global variable!");
  }
}

expr glb_model::glb_read( unsigned bidx, const llvm::LoadInst* I ) {
  // auto b = I->getParent();
  // glb_state& glb_st = get_state( b );
  glb_state& glb_st = get_state( bidx );
  if(auto g_var = llvm::dyn_cast<llvm::GlobalVariable>(I->getPointerOperand())) {
    auto i = glb_to_id[g_var];
    auto& vec = glb_st.get_glb_name_vec();
    expr glb_name = vec[i];
    return glb_name;
  } else {
    llvm_bmc_error("bmc","Unable to determine the global variable!");
  }
}

expr glb_model::join_glb_state( std::vector<expr>& conds,
                                    std::vector<unsigned>& prevs,
                                    unsigned src
                                    // std::vector<const bb*>& prevs,
                                    // const bb* src
                                    ) {
  assert( conds.size() > 0  &&  prevs.size() == conds.size() );
  auto& s_names = exit_glb_map[src].get_glb_name_vec();
  unsigned glb_size = exit_glb_map[prevs[0]].get_glb_name_vec().size();
  std::vector<expr> vec;
  for( unsigned j=0; j < glb_size; j++ ) {
    //check if all equal
    auto& o_name = exit_glb_map[prevs[0]].get_glb_name_vec().at(j);
    bool is_all_equal = true;
    for( unsigned i=1; i < conds.size(); i++ ) {
      auto& next_name = exit_glb_map[prevs[i]].get_glb_name_vec().at(j);
      if( !is_equal( o_name, next_name) ) {
        is_all_equal = false;
        break;
      }
    }
    if( is_all_equal ) {
      // if all symbols are euqal; no need to join.
      s_names.push_back( o_name );
    }else{
      expr new_name = get_fresh_glb_name(j);
      for( unsigned i=0; i < conds.size(); i++ ) {
        auto& p_st = exit_glb_map[prevs[i]].get_glb_name_vec();
        vec.push_back( implies( conds[i], new_name == p_st[j] ) );
      }
      s_names.push_back( new_name );
    }
  }
  return _and( vec, solver_ctx );
}

void glb_model::update_name( unsigned eb, std::vector<const llvm::GlobalVariable*>& glbs_updated ) {
  auto& glb_st = get_state(eb);
  auto& vec = glb_st.get_glb_name_vec();
  for( auto I : glbs_updated) {
    auto i = glb_to_id.at(&*I);
    vec[i] = get_fresh_glb_name(i);
  }
}

void glb_model::refresh_glb_state( unsigned bidx,
                        const llvm::GlobalVariable* g) {
  unsigned i = glb_to_id[g];
  auto& vec =  exit_glb_map[bidx].get_glb_name_vec();
  vec[i] = get_fresh_glb_name(i);
    return;
}

expr glb_model::get_state_var( unsigned bidx,
                               const llvm::GlobalVariable* g) {
  unsigned i = glb_to_id[g];
  return exit_glb_map[bidx].get_glb_name_vec().at(i);
}

expr glb_model::get_state_var( unsigned bidx, unsigned i) {
  return exit_glb_map[bidx].get_glb_name_vec().at(i);
}

