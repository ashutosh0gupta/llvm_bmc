#include "include/options.h"
#include "include/bmc.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/Transforms/Utils/Cloning.h"
#pragma GCC diagnostic pop

void prepare_module( options& o,
                       std::unique_ptr<llvm::Module>& module,
                       std::vector<comment>& cmts,
                       std::map< const bb*, comments> & block_comment_map
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
  passMan.run( *module.get() );

  estimate_comment_location( module, cmts, block_comment_map );

  if( o.dump_cfg ) {
    dump_dot_module( o.outDirPath, module );
  }
}

void run_bmc( std::unique_ptr<llvm::Module>& module,
              std::vector<comment>& cmts,
              options& o )
{

  std::map<const bb*, comments > bb_cmt_map;
  prepare_module( o, module, cmts, bb_cmt_map);
  bmc b( module, bb_cmt_map, o );
  b.init_glb();
  b.run_bmc_pass();
  for( auto& it : b.func_formula_map ) {
    b.check_all_spec( it.second );
  }
}

int main(int argc, char** argv) {
  z3::context solver_ctx;
  options o(solver_ctx);
  boost::filesystem::path def_config("default.conf");
  if ( boost::filesystem::exists( def_config ) ) {
    o.parse_config(def_config);
  }

  if (!o.parse_cmdline(argc, argv)) return 0; // help was called

  std::unique_ptr<llvm::Module> module;
  std::vector< comment > comments;

  module = c2ir( o.filePath, o.globalContext, comments);

  if( o.verbosity > 8 ) {
    module->print( llvm::outs(), nullptr );
  }

  run_bmc( module, comments, o);
}
