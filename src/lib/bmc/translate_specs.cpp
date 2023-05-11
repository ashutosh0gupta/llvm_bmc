#include "lib/bmc/translate_specs.h"

translate_specs::translate_specs( )
  {}


translate_specs::~translate_specs() {}

void translate_specs::translatePrecond( bmc& b, bmc_ds* bmc_ds_ptr, solver_context& ctx, std::vector <expr> cond ) {
  std::vector<std::string> glb_names;
  //for (unsigned k = 0; k < b.sys_spec.threads.size(); k++) { 
  // for (unsigned i = 0; i < b.sys_spec.threads.at(k).pres.size(); i++) {
  for(unsigned i = 0; i < cond.size(); i++) {
    //if (i -> first == thread_name) {
    //expr e = b.sys_spec.threads.at(k).pres.at(i);
    expr e = cond.at(i);
    //std::cout << "Precond is " << to_string(e) << "\n";
    std::string orig_precond = to_string(e);
    glb_names = read_variables(orig_precond);
    //std::cout << "size is " << glb_names.size(); 
    for (unsigned j = 0; j < glb_names.size(); j++) {
      //std::cout << "glb_name1 is " << glb_names.at(j) << "\n";
      std::string var_name = glb_names.at(j);
      for( auto glb_idx_pair : b.m_model.ind_in_mem_state ) {
        auto g = glb_idx_pair.first;
        auto idx = glb_idx_pair.second;
        const std::string gvar = (std::string)(g->getName());
        //std::cout << "glb_name2 is " << gvar << "\n";
        if (gvar == var_name) {
          //std::cout << "glb_name is " << gvar << " Index is " << idx << "\n";
          std::vector<state_obj>& mem_st = b.m_model.store_state_map[0].mem_state_vec;
          //std::cout << "Init name is ";
          //mem_st[idx].print(); std::cout << "\n";
          var_name = '@'+ var_name;
          const size_t oldSize = var_name.length();
          std::string init_name = to_string(mem_st[idx].e);
          if (find(precond_var_names.begin(), precond_var_names.end(), init_name) == precond_var_names.end()) {
          precond_var_names.push_back(init_name);
          if (mem_st[idx].t.type.is_fpa()) {
            precond_declarations.push_back(ctx.fpa_const(init_name.c_str(),8,24));
            std::string init_name1 = init_name + ".";
            precond_var_names.push_back(init_name1);
            precond_declarations.push_back(ctx.fpa_const(init_name1.c_str(),8,24));
          }
          if (mem_st[idx].t.type.is_bv()) {
            precond_declarations.push_back(ctx.bv_const(init_name.c_str(),16));
            std::string init_name1 = init_name + ".";
            precond_var_names.push_back(init_name1);
            precond_declarations.push_back(ctx.bv_const(init_name1.c_str(),16));
          }
	 }
          const size_t newSize = init_name.length();
          for( size_t pos = 0; ; pos += newSize ) {
            // Locate the substring to replace
            pos = orig_precond.find( var_name, pos );
            if( oldSize == newSize ) {
              // if they're same size, use std::string::replace
              orig_precond.replace( pos, oldSize, init_name );
              break;
            } else {
              // if not same size, replace by erasing and inserting
              orig_precond.erase( pos, oldSize );
              orig_precond.insert( pos, init_name );
              //std::cout << "New precond is " << orig_precond << "\n";
              break;
            }
          }
          break;
        }
      }	    
    }
    expr e1 = parseFormula(ctx, orig_precond, precond_var_names, precond_declarations);
    //std::cout << "Modified precond is " << e1 << "\n";
    //b.precond.at(i) = e1;
    bmc_ds_ptr->add_pre_cond( e1, spec_reason_t::ASSUME );
   //}
  }
 //}
  glb_names.clear();
  precond_var_names.clear();
  precond_declarations.clear();
}


void translate_specs::translatePostcond( bmc& b, bmc_ds* bmc_ds_ptr, solver_context& ctx, unsigned bidx, std::vector <expr> cond ) {
  // ary_to_int[llvmValue] -> get an index

  std::vector<std::string> glb_names;
 //for (unsigned k = 0; k < b.sys_spec.threads.size(); k++) { 
  //for (unsigned i = 0; i < b.sys_spec.threads.at(k).posts.size(); i++) {
  for(unsigned i = 0; i < cond.size(); i++) {
    //if (i -> first == thread_name) {
    //expr e = b.sys_spec.threads.at(k).posts.at(i);
    expr e = cond.at(i);
    //std::cout << "Postcond is " << to_string(e) << " Block num is " << bidx << "\n";
    std::string orig_postcond = to_string(e);
    glb_names = read_variables(orig_postcond);
    //std::cout << "size is " << glb_names.size(); 
    for (unsigned j = 0; j < glb_names.size(); j++) {
      //std::cout << "glb_name1 is " << glb_names.at(j) << "\n";
      std::string init_name; 
      std::string var_name = glb_names.at(j);
      std::string var_name1 = '@'+ var_name;
      const size_t oldSize = var_name1.length();
      for( auto glb_idx_pair : b.m_model.ind_in_mem_state ) {
        auto g = glb_idx_pair.first;
        auto idx = glb_idx_pair.second;
        const std::string gvar = (std::string)(g->getName());
        //std::cout << "glb_name2 is " << gvar << "\n";
        if (gvar == var_name) {
          //std::cout << "glb_name is " << gvar << " Index is " << idx << "\n";
          //auto it = b.m_model.store_state_map.end();
          //it--;
          //auto key1 = it->first;
          std::vector<state_obj>& mem_st = b.m_model.store_state_map[bidx].mem_state_vec;
          //std::cout << "Init name is ";
          //mem_st[idx].print(); std::cout << " key is " << key1 << "\n";
          var_name = '@'+ var_name;
          //oldSize = var_name.length();
          init_name = to_string(mem_st[idx].e);
          //std::cout << "Init name is " << init_name << "\n";
	 if (find(postcond_var_names.begin(), postcond_var_names.end(), init_name) == postcond_var_names.end()) {
          postcond_var_names.push_back(init_name);
          if (mem_st[idx].t.type.is_fpa()) {
            postcond_declarations.push_back(ctx.fpa_const(init_name.c_str(),8,24));
            std::string init_name1 = init_name + ".";
            postcond_var_names.push_back(init_name1);
            postcond_declarations.push_back(ctx.fpa_const(init_name1.c_str(),8,24));
          }
          if (mem_st[idx].t.type.is_bv()) {
            postcond_declarations.push_back(ctx.bv_const(init_name.c_str(),16));
            std::string init_name1 = init_name + ".";
            postcond_var_names.push_back(init_name1);
            postcond_declarations.push_back(ctx.bv_const(init_name1.c_str(),16));
          }
	 }
          const size_t newSize = init_name.length();
          for( size_t pos = 0; ; pos += newSize ) {
            // Locate the substring to replace
            pos = orig_postcond.find( var_name, pos );
            if( oldSize == newSize ) {
              // if they're same size, use std::string::replace
              orig_postcond.replace( pos, oldSize, init_name );
              break;
            } else {
              // if not same size, replace by erasing and inserting
              orig_postcond.erase( pos, oldSize );
              orig_postcond.insert( pos, init_name );
              //std::cout << "New postcond is " << orig_postcond << "\n";
              break;
            }
          }
          break;
        }
      }

     for(unsigned m=0; m < bmc_ds_ptr->ar_model_full->ar_names.size(); m++) {
        auto a_var = bmc_ds_ptr->ar_model_full->ar_names.at(m);
        //std::cout << "Array name is " << a_var <<  " Var name is " << var_name <<"\n";
         if (a_var == var_name) {
          //std::cout << "Array_name is " << a_var << " Index is " << m << "\n";
	  unsigned e_size = bmc_ds_ptr->ar_model_full->exit_ary_map.size(); 
	  //std::cout << "Exit_ary_map size is " << e_size << "\n";
	  auto& s_names = bmc_ds_ptr->ar_model_full->exit_ary_map[e_size-1].get_name_vec(); // get the last state
  	  unsigned ar_size = s_names.size();
	  //std::cout << "Name vec size is " << ar_size << "\n";
	  for( unsigned k=0; k < ar_size; k++ ) {
    	//std::cout << "Array in map is " << to_string(s_names.at(k)) << "\n";		
         }
                    
          var_name = '@'+ var_name;
          //oldSize = var_name.length();
          init_name = to_string(s_names.at(m));
          //std::cout << "Init name is " << init_name << "\n";
	  sort s = bmc_ds_ptr->ar_model_full->ar_sorts.at(m);
	  //std::cout << "Sort1 is " << s << "\n";
	  if (find(postcond_var_names.begin(), postcond_var_names.end(), init_name) == postcond_var_names.end()) {
            postcond_var_names.push_back(init_name);
            postcond_declarations.push_back(ctx.constant( init_name.c_str(), s ));
            std::string init_name1 = init_name + ".";
            postcond_var_names.push_back(init_name1);
            postcond_declarations.push_back(ctx.constant(init_name1.c_str(),s));
	 }
          const size_t newSize = init_name.length();
          for( size_t pos = 0; ; pos += newSize ) {
            // Locate the substring to replace
            pos = orig_postcond.find( var_name, pos );
            if( oldSize == newSize ) {
              // if they're same size, use std::string::replace
              orig_postcond.replace( pos, oldSize, init_name );
              break;
            } else {
              // if not same size, replace by erasing and inserting
              orig_postcond.erase( pos, oldSize );
              orig_postcond.insert( pos, init_name );
              //std::cout << "New postcond is " << orig_postcond << "\n";
              break;
            }
          } 
          break; 
        } 
      }
     }
    expr e1 = parseFormula(ctx, orig_postcond, postcond_var_names, postcond_declarations);
    //std::cout << "Modified postcond is " << to_string(e1) << "\n";
    //b.prop.at(i) = e1;
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    bmc_ds_ptr->add_spec( !path_bit || e1, spec_reason_t::SPEC_FILE );
    glb_names.clear();
    postcond_var_names.clear();
    postcond_declarations.clear();
   //}
  }
 //}
}



std::vector<std::string> translate_specs::read_variables( std::string word1 ) {
   //std::cout << "Word1 is " << word1 << "\n";
   global_vars.clear();
   std::string word = " ";
   int i,j,k,n = 0;
   bool global_found = false;
   for(i = 0; word1[i] != '\0'; i++)
    {
        if (word1[i] == '@')
        {
	    //std::cout << "i is " << i << "\n";
            global_found = true;
        }
	if (global_found) {
	  k = 0; n = i+1;
	  for (j = i; word1[j] != ' '; j++) {
	     //std::cout << " k is " << k << "\n";
 	     //word[k] = word1[j];
     	     k++;
	     if (word1[j] == ')') {
		k--;
		break; }
          }
	 i = j;
	 word = word1.substr(n, k-1);
	 global_vars.push_back(word);
	 //std::cout << " word is " << word << " k is " << k << "\n";
	 global_found = false;
	 word = " ";
	 k = 0;
        }
    }
   return global_vars;
}

