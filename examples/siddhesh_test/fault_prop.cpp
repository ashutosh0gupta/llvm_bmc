#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include <cstdlib>
#include <iostream>
#include <llvm-20/llvm/ADT/SmallVector.h>
#include <llvm-20/llvm/IR/Function.h>
#include <llvm-20/llvm/Transforms/Utils/ValueMapper.h>
#include <memory>

using namespace llvm;

void run_command(const std::string &cmd) {
  std::cout << "[CMD] " << cmd << std::endl;
  int ret = system(cmd.c_str());
  if (ret != 0) {
    std::cerr << "Command failed!\n";
    exit(1);
  }
}

class SkipAddPass : public PassInfoMixin<SkipAddPass> {
public:
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {

    bool modified = false;

    for (auto &F : M) {
      for (auto &BB : F) {
        for (auto it = BB.begin(); it != BB.end();) {
          Instruction *I = &*it++;

          if (auto *binOp = dyn_cast<BinaryOperator>(I)) {
            if (binOp->getOpcode() == Instruction::Add) {

              Value *b = binOp->getOperand(0);

              Value *faulty = b;

              binOp->replaceAllUsesWith(faulty);
              binOp->eraseFromParent();

              std::cout << "[Fault] Skipped add in function: "
                        << F.getName().str() << "\n";

              modified = true;
              goto done;
            }
          }
        }
      }
    }

  done:
    if (modified)
      return PreservedAnalyses::none();
    else
      return PreservedAnalyses::all();
  }
};

void dump_module(Module &M, const std::string &filename) {
  std::error_code EC;
  raw_fd_ostream out(filename, EC);
  M.print(out, nullptr);
  out.close();
}

std::unique_ptr<Module> extractFunction(Module &M, Function *F) {
  LLVMContext &ctx = M.getContext();
  auto newMod = std::make_unique<Module>(F->getName().str(), ctx);
  ValueToValueMapTy VMap;
  Function *newF =
      Function::Create(F->getFunctionType(), Function::ExternalLinkage,
                       F->getName(), newMod.get());
  outs() << newF->getName();

  auto dest = newF->arg_begin();
  for (const Argument &arg : F->args()) {
    dest->setName(arg.getName());
    VMap[&arg] = &*dest++;
  }
  SmallVector<ReturnInst *, 8> ret;
  CloneFunctionInto(newF, F, VMap, CloneFunctionChangeType::LocalChangesOnly,
                    ret);
  outs() << newF->getName();
  return newMod;
}

int main(int argc, char **argv) {

  if (argc < 2) {
    std::cerr << "Usage: ./fault_prop input.ll\n";
    return 1;
  }

  std::string inputFile = argv[1];

  LLVMContext ctx;
  SMDiagnostic err;

  auto module = parseIRFile(inputFile, err, ctx);
  if (!module) {
    err.print("error", errs());
    return 1;
  }

  Function *target = module->getFunction("test");
  auto funcModule = extractFunction(*module, target);
  // llvm::outs(*funcModule);
  if (!funcModule) {
    err.print("error", errs());
    return 1;
  }

  dump_module(*funcModule, "../original.ll");
  // auto mod = parseIRFile("original.ll", err, ctx);
  // outs() << *mod;


  // TODO : Gives error for llvm_bmc, cant parse funcIR to module. 
  
  run_command("../llvmbmc ../original.ll --dump-solver-query -f test");
  run_command("cp /tmp/test.smt2 ../correct.smt2");

  LoopAnalysisManager LAM;
  FunctionAnalysisManager FAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;

  PassBuilder PB;

  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

  ModulePassManager MPM;
  MPM.addPass(SkipAddPass());

  MPM.run(*funcModule, MAM);

  dump_module(*funcModule, "../faulty.ll");

  run_command("../llvmbmc ../faulty.ll --dump-solver-query -f test");
  run_command("cp /tmp/test.smt2 ../faulty.smt2");

  return 0;
}