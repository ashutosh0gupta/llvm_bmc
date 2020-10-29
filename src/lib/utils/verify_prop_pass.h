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

class verify_prop_pass : public llvm::ModulePass {

public:
  static char ID;
  std::string fname;
  llvm::Value *invokedFn_Val;

public:
  verify_prop_pass(llvm::Module &m, options& o);
  ~verify_prop_pass();

  void insert_monitor(llvm::Module &m, std::string FnName);
  virtual bool runOnModule(llvm::Module &m); //when there is a Module
  virtual bool runOnFunction(llvm::Function &f); //called by runOnModule

  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
};


