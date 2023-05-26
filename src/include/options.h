#ifndef OPTIONS_H
#define OPTIONS_H

#include<iostream>
#include<include/solver.h>
#include<include/memory_cons.h>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/IR/LLVMContext.h"
#pragma GCC diagnostic pop

#include <boost/program_options.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include <string>
#include <map>
#include <vector>


namespace po = boost::program_options;

enum array_model_t{
  NONE,
  FULL,        // full model using store and select
  FIXED_LEN,   // array has fixed number of 'symbolic' cells
  PARTITION    // vaphor like model
};

enum array_model_memory_arch {
  NOT_DEFINED,
  MULTIPLE,    // Multiple local arrays to represent the memory architecture ( Bad for handing pointers)
  SINGLE       // Single global array 'M' to represnt the memory architectre ( Like in real computers)
};
class options
{
public:
  options( solver_context& sol_ctx_);
  std::string get_input_file() { return filePath; }
  const std::vector<std::string>& get_include_dirs() { return include_dirs; }
  llvm::LLVMContext& get_llvm_context() { return globalContext; }
  solver_context& get_solver_context() { return solver_ctx; }
  std::string get_spec_file() { return specFilePath; }

  // check for input format
  // the tool auto detect via looking at the extension of the input file
  bool is_input_c();
  bool is_input_llvm_asm();
  bool is_input_llvm_bc(); //todo: not fully supported yet

public:
  //todo: some of following show become private
  //---------------------------------------
  solver_context& solver_ctx;
  memory_cons mem_enc; // todo: we all allocating here do we really need to allocate here?

  //---------------------------------------
  //tiler options
  std::string fileName;
  std::string filePath;
  std::string funcName;
  std::string use_solver = "z3";
  std::string specFileName;
  std::string specFilePath;
  std::vector<std::string> include_dirs;
  boost::filesystem::path outDirPath;
  int mode = 0;
  int loopNum = 0;
  int totalLoops = 0;
  bool loop_aggr = false;

  //----------------------------------------
  // configuration for concurrent programs
  bool concurrent = false;
  bool kbound = false;
  bool psystems = false;
  int ctx_bound = 10;


  //----------------------------------------
  //module preprocess options
  bool dump_cfg = 0;
  bool dump_solver_query = 0;
  bool get_solver_model = 0;
  bool witness = 0;

  //----------------------------------------
  //generic options
  int verbosity = 0;
  std::string llvm_bmc_version = "1.0";
  int loop_unroll_count = 1;
  bool unwind=false;
  bool llvm_unroll=true; // selects between llvm_unroll or native

  //----------------------------------------
  //bmc options
  bool include_out_of_bound_specs=false;
  bool include_overflow_specs=false;
  bool include_unreach_specs=false;
  array_model_t ar_model = FULL;
  bool bit_precise = false; // model integers as true "int" or bit vectors
  bool check_spec = false;
  bool abstract_floats = false; //abstract away floating point computations
  //----------------------------------------

  llvm::LLVMContext globalContext;

  void parse_config(boost::filesystem::path);
  bool parse_cmdline(int, char**);

private:
  void get_description_cmd(po::options_description& ,
                           po::options_description& ,
                           po::options_description& ,
                           po::positional_options_description&);
  void interpret_options(po::variables_map&);
  void show_help(po::options_description&);
};

#endif
