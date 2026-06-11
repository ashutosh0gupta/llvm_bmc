#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include <array>
#include <cstdio>
#include <cstdlib>
#include <iostream>
// #include <llvm-20/llvm/ADT/SmallVector.h>
// #include <llvm-20/llvm/IR/Function.h>
// #include <llvm-20/llvm/IR/InstrTypes.h>
// #include <llvm-20/llvm/Support/Casting.h>
// #include <llvm-20/llvm/Transforms/Utils/ValueMapper.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/Support/Casting.h>
#include <llvm/Transforms/Utils/ValueMapper.h>
#include <memory>
#include <vector>

using namespace llvm;
void run_command(const std::string &cmd) {
  int ret = system(cmd.c_str());
  if (ret != 0) {
    std::cerr << "Command failed!\n";
    exit(1);
  }
}

// Capture stdout+stderr from a command, return output string and exit code
std::string run_command_capture(const std::string &cmd, int &exitCode) {
  std::string fullCmd = cmd + " 2>&1";
  FILE *pipe = popen(fullCmd.c_str(), "r");
  if (!pipe) {
    exitCode = -1;
    return "popen failed";
  }
  std::string output;
  std::array<char, 256> buf;
  while (fgets(buf.data(), buf.size(), pipe)) {
    output += buf.data();
  }
  int status = pclose(pipe);
  exitCode = WIFEXITED(status) ? WEXITSTATUS(status) : -1;
  return output;
}

enum class VerificationResult { Success, Failed, Error };

const char *verificationResultStr(VerificationResult vr) {
  switch (vr) {
  case VerificationResult::Success:
    return "LEAKAGE";
  case VerificationResult::Failed:
    return "NO_LEAKAGE";
  case VerificationResult::Error:
    return "ERROR";
  }
  return "UNKNOWN";
}

// Result of applying one fault model
struct FaultResult {
  std::string modelName;     // e.g. "undef", "0", "1", "operand b", "operand c"
  std::string functionName;  // function where fault was injected
  std::string originalInstr; // e.g. "%a = add i32 %b, %c"
  std::string faultyValueDesc; // e.g. "undef", "i32 0", "%b"
  std::string operand0Name;    // name of operand b
  std::string operand1Name;    // name of operand c
  VerificationResult verification;
  std::string llFile;
  std::string smt2File;
};
// Fault models for skipping an add: a = b + c
// Possible faulty results: undef, 0, 1, b, c
enum class FaultModel { Undef, Zero, One, OpB, OpC };

class SkipAddPass : public PassInfoMixin<SkipAddPass> {
  FaultModel FM;
  FaultResult *Result; // where to store the result (owned by caller)

  // Helper: get a printable name for an LLVM Value
  static std::string valueName(Value *V) {
    if (V->hasName())
      return "%" + V->getName().str();
    // Print the value to a string
    std::string s;
    raw_string_ostream os(s);
    V->printAsOperand(os, false);
    return os.str();
  }

  // Helper: print full instruction text
  static std::string instrString(Instruction *I) {
    std::string s;
    raw_string_ostream os(s);
    I->print(os);
    return os.str();
  }

public:
  explicit SkipAddPass(FaultModel FM = FaultModel::OpB,
                       FaultResult *Result = nullptr)
      : FM(FM), Result(Result) {}

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {

    bool modified = false;

    for (auto &F : M) {
      for (auto &BB : F) {
        for (auto it = BB.begin(); it != BB.end();) {
          Instruction *I = &*it++;

          if (auto *binOp = dyn_cast<BinaryOperator>(I)) {
            if (binOp->getOpcode() == Instruction::Add) {

              Value *b = binOp->getOperand(0);
              Value *c = binOp->getOperand(1);
              Type *ty = binOp->getType();

              Value *faulty = nullptr;
              std::string faultyDesc;

              switch (FM) {
              case FaultModel::Undef:
                faulty = UndefValue::get(ty);
                faultyDesc = "undef";
                break;
              case FaultModel::Zero:
                faulty = ConstantInt::get(ty, 0);
                faultyDesc = "i32 0";
                break;
              case FaultModel::One:
                faulty = ConstantInt::get(ty, 1);
                faultyDesc = "i32 1";
                break;
              case FaultModel::OpB:
                faulty = b;
                faultyDesc = valueName(b);
                break;
              case FaultModel::OpC:
                faulty = c;
                faultyDesc = valueName(c);
                break;
              }

              // Store result metadata before erasing
              if (Result) {
                Result->functionName = F.getName().str();
                Result->originalInstr = instrString(binOp);
                Result->faultyValueDesc = faultyDesc;
                Result->operand0Name = valueName(b);
                Result->operand1Name = valueName(c);
              }

              binOp->replaceAllUsesWith(faulty);
              binOp->eraseFromParent();

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
  auto newMod = CloneModule(M);
  for (auto it = newMod->begin(); it != newMod->end();) {
    Function &F2 = *it++;
    if (F2.isDeclaration())
      continue;
    if (F2.getName() != F->getName())
      F2.eraseFromParent();
  }
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
  if (!target) {
    errs() << "Function 'test' not found in input module\n";
    errs() << "Available functions:\n";
    for (Function &F : *module) {
      errs() << "  " << F.getName() << (F.isDeclaration() ? " [decl]" : "")
             << "\n";
    }
    return 1;
  }

  auto funcModule = extractFunction(*module, target);
  if (!funcModule) {
    errs() << "Failed to create extracted module\n";
    return 1;
  }

  dump_module(*funcModule, "../original.ll");
  // auto mod = parseIRFile("original.ll", err, ctx);
  // outs() << *funcModule;

  run_command("../llvmbmc ../original.ll --dump-solver-query -f test");
  run_command("cp /tmp/test.smt2 ../correct.smt2");

  struct FaultEntry {
    FaultModel model;
    const char *name;
  };

  FaultEntry faults[] = {
      {FaultModel::Undef, "undef"}, {FaultModel::Zero, "zero"},
      {FaultModel::One, "one"},     {FaultModel::OpB, "opB"},
      {FaultModel::OpC, "opC"},
  };

  std::vector<FaultResult> results;

  for (auto &fe : faults) {
    FaultResult result;
    result.modelName = fe.name;

    auto cloned = CloneModule(*funcModule);

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
    MPM.addPass(SkipAddPass(fe.model, &result));
    MPM.run(*cloned, MAM);

    std::string llFile = std::string("../faulty_") + fe.name + ".ll";
    std::string smt2File = std::string("../faulty_") + fe.name + ".smt2";
    result.llFile = llFile;
    result.smt2File = smt2File;

    dump_module(*cloned, llFile);

    int exitCode = 0;
    std::string bmcOutput = run_command_capture(
        "../llvmbmc " + llFile + " --dump-solver-query -f test", exitCode);
    run_command("cp /tmp/test.smt2 " + smt2File);

    if (bmcOutput.find("LLVM_BMC_VERIFICATION_SUCCESSFUL") != std::string::npos)
      result.verification = VerificationResult::Success;
    else if (bmcOutput.find("LLVM_BMC_VERIFICATION_FAILED") !=
             std::string::npos)
      result.verification = VerificationResult::Failed;
    else
      result.verification = VerificationResult::Error;

    results.push_back(std::move(result));
  }

  std::cout << "\n";
  std::cout
      << "              Fault Injection Summary                        \n";

  for (auto &r : results) {
    std::cout << " Model   : " << r.modelName;
    for (size_t i = r.modelName.size(); i < 49; ++i)
      std::cout << ' ';
    std::cout << "\n";

    std::cout << " Function: " << r.functionName;
    for (size_t i = r.functionName.size(); i < 49; ++i)
      std::cout << ' ';
    std::cout << "\n";

    std::cout << " Instr   :" << r.originalInstr;
    // originalInstr already has leading space from LLVM print
    size_t instrLen = r.originalInstr.size();
    if (instrLen < 50)
      for (size_t i = instrLen; i < 50; ++i)
        std::cout << ' ';
    std::cout << "\n";

    std::cout << " Replaced: a = " << r.faultyValueDesc;
    for (size_t i = r.faultyValueDesc.size(); i < 45; ++i)
      std::cout << ' ';
    std::cout << "\n";

    std::cout << " Operands: b=" << r.operand0Name << "  c=" << r.operand1Name;
    size_t opLen = 2 + r.operand0Name.size() + 4 + r.operand1Name.size();
    for (size_t i = opLen; i < 47; ++i)
      std::cout << ' ';
    std::cout << "\n";

    std::cout << "Result  : " << verificationResultStr(r.verification);
    size_t vrLen = std::string(verificationResultStr(r.verification)).size();
    for (size_t i = vrLen; i < 49; ++i)
      std::cout << ' ';
    std::cout << "\n";

    std::cout << "\n\n";
  }

  return 0;
}