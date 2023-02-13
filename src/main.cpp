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

void forced_unroll_pass( options& o,
                     std::unique_ptr<llvm::Module>& module
                     // comments& cmts,
                     // std::map< const llvm::BasicBlock*, comments>&
                     // block_comment_map
                     ) {
  // basic preprocessing
  // llvm::legacy::PassManager passMan;
  // // passMan.add( llvm::createPromoteMemoryToRegisterPass() );
  // // passMan.add( llvm::createLoopRotatePass() ); // some params
  // // passMan.add( llvm::createAlwaysInlinerLegacyPass() );
  // passMan.add( llvm::createSCCPPass() );
  // passMan.run( *module.get() );

  // for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
  //   // todo: remove dependency on demangle from llvm_utils
  //   std::string fname = demangle(fit->getName().str());
  //   if(fname != o.funcName) {
  //     // declare all non entry functions can be inlined
  //     if( !fit->isDeclaration() ) {
  //       // function has a body available
  //       // fit->addFnAttr(llvm::Attribute::AlwaysInline);
  //     }
  //   }
  // }

  // basic
  llvm::legacy::PassManager passMan_set_count;
  passMan_set_count.add( new set_unroll_counts(o) ); // analyzing loops for unrolling
  passMan_set_count.run( *module.get() );

  llvm::legacy::PassManager passMan_unroll;
  if( o.unwind && o.llvm_unroll ) {
    // Work around due to a bug in interface since LLVM 4.0 =======
    // setting unroll count via commmand line parsing
    // std::string ustr = "-unroll-count=" + std::to_string(o.loop_unroll_count);
    // setLLVMConfigViaCommandLineOptions( ustr );
    // ============================================================
    passMan_unroll.add( llvm::createLoopUnrollPass( 2,
                                             false, //OnlyWhenForced
                                             false, // ForgetAllSCEV
                                             30000,  // threshold
                                             o.loop_unroll_count // Count
                                             ) );
  }
  passMan_unroll.run( *module.get() );

}



void run_bmc( std::unique_ptr<llvm::Module>& module,
              comments& cmts,
              options& o )
{

  std::map<const llvm::BasicBlock*, comments > bb_cmt_map;
  bmc b( module, bb_cmt_map, o );

  prepare_module( module );
  // dump_dot_module( o.outDirPath, module );
  // std::cout << "Dumped model after ModulePreparation\n";
  // process the spec file
  import_spec_file( module, o, b);

  //transform code
  forced_unroll_pass( o, module );
  estimate_comment_location( module, cmts, bb_cmt_map );
  forced_inliner_pass( module );

  //Analyse IR
  points_to_analysis(o, module);

  // initialize bmc data structure
  b.init();

  // process the spec file
  //import_spec_file( module, o, b);

  //translate function to formulas
  if( o.dump_cfg ) {
    dump_dot_module( o.outDirPath, module );
  }

  b.run_bmc_pass();

 if ( b.sys_spec.threads.size() > 1 ) {
    b.check_all_spec_con( );   //Concurrent case
 }
 else {
  for( auto& it : b.func_formula_map ) {
    b.check_all_spec( it.second );  //sequential
  }
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
  //try {
    run_bmc( module, cmts, o );
  //}catch(...){
    //llvm_bmc_error( "BMC", "some exception is thrown!" );
  //}
 
}



