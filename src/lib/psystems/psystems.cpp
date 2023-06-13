#include "lib/psystems/psystems.h"
#include "include/bmc.h"
#include "llvm/IR/DataLayout.h"
#include "verifier.cpp"

#define PSYSTEMS_UNSUPPORTED_INSTRUCTIONS(InstTYPE, Inst)        \
    if (llvm::isa<llvm::InstTYPE>(Inst))                         \
    {                                                            \
        std::cerr << "Occuring in block:\n";                     \
        LLVM_DUMP(Inst->getParent())                             \
        LLVM_DUMP(Inst)                                          \
        llvm_bmc_error("psystems", "Unsupported instruction!!"); \
    }

typedef std::vector<std::string> svec;

char psystems::ID = 0;


psystems::psystems(options &o_, std::unique_ptr<llvm::Module> &m_,
                   bmc &bmc_)
    : bmc_pass(o_, o_.solver_ctx, bmc_), llvm::FunctionPass(ID), module(m_), ofcpp(o_.outDirPath.string() + "/cbmc.cpp"), current_indent(0), ncontext(o.ctx_bound), init_state(0), bad_min({5, 5})
{
    // hardcoding Szymanski post - eventually will want to do this in psystems::runOnFunction
    rules.local_rules.push_back(transition(0, 1));
    rules.global_rules.push_back(global_rule(FORALL, NEQ, {0, 1, 2}, transition(1, 3)));
    rules.global_rules.push_back(global_rule(EXISTS, NEQ, {1}, transition(3, 2)));
    rules.global_rules.push_back(global_rule(EXISTS, NEQ, {4, 5}, transition(2, 4)));
    rules.global_rules.push_back(global_rule(FORALL, LT, {0, 1}, transition(4, 5)));
    rules.global_rules.push_back(global_rule(FORALL, GT, {0, 1, 4, 5}, transition(5, 0)));
}

psystems::~psystems() {}

void psystems::getAnalysisUsage(llvm::AnalysisUsage &au) const
{
    au.setPreservesAll();
    au.addRequired<llvm::LoopInfoWrapperPass>();
}

llvm::StringRef psystems::getPassName() const
{
    return "runs PSYSTEMS verification!";
}

std::string psystems::getInstructionString(const llvm::Instruction &inst)
{
    std::string gis;
    llvm::raw_string_ostream StringStream(gis);
    inst.print(StringStream);
    return StringStream.str();
}

std::string psystems::getBasicBlockString(const llvm::BasicBlock &bb)
{
    std::string gis;
    llvm::raw_string_ostream StringStream(gis);
    bb.print(StringStream);
    return StringStream.str();
}

bool psystems::runOnFunction(llvm::Function &f)
{
    EntryFn = demangle(f.getName().str());
    // A function can be launched at many locations
    // we need to run that many copies
    std::vector<unsigned> f_tids;
    unsigned j = 0;
    for (; j < bmc_obj.sys_spec.threads.size(); j++)
    {
        if (bmc_obj.sys_spec.threads[j].entry_function == EntryFn)
            f_tids.push_back(j);
        // break;
    }

    // The parameter here is the number of threads which is assumed to be the limit of for loops
    // Assume identical threads are launched from the main thread at the same time
    // Assume flag variable captures the state of the thread completely
    // Assume initially all flags are 0
    // Assume a linear topology
    // Assume all for loops are checks (except the one in critical section)
    // Assume the name of the called function is known ("szymanski" in this case)
    // Assume the variable id represents id of the thread
    // Assume L0, L1, L2, L3, L4, L5 are the main checkpoints
    // Flag changes on passing these checkpoints
    // We have to figure out how the flag changes and what are the conditions of passing the checkpoint
    if(EntryFn == "szymanski")
    {
        std::cout << "System is" << (verify() ? " safe." : " unsafe.") << std::endl;
    }
    return false;
}

