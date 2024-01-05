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
    // rules.local_rules.push_back(transition(0, 1));
    // rules.global_rules.push_back(global_rule(FORALL, NEQ, {0, 1, 2}, transition(1, 3)));
    // rules.global_rules.push_back(global_rule(EXISTS, NEQ, {1}, transition(3, 2)));
    // rules.global_rules.push_back(global_rule(EXISTS, NEQ, {4, 5}, transition(2, 4)));
    // rules.global_rules.push_back(global_rule(FORALL, LT, {0, 1}, transition(4, 5)));
    // rules.global_rules.push_back(global_rule(FORALL, GT, {0, 1, 4, 5}, transition(5, 0)));
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

// std::unique_ptr<std::set<psystems::state_t> > psystems::forall_neq_check(const llvm::Loop *loop)
// {
//     std::unique_ptr<std::set<state_t> > p;
//     if(loop)
//     {
//         const llvm::BasicBlock *header_block = loop->getHeader();
//         if(header_block)
//         {
//             std::string s = getBasicBlockString(*header_block);
//             if(s[1] == 'L')
//             {
//                 state_t header_num = std::stoi(s.c_str() + 2);
//                 const auto &v = loop->getSubLoops();
//                 if(v.size() != 1) return p;
//                 const llvm::Loop *for_loop = v[0];
//                 if(!for_loop) return p;
//                 /* check if for loop is of the form for(int i = 0; i < N; ++i) */
//                 const llvm::BasicBlock *for_header = for_loop->getHeader();
//                 if(!for_header) return p;
//                 llvm::SmallVector<llvm::BasicBlock *> l;
//                 for_loop->getLoopLatches(l);
//                 if(l.size() != 2) return p;
//                 const llvm::BasicBlock *latch;
//                 const llvm::Instruction *termInst;
//                 const llvm::BranchInst *br;
//                 const llvm::Value *cond;
//                 const llvm::ICmpInst *cmpInst;
//                 const llvm::ConstantInt *ci;
//                 bool good = false;
//                 for(state_t i = 0; i < 2; ++i)
//                 {
//                     latch = l[i];
//                     termInst = latch->getTerminator();
//                     if(!termInst) continue;
//                     br = llvm::dyn_cast<const llvm::BranchInst>(termInst);
//                     if(!br || ! br->isConditional()) continue;
//                     cond = br->getCondition();
//                     if(!cond) continue;;
//                     cmpInst = llvm::dyn_cast<const llvm::ICmpInst>(br);
//                     if(! cmpInst ) continue;
//                     if(cmpInst->getPredicate() != llvm::CmpInst::ICMP_SLT) continue;
//                     ci = llvm::dyn_cast<const llvm::ConstantInt>(cmpInst);
//                     if(!ci) continue;
//                     good = true;
//                     break;
//                 }
//                 if(!good) return p;
//                 const llvm::Value *loop_var = cmpInst->getOperand(1);
//                 const llvm::PHINode *phin = llvm::dyn_cast<const llvm::PHINode>(loop_var);
//                 if(! phin ) return p;
//                 const llvm::Type *phitype = phin->getType();
//                 if(! phitype->isIntegerTy()) return p;
//                 const llvm::Value *val = phin->getIncomingValue(0);
//                 const llvm::Instruction *inc_inst = llvm::dyn_cast<const llvm::Instruction>(val);
//                 if(! inc_inst || inc_inst->getParent() != latch) return p;
//                 if(inc_inst->getOpcode() != llvm::Instruction::Add) return p;
//                 if(inc_inst->getOperand(0) != phin) return p;
//                 const llvm::ConstantInt *const1 = llvm::dyn_cast<const llvm::ConstantInt>(inc_inst->getOperand(1));
//                 if(!const1 || ! const1->isOne()) return p;
//                 /* for loop check done */
//                 /* Check for latches of main loop */
//                 llvm::SmallVector<llvm::BasicBlock *> latches;
//                 loop->getLoopLatches(latches);
//                 std::set<state_t> vals;
//                 for(const llvm::BasicBlock *bb: latches)
//                 {
//                     const llvm::Instruction *term = bb->getTerminator();
//                     if(!term) continue;
//                     const llvm::BranchInst *br = llvm::dyn_cast<const llvm::BranchInst>(term);
//                 }
//             }
//         }
//     }
//     return p;
// }

std::set<psystems::state_t> psystems::get_guard(const llvm::Loop *loop, psystems::Quantifier q)
{

}

std::optional<psystems::Quantifier> psystems::get_quant(const llvm::Loop *loop)
{

}

std::optional<psystems::AccessRelation> psystems::get_ar(const llvm::Loop *loop)
{
    const llvm::BasicBlock *header = loop->getHeader();
    if(!header) return std::optional<psystems::AccessRelation>();
    llvm::SmallVector<llvm::BasicBlock *> v;
    loop->getLoopLatches(v);
    if(v.size() != 1) return std::optional<psystems::AccessRelation>(); // continue statement is not a latch!!
    const llvm::BasicBlock *latch = v[0];
    // check if latch is a conditional branch with < comparison
    const llvm::Instruction *termInst = latch->getTerminator();
    if(!termInst) return std::optional<psystems::AccessRelation>();
    const llvm::BranchInst *br = llvm::dyn_cast<const llvm::BranchInst>(termInst);
    if(!br || !br->isConditional()) return std::optional<psystems::AccessRelation>();
    const llvm::Value *cond = br->getCondition();
    if(!cond) return std::optional<psystems::AccessRelation>();
    const llvm::ICmpInst *cmpInst = llvm::dyn_cast<const llvm::ICmpInst>(cond);
    if(! cmpInst ) return std::optional<psystems::AccessRelation>();
    if(cmpInst->getPredicate() != llvm::CmpInst::ICMP_SLT) return std::optional<psystems::AccessRelation>();
    // check if branch is being compared with an integer constant
    const llvm::ConstantInt *ci = llvm::dyn_cast<const llvm::ConstantInt>(cmpInst->getOperand(1));
    if(ci)
    {
        // common check
        const llvm::Value *loop_var = cmpInst->getOperand(0);
        const llvm::Instruction *loop_var_inst = llvm::dyn_cast<const llvm::Instruction>(loop_var);
        if(!loop_var_inst) return std::optional<psystems::AccessRelation>();
        const llvm::Type *type = loop_var_inst->getType();
        if(! type->isIntegerTy()) return std::optional<psystems::AccessRelation>();
        // check if loop variable is initialized to 0
        int64_t init_val = -1;
        const llvm::BasicBlock *parent = loop_var_inst->getParent();
        if(! parent) return std::optional<psystems::AccessRelation>();
        for (const llvm::Instruction& instruction : parent->getInstList())
        {
            if (const llvm::AllocaInst* allocaInst = llvm::dyn_cast<const llvm::AllocaInst>(&instruction))
            {
                // Found the instruction that allocates memory for the variable
                // Get the initial value if available (assuming constant initialization)
                if (const llvm::ConstantInt* constantInt = llvm::dyn_cast<const llvm::ConstantInt>(allocaInst->getOperand(0)))
                {
                    init_val = constantInt->getSExtValue();
                }
                break;  // Exit the loop after finding the initialization instruction
            }
        }
        if(init_val == -1) return GT;
        if(init_val == 0) return NEQ;
        return std::optional<psystems::AccessRelation>();
    }
    else
    {
        // extra checks
        // check if branch is being compared with an integer constant
        const llvm::Value *loop_var = cmpInst->getOperand(0);
        const llvm::Instruction *loop_var_inst = llvm::dyn_cast<const llvm::Instruction>(loop_var);
        if(!loop_var_inst) return std::optional<psystems::AccessRelation>();
        const llvm::Type *type = loop_var_inst->getType();
        if(! type->isIntegerTy()) return std::optional<psystems::AccessRelation>();
        // check if loop variable is initialized to 0
        int64_t init_val = -1;
        const llvm::BasicBlock *parent = loop_var_inst->getParent();
        if(! parent) return std::optional<psystems::AccessRelation>();
        for (const llvm::Instruction& instruction : parent->getInstList())
        {
            if (const llvm::AllocaInst* allocaInst = llvm::dyn_cast<const llvm::AllocaInst>(&instruction))
            {
                // Found the instruction that allocates memory for the variable
                // Get the initial value if available (assuming constant initialization)
                if (const llvm::ConstantInt* constantInt = llvm::dyn_cast<const llvm::ConstantInt>(allocaInst->getOperand(0)))
                {
                    init_val = constantInt->getSExtValue();
                }
                break;  // Exit the loop after finding the initialization instruction
            }
        }
        if(init_val != 0) return std::optional<psystems::AccessRelation>();
        return LT;
    }
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
    if(EntryFn == "function")
    {
        state_t l_count = 0;
        // f.dump();
        std::vector<const llvm::BasicBlock *> labelled_blocks;
        // std::map<const llvm::BasicBlock *, state_t> block_to_label; 
        for(const auto& BB: f)
        {
            std::string s = getBasicBlockString(BB);
            // Assume labels are L0, L1, etc
            if(s[1] == 'L')
            {
                labelled_blocks.push_back(&BB);
                if(const auto pptr = BB.getUniqueSuccessor())
                {
                    std::string ss = getBasicBlockString(*pptr);
                    if(ss[1] == 'L')
                    {
                        rules.local_rules.push_back(transition(std::stoi(s.c_str() + 2), std::stoi(ss.c_str() + 2))); // getting all local transitions
                    }
                }
            }
        }
        // // getting all global transitions
        const auto &LIWP = getAnalysis<llvm::LoopInfoWrapperPass>();
        const auto &LI = LIWP.getLoopInfo();
        for(const llvm::Loop *I: LI)
        {
            for(const llvm::Loop *II: I->getLoopsInPreorder())
            {
                // if(const llvm::BasicBlock *pred = II->getLoopPredecessor())
                // {
                //     std::string s = getBasicBlockString(*pred);
                //     if(s[1] == 'L')
                //     {
                //         state_t init = std::stoi(s.c_str() + 2);
                //         if(const llvm::BasicBlock *exit = II->getExitBlock())
                //         {
                //             if(const llvm::BasicBlock *succ = exit->getUniqueSuccessor())
                //             {
                //                 std::string ss = getBasicBlockString(*succ);
                //                 if(ss[1] == 'L')
                //                 {
                //                     state_t fin = std::stoi(ss.c_str() + 2);
                //                     const std::set<state_t> &guard = get_guard(II);
                //                     Quantifier q = get_quant(II);
                //                     AccessRelation ar = get_ar(II);
                //                 }
                //             }
                //         }
                //     }
                // }
                // const llvm::BasicBlock *header = II->getHeader();
                // header->dump();
                for(const llvm::BasicBlock *bb: II->blocks())
                {
                    bb->dump();
                }
                std::optional<AccessRelation> ar = get_ar(II);
                std::cout << "\nBRUHHH" << std::endl;
                if(ar)
                {
                    switch(ar.value())
                    {
                        case NEQ:
                        {
                            std::cout << "NEQ" << std::endl;
                            break;
                        }
                        case LT:
                        {
                            std::cout << "LT" << std::endl;
                            break;
                        }
                        case GT:
                        {
                            std::cout << "GT" << std::endl;
                            break;
                        }
                    }
                }
                else
                {
                    std::cout << "NONE" << std::endl;
                }
            }
        }
        // state_t i = 0;
        // for(const llvm::Loop *I: LI)
        // {
        //     for(const llvm::Loop *II: I->getLoopsInPreorder())
        //     {
        //         const llvm::BasicBlock *header = II->getHeader();
        //         header->getS
        //         header->dump();
        //         std::cout << "LOOP " << i << " LEVEL: " << II->getLoopDepth() << std::endl;
        //         ++i;
        //     }
        // }
        // std::cout << "I: " << i << std::endl;
        // for(auto I : LI)
        // {
        //     // for(auto II: I->getLoopsInPreorder())
        //     // {
        //     //     std::cout << "A" << std::endl;
        //     //     II->dump();
        //     //     std::cout << "B" << std::endl;
        //     // }
        //     // std::cout << "HI" << std::endl;
        //     // I->dump();
        //     // std::cout << "BYE" << std::endl;
        // }
        // for(auto I: LI)
        // {
        //     for(auto II: I->getSubLoops())
        //     {
        //         std::cout << "A" << count++ << std::endl;
        //         llvm::BasicBlock* latchBlock = II->getLoopLatch();
        //         std::cout << "B" << count++ << std::endl;
        //         llvm::BranchInst* branchInst = llvm::dyn_cast<llvm::BranchInst>(latchBlock->getTerminator());
        //         std::cout << "C" << count++ << std::endl;
        //         llvm::Value* condition = branchInst->getCondition();
        //         std::cout << "D" << count++ << std::endl;
        //         llvm::ConstantInt* constantInt = llvm::dyn_cast<llvm::ConstantInt>(condition);
        //         std::cout << "E" << count++ << std::endl;
        //         llvm::APInt apInt = constantInt->getValue();
        //         std::cout << "F" << count++ << std::endl;
        //         uint64_t value = apInt.getZExtValue();
        //         std::cout << "VALUE: " << value << ' ' << count++ << std::endl;
        //     }
        // }
        // std::cout << "COUNT: " << count << std::endl;
        // std::cout << "System is" << (verify() ? " safe." : " unsafe.") << std::endl;
    }
    return false;
}

