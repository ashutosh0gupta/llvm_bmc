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



// typedef std::vector<uint64_t> state_t;






// struct

// condition_t  condition;

class psystems : public bmc_pass,
                 public llvm::FunctionPass
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

    typedef uint64_t state_t;
    typedef std::vector<state_t> word_t;
    typedef std::set<word_t> lang_t;
    static constexpr state_t STATE_SIZE = 6;

    enum AccessRelation
    {
        LT,
        GT,
        NEQ
    };

    enum Quantifier
    {
        FORALL,
        EXISTS
    };

    struct transition
    {
        // state_t from_local;
        // state_t to_local;
        state_t from;
        state_t to;

        transition(state_t from, state_t to) : from(from), to(to) {}
    };

    struct global_rule
    {
        Quantifier q;
        AccessRelation r;
        std::set<state_t> guard;
        transition trans;

        global_rule(Quantifier q, AccessRelation r, const std::set<state_t> &g, const transition &trans) : q(q), r(r), guard(g), trans(trans)
        {}
    };

    // typedef std::pair<state_t, state_t> transition_t;
    struct Rules
    {
        std::vector<transition> local_rules;
        std::vector<global_rule> global_rules;
    } rules;
    state_t init_state;
    word_t bad_min;
    const lang_t &size_k_substrs(word_t::const_iterator, word_t::const_iterator, state_t);
    lang_t alpha(word_t::const_iterator, word_t::const_iterator, state_t);
    lang_t alpha(const lang_t &, state_t);
    lang_t integral(const lang_t &, state_t, state_t);
    const lang_t &post(const word_t &);
    lang_t post(const lang_t &);
    bool verify();

    // Helper functions
    std::string getInstructionString(const llvm::Instruction &);
    std::string getBasicBlockString(const llvm::BasicBlock &);
    bool is_subword(const word_t &, const word_t &);
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
