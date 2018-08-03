#include "include/options.h"

// void run_bmc( std::unique_ptr<llvm::Module>& module,
//               std::vector< comment >&,
//               options& o, z3::context& z3_ctx,
//               value_expr_map& m_,
//               std::map<llvm::Loop*, loopdata*>& ld_map,
//               name_map& lMap,
//               std::map<std::string, llvm::Value*>& evMap);

void prepare_module( options& o,
                     std::unique_ptr<llvm::Module>& module,
                     std::vector<comment>& comments,
                     // std::map<llvm::Value*, std::string>& lMap,
                     std::map< const bb*,
                     std::pair< std::vector<std::string>,std::vector<std::string> > >& block_comment_map
                     ) {
  llvm::legacy::PassManager passMan;
  passMan.add( llvm::createPromoteMemoryToRegisterPass() );
  passMan.add( llvm::createLoopRotatePass() ); // some params
  passMan.add( llvm::createAlwaysInlinerLegacyPass() );
  if( o.unwind && o.llvm_unroll ) {
    // Work around due to a bug in interface since LLVM 4.0 =======
    // setting unroll count via commmand line parsing
    std::string ustr = "-unroll-count=" + std::to_string(o.loop_unroll_count);
    setLLVMConfigViaCommandLineOptions( ustr );
    // ============================================================
    passMan.add( llvm::createLoopUnrollPass( 0, 100, o.loop_unroll_count ) );
  }
  if( o.dump_cfg ){
    //change current folder
    passMan.add( llvm::createCFGPrinterLegacyPassPass() );
  }
  passMan.run( *module.get() );

  estimate_comment_location( module, comments, block_comment_map );
}

void run_bmc( std::unique_ptr<llvm::Module>& module,
              std::vector<comment>& comments,
              options& o, z3::context& z3_ctx,
              value_expr_map& def_map_,
              std::map<llvm::Loop*, loopdata*>& ld_map,
              name_map& lMap,
              std::map<std::string, llvm::Value*>& evMap)
{
  std::map<const bb*,
           std::pair<std::vector<std::string>,std::vector<std::string> > >
    bb_cmt_map;
  prepare_module( o, module, comments, bb_cmt_map);
  bmc b(module, bb_cmt_map, o, z3_ctx, def_map_, ld_map, lMap, evMap);
  b.init_glb();
  b.run_bmc_pass();
}

int main(int argc, char** argv) {
  print("hello!");

  std::unique_ptr<llvm::Module> module;
  std::vector< comment > comments;
  parse_cpp_file(module, o, comments );
  if( o.verbosity > 8 ) {
    module->print( llvm::outs(), nullptr );
  }

  run_bmc( module, comments, o, z3_ctx, def_map, ld_map, local_name_map,
           expr_val_map);

}
