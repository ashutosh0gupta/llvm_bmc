#include "llvm/Pass.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Transforms/IPO/PassManagerBuilder.h"

// pragam'ed to aviod warnings due to llvm included files
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/LinkAllPasses.h"

#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include "include/options.h"
#include "include/bmc.h"
#include "include/memory_cons.h"
#include "include/memory_event.h"
//#include "include/parser_data.h"

#include <string.h>
#include<iostream>
#include<algorithm>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>

class collect_globals_pass {

public:
  //static char ID;
  std::unique_ptr<llvm::Module>& module;
  solver_context& solver_ctx;
  //memory_cons& mem_enc;
  options& o;
  bmc& b;
  
  std::map< std::string,  std::vector<const llvm::GlobalVariable*>> fn_gvars_map;
  std::vector<const llvm::GlobalVariable*> list_gvars;

  unsigned thread_num = 0;
  
  memory_cons& mem_enc;
  me_vec events; // topologically sorted events
  me_ptr start_event, final_event;
  
  expr start_cond = solver_ctx.bool_val(true);


public:
  collect_globals_pass( std::unique_ptr<llvm::Module>& m_,
                        solver_context& solver_ctx__, memory_cons& mem_enc_,
                        options& o, bmc& b);
   ~collect_globals_pass();

  //virtual bool runOnFunction(llvm::Function &f); //called by runOnModule
  void collect_globals( std::unique_ptr<llvm::Module>& m, bmc &b );
  void insert_concurrent(bmc&);

  unsigned add_thread( std::string str);
  void CreateRdWrEvents(std::unique_ptr<llvm::Module>& m, bmc& b);

  o_tag_t translate_ordering_tags( llvm::AtomicOrdering ord );
  
  void add_event( me_ptr e ) { events.push_back( e ); }

  void set_start_event( me_ptr e, expr cond ) {
      start_event = e;
      start_cond = cond;
  }
  
  void set_start_event( unsigned i, me_ptr e, expr cond ) {
      set_start_event( e, cond );
    }

  src_loc getInstructionLocation(const llvm::Instruction* I );

  void add_event( unsigned i, me_ptr e );

  void add_event( unsigned i, me_set es ) {
      for( auto e : es ) {
        add_event( i, e );
      }
    }

};


