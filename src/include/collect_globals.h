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

#include "include/memory_cons.h"
#include "lib/bmc/memory_event.h"
#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include "include/options.h"

#include <string.h>
#include<iostream>
#include<algorithm>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>

class collect_globals_pass : public llvm::ModulePass {

public:
  static char ID;
  solver_context& solver_ctx;
  memory_cons& mem_enc;
  options& o;
  unsigned thread_num = 0;
  std::string fname1, fname2;
  std::map< std::string,  std::vector<const llvm::GlobalVariable*>> fn_gvars_map;
  std::vector<const llvm::GlobalVariable*> list_gvars;

  //To do: Change to the vectors declared in memory_model.h
  std::vector<const llvm::GlobalVariable*> concurrent_list;
  std::vector<std::string> threads; // thread names
//  memory_model m_model;
  
  me_vec events; // topologically sorted events
  me_ptr start_event, final_event;
  
  expr start_cond = solver_ctx.bool_val(true);

public:
  collect_globals_pass( llvm::Module &m,
                        solver_context& solver_ctx__,
                        memory_cons& mem_enc_,
                        options& o);
   ~collect_globals_pass();

  virtual bool runOnModule(llvm::Module &m); //when there is a Module
  virtual bool runOnFunction(llvm::Function &f); //called by runOnModule

  void insert_concurrent(std::string FnName1, std::string FnName2);
  unsigned add_thread( std::string str);
  void CreateRdWrEvents(llvm::Function& f);

  o_tag_t translate_ordering_tags( llvm::AtomicOrdering ord );
  
  void add_event( me_ptr e ) { events.push_back( e ); }

  void set_start_event( me_ptr e, expr cond ) {
      start_event = e;
      start_cond = cond;
  }
  
  void set_start_event( unsigned i, me_ptr e, expr cond ) {
      set_start_event( e, cond );
    }

  source_loc getInstructionLocation(const llvm::Instruction* I );

  void add_event( unsigned i, me_ptr e );

  void add_event( unsigned i, me_set es ) {
      for( auto e : es ) {
        add_event( i, e );
      }
    }

  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;

};


