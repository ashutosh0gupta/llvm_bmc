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
#include "lib/bmc/bmc_pass.h"

#include <string.h>
#include<iostream>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>
#include "include/parser_data.h"

class verify_prop_pass : public bmc_pass, public llvm::FunctionPass {

public:
  static char ID;
  std::string fname1, fname2;
  llvm::Value *invokedFn_Val[20], *i32_val0, *i32_val1, *i32_val2;
  llvm::GlobalVariable *monitor_var[20] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
  llvm::GlobalVariable *val0_var = NULL;
  llvm::GlobalVariable *val1_var = NULL;
  llvm::GlobalVariable *val2_var = NULL;
  
  std::string ThName, EntryFnName;
  std::string monitor_var_name[20] = {"var1", "var2", "var3", "var4", "var5", "var6", "var7", "var8", "var9", "var10", "var11", "var12", "var13", "var14", "var15", "var16", "var17", "var18", "var19", "var20"};
  std::string var0_name = "val0";
  std::string var1_name = "val1";
  std::string var2_name = "val2";
  std::string cmp_res_name[20] = {"cvar1", "cvar2", "cvar3", "cvar4", "cvar5", "cvar6", "cvar7", "cvar8", "cvar9", "cvar10", "cvar11", "cvar12", "cvar13", "cvar14", "cvar15", "cvar16", "cvar17", "cvar18", "cvar19", "cvar20"};

  int callseq_num = -1;
  bmc& bmc_obj;

public:
  verify_prop_pass(llvm::Module &m, options& o, bmc& b_);
  ~verify_prop_pass();

  void init_parse(llvm::Module &m, options& o);
  void insert_monitor(llvm::Module &m, std::string Fn1, std::string Fn2);
  //virtual bool runOnModule(llvm::Module &m); //when there is a Module
  virtual bool runOnFunction(llvm::Function &f); //called by runOnModule

  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};


