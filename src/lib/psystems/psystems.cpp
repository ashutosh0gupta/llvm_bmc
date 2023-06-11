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
    // rules.local_rules.push_back(std::pair<uint64_t, uint64_t>(0, 1));
    // rules.global_rules.push_back(std::pair<std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t > >(std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >(std::pair<Rules::Quantifier, Rules::Relation>(Rules::Quantifier::forall, Rules::Relation::neq), std::set<uint64_t>({0, 1, 2})), std::pair<uint64_t, uint64_t >(1, 3)));
    // rules.global_rules.push_back(std::pair<std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t > >(std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >(std::pair<Rules::Quantifier, Rules::Relation>(Rules::Quantifier::exists, Rules::Relation::neq), std::set<uint64_t>({1})), std::pair<uint64_t, uint64_t >(3, 2)));
    // rules.global_rules.push_back(std::pair<std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t > >(std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >(std::pair<Rules::Quantifier, Rules::Relation>(Rules::Quantifier::exists, Rules::Relation::neq), std::set<uint64_t>({4, 5})), std::pair<uint64_t, uint64_t >(2, 4)));
    // rules.global_rules.push_back(std::pair<std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t > >(std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >(std::pair<Rules::Quantifier, Rules::Relation>(Rules::Quantifier::forall, Rules::Relation::lt), std::set<uint64_t>({0, 1})), std::pair<uint64_t, uint64_t >(4, 5)));
    // rules.global_rules.push_back(std::pair<std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t > >(std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >(std::pair<Rules::Quantifier, Rules::Relation>(Rules::Quantifier::forall, Rules::Relation::gt), std::set<uint64_t>({0, 1, 4, 5})), std::pair<uint64_t, uint64_t >(5, 0)));
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
        // Remove hardcoding
        bool init_crossed = false;
        std::vector<std::vector<const llvm::BasicBlock *> > blocks; // depends on L0, L1, L2, L3, L4, L5 being the checkpoints, in that order
        for(const auto& bb: f)
        {
            std::string s = getBasicBlockString(bb);
            if(s[1] == 'L')
            {
                init_crossed = true;
                std::vector<const llvm::BasicBlock *> temp;
                temp.push_back(&bb);
                blocks.push_back(temp);
            }
            else if(init_crossed)
            {
                blocks[blocks.size() - 1].push_back(&bb);
            }
        }
        uint64_t prev_state = 0;
        for(uint64_t i = 0; i < blocks.size(); ++i)
        {
            std::pair<uint64_t, uint64_t> transition;
            transition.first = prev_state; // assume flags and code blocks are in same order
            for(auto bb: blocks[i])
            {
                std::string s = getBasicBlockString(*bb);
                uint64_t pos = s.find("store i32 "); // flags is an array of i32 (Also assuming all stores are to flags)
                if(pos != s.npos)
                {
                    transition.second = std::stoi(s.c_str() + pos + std::strlen("store i32 "));
                    prev_state = transition.second;
                }
            }
            if(blocks[i].size() == 1) // no for loops, hence local rule (again assuming all for loops are for checking)
            {
                rules.local_rules.push_back(transition);
                continue;
            }
            Rules::Quantifier q = Rules::Quantifier::forall;
            Rules::Relation r = Rules::Relation::neq;
            std::set<uint64_t> ss;
            for(auto bb: blocks[i])
            {
                for(const auto& inst: *bb)
                {
                    std::string s = getInstructionString(inst);
                    uint64_t pos = s.find("icmp ");
                    if(pos != s.npos)
                    {
                        if(s.find("%1,") == s.npos)
                        {
                            pos += std::strlen("icmp ");
                            if(s[pos] == 'e' && s[pos + 1] == 'q')
                            {
                                q = Rules::Quantifier::exists;
                                auto ppos = s.find(", ") + 2;
                                uint64_t val = std::stoi(s.c_str() + ppos);
                                if(i != 3 && val != 1) ss.insert(val); // ugly hack
                            }
                            else if(s[pos] == 'n' && s[pos + 1] == 'e' && s[pos + 2] == 'q')
                            {
                                auto ppos = s.find(", ") + 2;
                                uint64_t val = std::stoi(s.c_str() + ppos);
                                ss.insert(val);
                            }
                        }
                        else if(s[pos] == 's' && s[pos + 1] == 'l' && s[pos + 2] == 't')
                        {
                            if(s.find("%add") != s.npos) r = Rules::Relation::gt;
                            else r = Rules::Relation::lt;
                        }
                    }
                }
            }
            rules.global_rules.push_back(std::pair<std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t>>(std::pair<std::pair<Rules::Quantifier, Rules::Relation>, std::set<uint64_t> >(std::pair<Rules::Quantifier, Rules::Relation>(q, r), ss), transition));
        }
        std::cout << "System is" << (verify() ? " safe." : " unsafe.") << std::endl;
    }
    return false;
}

