#include "lib/bmc/collect_threads.h"
#include "lib/utils/llvm_utils.h"


collect_threads::collect_threads( std::unique_ptr<llvm::Module>& m_,
                                  bmc& b, memory_cons& mem_enc_,
                                  solver_context& solver_ctx__, options& o )
  : module(m_), b(b), mem_enc(mem_enc_), solver_ctx(solver_ctx__), o(o) {
  collect_threads_internal(module, b);
  insert_events(b, mem_enc, solver_ctx, o);
  //CreateRdWrEvents(module, b);
}

collect_threads::~collect_threads() {}


void collect_threads::
collect_threads_internal( std::unique_ptr<llvm::Module>& m, bmc &b ) {
  if (b.sys_spec.threads.size() == 0) {
    
  }
  std::set<const llvm::Value*> written;
  for (unsigned j = 0; j < b.sys_spec.threads.size(); j++) {
    auto EntryFn = b.sys_spec.threads.at(j).entry_function;
    for (auto mit = m->begin(); mit != m->end(); mit++) {
      auto Str1 = mit->getName().str();
      auto dstr = demangle( Str1);
      if ( Str1 != EntryFn && dstr != EntryFn ) continue;
      auto f = &(*mit);
      auto& list_gvars = fn_gvars_map[f->getName().str()];
      for (auto bbit = f->begin(); bbit != f->end(); bbit++) {
        auto bb = &(*bbit);
        for( auto it = bb->begin(); it != bb->end(); ++it) {
          auto I = &(*it);
          llvm::Value* addr = NULL;
          //I->print( llvm::outs() );     std::cout << "\n";
          if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
            addr = store->getOperand(1);
            auto glb = identify_global_in_addr( addr );
            if( glb && !exists( list_gvars, glb ) )
              list_gvars.push_back(glb);
            if(glb) written.insert( glb );
          }else if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
            addr = load->getOperand(0);
            auto glb = identify_global_in_addr( addr );
            if( glb && !exists( list_gvars, glb ) ) {
              list_gvars.push_back(glb);
            }
          }else if( auto rmw = llvm::dyn_cast<llvm::AtomicRMWInst>(I) ) {
            addr = rmw->getPointerOperand();
            auto glb = identify_global_in_addr( addr );
            if( glb && !exists( list_gvars, glb ) )
              list_gvars.push_back(glb);
            if(glb) written.insert( glb );
          }else if (auto eval = llvm::dyn_cast<llvm::ExtractValueInst>(I)) {
            addr = eval->getAggregateOperand();
            auto glb = identify_global_in_addr(addr);
            if (glb && !exists(list_gvars, glb)) {
              std::cout << "\nadded eval gvar in collectGlobalspass\n";
              list_gvars.push_back(glb);
            } else {
              std::cout << "\ndid not add eval gvar in collectGlobalspass\n";
            }
          }else {continue;}
        }
      }
    }
  }
  for (auto fpair1 : fn_gvars_map) {
    auto& glist1 = fpair1.second;
    for (auto fpair2 : fn_gvars_map) {
      if( fpair1.first == fpair2.first ) continue;
      for( auto g : glist1 ) {
        if( !exists( fpair2.second, g ) ) continue;
        //if( !exists( written, g) ) continue;
        //if( auto g1 = llvm::dyn_cast<llvm::GlobalVariable>(g) )
          {
          if( !exists(b.concurrent_vars, g) ) {
            b.concurrent_vars.push_back(g);
          }
        }
      }
    }
  }
}
