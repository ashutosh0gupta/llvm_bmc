#include "include/options.h"
#include "include/bmc.h"
#include "lib/utils/llvm_utils.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/LinkAllPasses.h"

void prepare_module( options& o,
                     std::unique_ptr<llvm::Module>& module,
                     comments& cmts,
                     std::map< const llvm::BasicBlock*, comments>&
                     block_comment_map ) {
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

  for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
    std::string fname = demangle(fit->getName().str()); 
    if(fname == o.funcName) {
      // Do nothing
    }else{
      // declare all non entry functions can be inlined
      if( !fit->isDeclaration() ) {
        // function has a body available
        fit->addFnAttr(llvm::Attribute::AlwaysInline);
      }
    }
  }

  passMan.run( *module.get() );

  estimate_comment_location( module, cmts, block_comment_map );

  if( o.dump_cfg ) {
    dump_dot_module( o.outDirPath, module );
  }
}

void run_bmc( std::unique_ptr<llvm::Module>& module,
              comments& cmts,
              options& o )
{

  std::map<const llvm::BasicBlock*, comments > bb_cmt_map;
  prepare_module( o, module, cmts, bb_cmt_map);
  bmc b( module, bb_cmt_map, o );
  b.init();
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
  comments cmts;

  module = c2ir( o, cmts);

  if( o.verbosity > 8 ) {
    module->print( llvm::outs(), nullptr );
  }

  run_bmc( module, cmts, o);
}
