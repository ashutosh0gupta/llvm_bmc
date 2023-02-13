#include "lib/utils/llvm_utils.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/LinkAllPasses.h"

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Support/raw_ostream.h"
#include "include/options.h"
using namespace llvm;

namespace {
  class collectPointsToData : public FunctionPass {

  public:
    static char ID;
    options& o;

    bool runOnFunction(llvm::Function &F)
    {
      using namespace llvm;

      llvm::AliasSetTracker AST(getAnalysis<llvm::AAResultsWrapperPass>().getAAResults());

      for (auto &BB : F) {
        for (auto &I : BB) {
          AST.add(&I);
        }
      }

      for (auto &AS : AST) {
        errs() << "Points-to set for:\n";
        errs() << "Instruction = " << *AS.begin()->getValue() << "\n";
        errs() << "Pointer Name = " << AS.begin()->getValue()->getName() << "\n";
        errs() << "Pointer Type = " << *AS.begin()->getValue()->getType() << "\n";

        if (auto *GEP = dyn_cast<GetElementPtrInst>(AS.begin()->getValue())) {
          errs() << "Pointer Points To Type = " << *GEP->getPointerOperand()->getType()->getPointerElementType() << "\n";
        }
        errs() << "Number of Aliased Pointers = " << AS.size() << "\n";
        errs()<<"\n";
        errs() << "Points-to Set:\n";
        for (auto &Pointer : AS) {
          errs() << "Instruction = " << *Pointer.getValue() << "\n";
          errs() << "Pointer Name = " << Pointer.getValue()->getName() << "\n";

          if (auto *GEP = dyn_cast<GetElementPtrInst>(Pointer.getValue())) {
            errs() << "Pointer Points To Type = " << *GEP->getPointerOperand()->getType()->getPointerElementType() << "\n";
          }
          errs() << "Pointer Address = " << Pointer.getValue() << "\n\n";
          errs()<<"\n";
        }
      }

      return false;
    }

    collectPointsToData(options& o_)
      : FunctionPass(ID)
      , o(o_)
    {}

    ~collectPointsToData() {}

    bool doInitialization(Module &M) {
      return false; // did not modify the loop
    }

    bool doFinalization(Module &M) {
      return false; // did not modify the loop
    }

    void getAnalysisUsage(AnalysisUsage &au) const {
      au.setPreservesAll();
      au.addRequired<AAResultsWrapperPass>();
    }
  };
}


char collectPointsToData::ID = 0;
// static RegisterPass<collectPointsToData> X("pointsto", "Points-to information pass");


void points_to_analysis( options& o,
                         std::unique_ptr<llvm::Module>& module )
{
  llvm::legacy::PassManager passMan;
  passMan.add( new collectPointsToData(o) ); // Collecting Points-to data from llvm::setTracker
  passMan.run( *module.get() );
}
