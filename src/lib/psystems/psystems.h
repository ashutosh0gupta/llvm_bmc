#ifndef BMC_PSYSTEMS_H
#define BMC_PSYSTEMS_H

#include <fstream>
#include <vector>
#include <set>
#include <utility>
#include <map>
#include <queue>
#include <memory>

#include "include/options.h"
#include "include/spec.h"
#include "lib/bmc/bmc_pass.h"

class bmc; // forward declaration of the bmc class

// struct names {
//   std::map<std::string,names> nmap;
//   std::string name;
// };

// typedef std::vector<std::string> svec;

class psystems : public bmc_pass, public llvm::FunctionPass
{

private:
    static char ID;
    std::unique_ptr<llvm::Module> &module;
    std::ofstream ofcpp;
    unsigned thread_id = 0;
    std::string tid;
    unsigned current_indent;
    unsigned ncontext = 10;
    unsigned active_lax = 0;
    std::string thread_name, EntryFn;
    bool is_sc_semantics = false;
    struct Trie;
    struct Rules {
        std::vector<std::pair<uint64_t, uint64_t> > local_rules;
        enum Relation { lt, gt, neq };
        enum Quantifier { forall, exists };
        std::vector<std::pair<std::pair<std::pair<Quantifier, Relation>, std::set<uint64_t> >, std::pair<uint64_t, uint64_t > > > global_rules;
    } rules;
    uint64_t init_state;
    std::vector<uint64_t> bad_min;
    std::string getInstructionString(const llvm::Instruction &);
    std::string getBasicBlockString(const llvm::BasicBlock &);
    const std::set<std::vector<uint64_t>> &size_k_substrs(std::vector<uint64_t>::const_iterator, std::vector<uint64_t>::const_iterator, uint64_t);
    std::set<std::vector<uint64_t> > alpha(std::vector<uint64_t>::const_iterator, std::vector<uint64_t>::const_iterator, uint64_t);
    std::set<std::vector<uint64_t> > alpha(const std::set<std::vector<uint64_t> > &, uint64_t);
    std::set<std::vector<uint64_t> > integral(const std::set<std::vector<uint64_t> > &, uint64_t, uint64_t);
    const std::set<std::vector<uint64_t> > &post(const std::vector<uint64_t> &);
    std::set<std::vector<uint64_t> > post(const std::set<std::vector<uint64_t> > &);
    bool verify();
    //---------------------------------------------------------------------
public:
    psystems(options &o_,
             std::unique_ptr<llvm::Module> &m_,
             bmc &bmc
             // std::vector<spec_thread>& threads,
    );
    ~psystems();
    bool runOnFunction(llvm::Function &f);

    void getAnalysisUsage(llvm::AnalysisUsage &au) const;
    llvm::StringRef getPassName() const;

    // bool verify_prop();
};

#endif // BMC_PSYSTEMS_H
