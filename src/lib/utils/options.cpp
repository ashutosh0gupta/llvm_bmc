#include<string>
#include "include/options.h"
#include "lib/utils/utils.h"

namespace po = boost::program_options;

options::options( solver_context& sol_ctx_ ) : solver_ctx(sol_ctx_),mem_enc(sol_ctx_) {};

void options::show_help(po::options_description& desc) {
      std::cout << "\n\tllvmbmc - BMC library";
      // std::cout << "\n\tSupratik Chakraborty, Ashutosh Gupta, Divyesh Unadkat\n\n";
      std::cout << "Usage:\n\n";
      std::cout << "llvmbmc [-h] [--help]\t\t    Show help \n";
      std::cout << "llvmbmc [Options] file.c ...\n";
      std::cout << desc << "\n";
}

void options::get_description_cmd(po::options_description& config,
                                  po::options_description& cmdline,
                                  po::options_description& hlp,
                                  po::positional_options_description& pd){

  po::options_description generic("Generic Options");
  // po::options_description tiler("llvm_bmc Options");
  po::options_description bmc("LLVM BMC Options");
  po::options_description hidden("Hidden Options");
  // todo : check if the systems is windows: find another default outDirPath
  // /tmp ~/tmp ./tmp ./
  // todo : in release mode dump in ./
  bmc.add_options()
    ("function,f", po::value(&funcName)->default_value("main"), "Set main function")
    ("mode,m", po::value<int>(&mode)->default_value(3), "Set mode")
    ("get-witness,w",  po::bool_switch(&witness), "Report error trace if a specification fails")
    ("output-dir,o", po::value(&outDirPath)->default_value("/tmp/"), "Set output directory")
    // ("loop,l", po::value<int>(&loopNum)->default_value(1), "Set loop")
    // ("total-loops,t", po::value<int>(&totalLoops)->default_value(1), "Set total number of loops")
    // ("aggregation,a", po::bool_switch(&loop_aggr), "Run aggregation algorithm on loop")
    ("dump-solver-query", po::bool_switch(&dump_solver_query), "Dump the formulas generated")
    ("dump-cfg,d", po::bool_switch(&dump_cfg), "Dump the llvm control flow graph")
    ("config,c", po::value<std::string>(), "Set config file")
    ("unwind,u", po::value<int>(&loop_unroll_count)->default_value(1), "Set loop unroll count")
    ("use-bv,b", po::bool_switch(&bit_precise), "Use bit-vectors to represent numbers!")
    ("bounds-check,n", po::bool_switch(&include_out_of_bound_specs), "Enable array-index-out-of-bounds check")
    ("overflow-check,l", po::bool_switch(&include_overflow_specs), "Enable over/underflow check")
    ("unreach-check", po::bool_switch(&include_unreach_specs), "Enable unreachable instructions check")
    ("abstract-float,a", po::bool_switch(&abstract_floats), "Treat floating point operations as unknown functions")
    ("include-dirs,I", po::value< std::vector<std::string> >(&include_dirs), "Location of include files")
    ("specifications,s", po::value(&specFilePath), "Set spec file")
    ("kbound,k", po::bool_switch(&kbound), "Run k-context bounded verification")
    ("context-bound",  po::value<int>(&ctx_bound)->default_value(10), "Run k-context bounded verification")
    ("sc-thread", po::value< std::vector<std::string> >(&sc_threads), "Thread will have only SC behavior")
    ("memory-model",  po::value<std::string>(&memory_model), "Run k-context bounded verification")
    ("psystems,p", po::bool_switch(&psystems), "Run parameterized verification")
    ("use-solver",  po::value(&use_solver)->default_value("z3") ,"Use cvc5 or boolector (z3 is default)")
    ("get-solver-model",  po::bool_switch(&get_solver_model), "Dump solver model (for debug)")
    ;
  hidden.add_options()
    ("input,i", po::value(&filePath), "Set source files")
    ;
  generic.add_options()
    ("version", "Print version string")
    ("verbose,v", po::value<int>(&verbosity)->default_value(0), "Set verbosity level")
    ("help,h", "Print help")
    ;
  pd.add("input", -1);

  config.add(bmc).add(hidden);
  cmdline.add(config).add(generic);
  hlp.add(bmc).add(generic);
}

void options::interpret_options(po::variables_map& vm) {
  if (vm.count("input")) {
    boost::filesystem::path cf( filePath);
    fileName = cf.filename().string();
  }
  if (vm.count("unwind")) {
    unwind = true;
  }
  if( loop_aggr && mode == 3 ) {
    mode = 5;
  }
  if (vm.count("specifications")) {
    boost::filesystem::path sf( specFilePath);
    specFileName = sf.filename().string();
    check_spec = true;
  }
  if( check_spec == false ) {
    boost::filesystem::path cf( filePath);
    cf.replace_extension("spec");
    // cf += ();
    if (boost::filesystem::exists( cf )) {
      std::cout << "Auto detected spec file " << cf <<"\n";
      specFilePath = cf.string();
      specFileName = cf.filename().string();
      check_spec = true;
    }
  }
}

void options::parse_config(boost::filesystem::path filename) {
  boost::filesystem::ifstream cfg_file(filename);
  po::variables_map vm;
  po::options_description config;
  po::options_description cmdline;
  po::options_description hlp;
  po::positional_options_description pd;

  get_description_cmd(config, cmdline, hlp, pd);
  po::notify(vm);
  try {
    po::store(po::parse_config_file(cfg_file, config, false), vm);
    po::notify(vm);
    interpret_options(vm);
  } catch ( const boost::program_options::error& e ) {
    llvm_bmc_error("config options", e.what());
  }
}

bool options::is_input_c() {
  boost::filesystem::path p(fileName);
  auto ext = p.extension().string();
  // std::cerr << ext;
  if( ext == ".c" || ext == ".C" || ext == ".cpp" ) {
    return true;
  }
  return false;
}

bool options::is_input_llvm_asm() {
  boost::filesystem::path p(fileName);
  auto ext = p.extension().string();
  if( ext == ".s" ) {
    return true;
  }
  return false;
}

bool options::parse_cmdline(int argc, char** argv) {
  po::variables_map vm;
  po::options_description config;
  po::options_description cmdline;
  po::options_description hlp;
  po::positional_options_description pd;

  get_description_cmd(config, cmdline, hlp, pd);
  try {
    po::store(po::command_line_parser(argc, argv).options(cmdline).positional(pd).run(), vm);
    po::notify(vm);
    if (vm.count("version")) {
      std::cout << "\nTiler Version : " << llvm_bmc_version << "\n\n";
      return false;
    }
    if (vm.count("help")) {
      show_help(hlp);
      return false;
    }
    if (!vm.count("input")) {
      std::cout << "\n\nNo input file specified ! \n";
      exit(1);
    }
    if (vm.count("config")) {
      boost::filesystem::path path(vm["config"].as<std::string>());
      parse_config(path);
    }
    interpret_options(vm);

  } catch ( const boost::program_options::error& e ) {
    llvm_bmc_error("command-line options", e.what());
    return false;
  }

  if( use_solver == "boolector" && bit_precise == false)
    llvm_bmc_error( "BMC", "Boolector works only with bitvectors, run with -b" );
  return true;
}
