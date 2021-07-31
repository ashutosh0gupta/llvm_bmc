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

#include "include/options.h"

#include <string.h>
#include<iostream>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include "include/parser_data.h"

class verify_prop_pass : public llvm::ModulePass {

public:
  static char ID;
  std::string fname1, fname2;
  llvm::Value *invokedFn_Val, *i32_val0, *i32_val1, *i32_val2;
  llvm::GlobalVariable *monitor_var = NULL;
  llvm::GlobalVariable *val0_var = NULL;
  llvm::GlobalVariable *val1_var = NULL;
  llvm::GlobalVariable *val2_var = NULL;
  
  std::string ThName, EntryFnName;
  std::string monitor_var_name = "invoked_functionFoo";
  std::string var0_name = "val0";
  std::string var1_name = "val1";
  std::string var2_name = "val2";
  std::string cmp_res_name = "cmp_res_var";

public:
  verify_prop_pass(llvm::Module &m, options& o);
  ~verify_prop_pass();

  void init_parse(llvm::Module &m, options& o);
  void insert_monitor(llvm::Module &m, std::string Fn1, std::string Fn2);
  virtual bool runOnModule(llvm::Module &m); //when there is a Module
  virtual bool runOnFunction(llvm::Function &f); //called by runOnModule

  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};


