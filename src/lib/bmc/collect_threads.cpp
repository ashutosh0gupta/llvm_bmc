#include "lib/bmc/collect_threads.h"
#include "lib/utils/llvm_utils.h"


collect_threads::collect_threads( std::unique_ptr<llvm::Module>& m_,
                                  bmc& b,
                                  // memory_cons& mem_enc_,
                                  // solver_context& solver_ctx__,
                                  options& o )
  : module(m_), b(b), mem_enc(o.mem_enc), solver_ctx(o.solver_ctx), o(o) {
  collect_threads_internal(module, b);
}

collect_threads::~collect_threads() {}

unsigned find_thread_obj( std::map<const llvm::Value *,
                          unsigned>& tr_obj_map,
                          const llvm::Value * vp) {
  for( auto& t_map: tr_obj_map) {
    auto v = t_map.first;
    if( semantic_match( v, vp)) return t_map.second;
    // if( auto I = llvm::dyn_cast<const llvm::Instruction>(v) ) {
    // if( auto Ip = llvm::dyn_cast<const llvm::Instruction>(vp) ) {
    //   if( Ip->isSameOperationAs(I) ) return t_map.second;
    // }
    // }
  }
  return (unsigned)(-1); // Dummy return value to integate
}

void collect_threads::
collect_threads_internal( std::unique_ptr<llvm::Module>& m, bmc &b ) {
  if (b.sys_spec.threads.size() == 0) {
    spec_thread main_thread;
    main_thread.name = "main";
    main_thread.entry_function = "main";
    b.sys_spec.threads.push_back(main_thread);
  }
  unsigned j = 0;
  unsigned size = b.sys_spec.threads.size();
  std::map<const llvm::Value *, unsigned> tr_obj_map;
  while( j < size ) {
  // for (unsigned j = 0; j < b.sys_spec.threads.size(); j++) {
    auto EntryFn = b.sys_spec.threads.at(j).entry_function;
    for( auto mit = m->begin(); mit != m->end(); mit++ ) {
      auto Str1 = mit->getName().str();
      auto dstr = demangle( Str1);
      if( Str1 != EntryFn && dstr != EntryFn ) continue;
      // function found
      auto f = &(*mit);
      for (auto bbit = f->begin(); bbit != f->end(); bbit++) {
        auto bb = &(*bbit);
        for( auto it = bb->begin(); it != bb->end(); ++it) {
          auto I = &(*it);
          if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
            if( is_thread_create(call) ) {
              auto thread_obj_ptr = call->getOperand(0);
              auto efun           = call->getOperand(2);
              if( auto cf = llvm::dyn_cast<const llvm::Function>(efun) ) {
                spec_thread new_thread;
                new_thread.name = "";
                new_thread.entry_function     = demangle(cf->getName().str());
                new_thread.launch_function    = (void *)f;
                new_thread.launch_instruction = (void *)call;
                tr_obj_map[thread_obj_ptr] = b.sys_spec.threads.size();
                b.sys_spec.threads.push_back(new_thread);
              }else{
                llvm_bmc_error("Collect thread", "Function is not passed");
              }
            }
            if( is_thread_join(call) ) {
              auto tr_obj_load = call->getOperand(0);
              if( auto load = llvm::dyn_cast<llvm::LoadInst>(tr_obj_load) ) {
                auto tr_obj = load->getOperand(0);
                 // exists(tr_obj_map, (void *)tr_obj)
                auto tid = find_thread_obj(tr_obj_map, tr_obj);
                if ( tid != (unsigned)(-1) ) {
                  // auto tid = tr_obj_map.at(tr_obj);
                  std::cout << tid << "\n";
                  b.sys_spec.threads.at(tid).join_instruction = call;
                }else{
                  llvm_bmc_warning("Collect thread", "Fails to match join!");
                }
              }else{
                llvm_bmc_error("Collect thread", "No load in join!");
              }
            }
          }
        }
      }
    }
    size = b.sys_spec.threads.size();
    j++;
    if( size > 20 ) {
      llvm_bmc_error("Collect thread","Too many threads! May be in a loop!");
    }
  }

}
