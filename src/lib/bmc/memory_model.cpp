#include "include/memory_model.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/solver_utils.h"

expr memory_model::get_fresh_name( sort ty, std::string name_str ) {
	// TODO : Restrict access
  if( ty.is_array() ) {
    llvm_bmc_error( "bmc", "bad sort is passed!!" );
  }
  auto newExpr = get_fresh_const(solver_ctx, ty, name_str);
  return newExpr;
}

std::pair<expr,expr>
memory_model::write( unsigned bidx, const llvm::StoreInst* I,
                      expr& val ) {
	// TODO : Add setters and getters
  memory_state& mem_st = store_state_map[bidx];
  if(auto g_var = llvm::dyn_cast<llvm::GlobalVariable>(I->getPointerOperand())) {
    auto i = ind_in_mem_state[g_var];
    expr new_expr = get_fresh_name(mem_st.mem_state_vec[i].t.type,g_var->getName().str());
    
    datatype ty(mem_st.mem_state_vec[i].t.type);
    state_obj tem_state_obj(new_expr,ty);
    mem_st.mem_state_vec[i] = tem_state_obj;

    return std::make_pair( (new_expr == val), new_expr);
  } else {
    llvm_bmc_error("bmc","Unable to determine the global variable!");
  }
}

expr memory_model::read( unsigned bidx, const llvm::LoadInst* I ) {
  memory_state& mem_st = store_state_map[bidx];
  if(auto g_var = llvm::dyn_cast<llvm::GlobalVariable>(I->getPointerOperand())) {
    auto i = ind_in_mem_state[g_var];
    expr name = mem_st.mem_state_vec[i].e;
    return name;
  } else {
    llvm_bmc_error("bmc","Unable to determine the global variable!");
  }
}

expr memory_model::join_state( std::vector<expr>& conds,
                                    std::vector<unsigned>& prevs,
                                    unsigned src
                                    ) {
  assert( conds.size() > 0  &&  prevs.size() == conds.size() );
  auto& s_names = store_state_map[src].mem_state_vec;
  // unsigned glb_size = exit_glb_map[prevs[0]].get_glb_name_vec().size();
  std::vector<expr> vec;
  for( unsigned j=0; j < store_state_map[src].mem_state_vec.size() ; j++ ) {
    //check if all equal
    auto& o_name = store_state_map[prevs[0]].mem_state_vec[j].e;
    bool is_all_equal = true;
    for( unsigned i=1; i < conds.size(); i++ ) {
      auto& next_name = store_state_map[prevs[i]].mem_state_vec[j].e;
      if( !is_equal( o_name, next_name) ) {
        is_all_equal = false;
        break;
      }
    }
    if( is_all_equal ) {
      // if all symbols are euqal; no need to join.
      datatype tempDataType(store_state_map[prevs[0]].mem_state_vec[j].t.type);
      state_obj tempStateObj(o_name,tempDataType); 
      s_names.push_back(tempStateObj);
    }else{
      expr new_name = get_fresh_name(store_state_map[src].mem_state_vec[j].t.type,"mem");
      for( unsigned i=0; i < conds.size(); i++ ) {
        auto& p_st = store_state_map[prevs[i]].mem_state_vec;
        vec.push_back( implies( conds[i], new_name == p_st[j].e ) );
      }
      datatype tempDataType(store_state_map[src].mem_state_vec[j].t.type);
      state_obj tempStateObj(new_name,tempDataType); 
      s_names.push_back(tempStateObj);
    }
  }
  return _and( vec, solver_ctx );
}

void memory_model::update_name( unsigned eb, std::vector<const llvm::GlobalVariable*>& glbs_updated ) {
  auto& mem_st = store_state_map[eb];
  for( auto I : glbs_updated) {
    auto i = ind_in_mem_state[&*I];
    mem_st.mem_state_vec[i].e = get_fresh_name(mem_st.mem_state_vec[i].t.type,"mem");
  }
}