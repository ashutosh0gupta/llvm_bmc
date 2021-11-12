#include "include/options.h"
#include "include/bmc.h"

//------------------------------------------
// todo: remove the following header
#include "lib/utils/llvm_utils.h"
//----------------------------------------

#include <boost/filesystem.hpp>

#include <iostream>
#include <sstream>
#include <fstream>

#include <boost/algorithm/string.hpp>
#include <boost/filesystem/fstream.hpp>
#include <boost/filesystem.hpp>

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

   //passMan.add( llvm::createAlwaysInlinerLegacyPass() );
  if( o.unwind && o.llvm_unroll ) {
    // Work around due to a bug in interface since LLVM 4.0 =======
    // setting unroll count via commmand line parsing
    std::string ustr = "-unroll-count=" + std::to_string(o.loop_unroll_count);
    setLLVMConfigViaCommandLineOptions( ustr );
    // ============================================================
    passMan.add( llvm::createLoopUnrollPass( 2,
                                             false, //OnlyWhenForced
                                             false, // ForgetAllSCEV
                                             30000,  // threshold
                                             o.loop_unroll_count // Count
                                             ) );
  }

  for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
    // todo: remove dependency on demangle from llvm_utils
    std::string fname = demangle(fit->getName().str());
    if(fname == o.funcName) {
      // Do nothing
    }else{
      // declare all non entry functions can be inlined
      if( !fit->isDeclaration() ) {
        // function has a body available
        //fit->addFnAttr(llvm::Attribute::AlwaysInline);
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
  prepare_module( o, module, cmts, bb_cmt_map );
  bmc b( module, bb_cmt_map, o );

  // initialize bmc data structure
  b.init();

  // process the spec file
  import_spec_file( module, o, b);

  //translate function to formulas
  b.run_bmc_pass();

 for( auto& it : b.func_formula_map ) {
   b.check_all_spec( it.second );
 }

  // bool verify_result = b.verify_prop();

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

  if( o.is_input_c() ){
    module = c2ir( o, cmts);
  }else if( o.is_input_llvm_asm() ) {
    module = asm2ir( o, cmts);
  }
  if( module == nullptr ) {
    llvm_bmc_error( "BMC", "failed to parse input successfully!" );
  }
  if( o.verbosity > 8 ) {
    module->print( llvm::outs(), nullptr );
  }
  // try {
    run_bmc( module, cmts, o );
  // }catch(...){
  //   llvm_bmc_error( "BMC", "some exception is thrown!" );
  // }
 
}
