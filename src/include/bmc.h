#ifndef LLVM_BMC_H
#define LLVM_BMC_H

#include "include/options.h"
#include "include/bmc_ds.h"
#include "include/loopdata.h"
#include "include/array_model.h"
#include "include/solver.h"
#include "include/spec.h"
#include "include/llvm_decls.h"
#include "include/memory_event.h"


#define OUTSIDE_ANY_LOOP_CODE_PTR NULL

struct thread_events {
  me_vec events;
  me_ptr start_event, final_event;
};

class events_data {
  options& o;

  std::vector< thread_events > threads;

  me_set all_events;
  std::set< std::tuple<std::string,me_ptr,me_ptr> > reading_map;
  variable_set globals;
  var_to_ses_map wr_events;
  var_to_me_vec_map rd_events;
  me_ptr init_loc; // todo : remove their prev/post to avoid leaks
  me_ptr post_loc;
  std::map< std::string, me_ptr> create_map;
  std::map< std::string, std::pair<me_ptr, expr > > join_map;

  me_to_ses_map seq_before;
  me_to_ses_map seq_dom_wr_before;
  me_to_ses_map seq_dom_wr_after;  
  
  // pre calculation of orderings
  me_to_ses_map must_after;
  me_to_ses_map must_before;
  me_to_depends_map may_after;
  me_to_depends_map ppo_before;
  me_to_depends_map c11_rs_heads; // c11 release sequence heads

  expr phi_ses      = o.solver_ctx.bool_val(true);
  expr phi_post     = o.solver_ctx.bool_val(true);
  expr phi_pre      = o.solver_ctx.bool_val(true); //z3.c.bool_val(true);
  expr phi_po       = o.solver_ctx.bool_val(true);
  expr phi_vd       = o.solver_ctx.bool_val(true);
  expr phi_pi       = o.solver_ctx.bool_val(true);
  expr phi_prp      = o.solver_ctx.bool_val(true);
  expr phi_fea      = o.solver_ctx.bool_val(true); // feasable traces
  expr phi_distinct = o.solver_ctx.bool_val(true); //ensures that all locations are distinct

  inline const spec_thread& get_thread(unsigned t) const { //To be moved?
      assert( t < threads.size() );
      return threads[t];
    }

  void add_global( std::string g, sort sort ) {
      globals.insert( variable(g, sort) );
    }

    // todo: only return const reference??
    variable get_global( std::string gname ) {
      for( auto& g : globals ) {
        if( gname == g.name )
          return g;
      }
      llvm_bmc_error( "bmc","global variable " << gname << " not found!" );
      variable g(o.solver_ctx); // dummy code to suppress warning
      return g;
    }

};

class bmc {
public:
  options& o;
  // solver_context& solver_ctx;
  value_expr_map def_map;
  std::unique_ptr<llvm::Module>& module;
  std::map< const llvm::BasicBlock*, comments >& bb_comment_map;

  std::map< const llvm::Function*, bmc_fun*> func_formula_map;

  // loop_formula_map[NULL] maps to data for the code that is not in any loop
  std::map< const llvm::Loop*, bmc_loop*> loop_formula_map;
  std::map<llvm::Loop*, loopdata*> ld_map;

  name_map localNameMap;
  std::map< const llvm::BasicBlock*,rev_name_map > revStartLocalNameMap;//todo:likely useless
  std::map< const llvm::BasicBlock*, rev_name_map > revEndLocalNameMap;

  //--------------------------------------------------
  // add data structure to store information collected
  // from specification file
  //std::map< std::string, unsigned > fn_to_thread;
  //typedef std::pair<std::string, std::string> threads;
  //typedef std::pair<std::string, expr> condition;
  //std::vector <threads> thread_list;
  //std::vector<condition> prop;
  //std::vector<condition> precond;

  std::vector< spec_thread > threads; //todo : populate this
  std::vector<const llvm::GlobalVariable*> concurrent_vars;
  //std::map< me_ptr, unsigned > all_events;
  event_data edata;

  bool verify_prop();
  //--------------------------------------------


  bmc(std::unique_ptr<llvm::Module>& m_,
      std::map<const llvm::BasicBlock*, comments >& bb_comment_map_,
      options& o_ );

  ~bmc();

  //-------------------------------------------
  // Memory model
  std::vector<expr> glb_bmc_vec;
  memory_model m_model;
  memory_state populate_mem_state();
  void init();

  //-------------------------------------------
  // Checking Specs and Reporting results
  // void eliminate_vars(bmc_ds*);
  void check_all_spec(bmc_ds*);
  bool run_solver(spec &, bmc_ds*);
  bool is_file_exist(std::string fileName);

  void produce_witness_call( model mdl, const llvm::CallInst* call );
  void produce_witness( model, bmc_ds*, unsigned call_count=0 );
  std::string get_val_for_instruction( const llvm::Instruction* I,
                                       model& mdl,
                                       std::map<std::string, std::string>&,
                                       bmc_ds*,  unsigned call_count );

  //-------------------------------------------
  void run_bmc_pass();
  // void collect_aggr_pass();

  std::map< const llvm::Function*, bmc_fun*>& get_func_formula_map();
  std::map< const llvm::Loop*, bmc_loop*>& get_loop_formula_map();
};

#endif // LLVM_BMC_H
