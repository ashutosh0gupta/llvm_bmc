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

enum AccessRelation { LT, GT, NEQ };
enum Quantifier { FORALL, EXISTS };


// typedef std::vector<uint64_t> state_t;
typedef uint64_t state_t;

class thread_transition_t {
  // uint64_t from;
  // uint64_t to;

  state_t from_local;
  state_t to_local;
  state_t from_global;
  state_t to_global;

};

class global_rule_t {
  Quantifier q;
  AccessRelation r;
  std::set<uint64_t> guard;
  thread_transition_t transition;
};

  // condition_t  condition;

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
  typedef std::pair<uint64_t, uint64_t> transition_t;
  typedef std::pair<std::pair<Quantifier, AccessRelation>, std::set<uint64_t>> condition_t;
  typedef std::pair<condition_t,transition_t> global_rule_t;
    struct Rules {
        std::vector< transition_t  > local_rules;
        std::vector< global_rule_t > global_rules;
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
