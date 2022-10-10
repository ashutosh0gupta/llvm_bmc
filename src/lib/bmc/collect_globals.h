#ifndef LLVMBMC_COLLECT_GLOBALS_H
#define LLVMBMC_COLLECT_GLOBALS_H

/*#include "include/solver.h"*/
#include "lib/utils/solver_utils.h"
#include "include/options.h"
#include "include/bmc.h"
#include "include/memory_cons.h"
#include "include/memory_event.h"

#include <string.h>
#include<iostream>

class collect_globals {

public:
  std::unique_ptr<llvm::Module>& module;
  bmc& b;
  memory_cons& mem_enc;
  solver_context& solver_ctx;
  options& o;
  
  std::map< std::string,  std::vector<const llvm::GlobalVariable*>> fn_gvars_map;
  std::vector<const llvm::GlobalVariable*> list_gvars;

/*  unsigned thread_num = 0;*/
/*  */
/*  memory_cons& mem_enc;*/
  //
  //todo: creating of events should happen in bmc_pass
  //
/*  me_vec events; // topologically sorted events*/
/*  me_ptr start_event, final_event;*/
/*  */
/*  expr start_cond = solver_ctx.bool_val(true);*/


public:
/*  collect_globals( std::unique_ptr<llvm::Module>& m_,*/
/*                        solver_context& solver_ctx__, memory_cons& mem_enc_,*/
/*                        options& o, bmc& b);*/
   collect_globals( std::unique_ptr<llvm::Module>& m_,
                    bmc& b, memory_cons& mem_enc_,
                    solver_context& solver_ctx__, options& o);
   ~collect_globals();

  void collect_globals_internal( std::unique_ptr<llvm::Module>& m, bmc &b );
  void insert_concurrent(bmc&, memory_cons&,
                         solver_context&, options&);

/*  unsigned add_thread( std::string str);*/
/*  void CreateRdWrEvents(std::unique_ptr<llvm::Module>& m, bmc& b);*/

/*  o_tag_t translate_ordering_tags( llvm::AtomicOrdering ord );*/
/*  */
/*  void add_event( me_ptr e ) { events.push_back( e ); }*/

/*  void set_start_event( me_ptr e, expr cond ) {*/
/*      start_event = e;*/
/*      start_cond = cond;*/
/*  }*/
/*  */
/*  void set_start_event( unsigned i, me_ptr e, expr cond ) {*/
/*      set_start_event( e, cond );*/
/*    }*/

/*  src_loc getInstructionLocation(const llvm::Instruction* I );*/

/*  void add_event( unsigned i, me_ptr e );*/

/*  void add_event( unsigned i, me_set es ) {*/
/*      for( auto e : es ) {*/
/*        add_event( i, e );*/
/*      }*/
/*    }*/

};


#endif // LLVMBMC_COLLECT_GLOBALS_H
