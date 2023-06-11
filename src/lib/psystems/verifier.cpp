#ifndef PSYSTEMS_VERIFIER_CPP
#define PSYSTEMS_VERIFIER_CPP

#include "psystems.h"

constexpr uint64_t STATE_SIZE = 6;

const std::set<std::vector<uint64_t > > & psystems::size_k_substrs(std::vector<uint64_t>::const_iterator start, std::vector<uint64_t>::const_iterator end, uint64_t size)
{
    static std::map<std::pair<std::vector<uint64_t>, uint64_t>, std::unique_ptr<const std::set<std::vector<uint64_t> > > > memo;
    std::pair<std::vector<uint64_t>, uint64_t> args(std::vector<uint64_t>(start, end), size);
    auto it = memo.find(args);
    if(it != memo.end())
    {
        return *(it->second);
    }

    std::unique_ptr<std::set<std::vector<uint64_t > > > ret_set = std::make_unique<std::set<std::vector<uint64_t> > >();
    if(size == 0)
    {
        ret_set->insert(std::vector<uint64_t>());
        memo[args] = std::move(ret_set);
        return *memo[args];
    }
    for(std::vector<uint64_t>::const_iterator i = start; i < end; ++i)
    {
        std::set<std::vector<uint64_t> > alph = size_k_substrs(start, i, size - 1);
        for(std::vector<uint64_t> v: alph)
        {
            v.push_back(*i);
            ret_set->insert(v);
        }
    }
    memo[args] = std::move(ret_set);
    return *memo[args];
}

std::set<std::vector<uint64_t> > psystems::alpha(std::vector<uint64_t>::const_iterator start, const std::vector<uint64_t>::const_iterator end, uint64_t k)
{
    std::set<std::vector<uint64_t> > ret_set;
    for(uint64_t size = 0; size <= k; ++size)
    {
        auto sks = size_k_substrs(start, end, size);
        for(const auto &x: sks)
        {
            ret_set.insert(x);
        }
    }
    return ret_set;
}

std::set<std::vector<uint64_t> > psystems::alpha(const std::set<std::vector<uint64_t> > & lang, uint64_t k)
{
    std::set<std::vector<uint64_t> > ret_set;
    for(const auto& w: lang)
    {
        for(const auto& ww: alpha(w.begin(), w.end(), k))
        {
            ret_set.insert(ww);
        }
    }
    return ret_set;
}

struct psystems::Trie {
    std::vector<uint64_t> str;
    std::unique_ptr<Trie> child[STATE_SIZE];
    Trie *parent;
    bool valid;
    std::set<Trie *> prop_subwords;

    Trie(): parent(nullptr), valid(true) {}

    Trie(Trie *parent, uint64_t ins):  str(parent->str), parent(parent), valid(parent->valid), prop_subwords(parent->prop_subwords)
    {
        // assert(ins >= 0 && ins < STATE_SIZE)
        str.push_back(ins);
        for(Trie *ptr: parent->prop_subwords)
        {
            if(! ptr->valid)
            {
                valid = false;
            }
            if(ptr->child[ins] == nullptr)
            {
                ptr->child[ins] = std::make_unique<Trie>(ptr, ins);
            }
            if(! ptr->child[ins]->valid)
            {
                valid = false;
            }
            prop_subwords.insert(ptr->child[ins].get());
        }
    }
};

std::set<std::vector<uint64_t> > psystems::integral(const std::set<std::vector<uint64_t> > &lang, uint64_t k, uint64_t l)
{
    std::set<std::vector<uint64_t> > ret_set;
    std::unique_ptr<Trie> root = std::make_unique<Trie>();
    std::queue<Trie *> bfs;
    bfs.push(root.get());
    while(!bfs.empty())
    {
        Trie *t = bfs.front();
        if(t->str.size() > l) break;
        for(const auto &v: alpha((t->str).begin(), (t->str).end(), k))
        {
            if(!lang.count(v))
            {
                t->valid = false;
                break;
            }
        }
        if(t->valid)
        {
            ret_set.insert(t->str);
            for(uint64_t i = 0; i < STATE_SIZE; ++i) t->child[i] = std::make_unique<Trie>(t, i);
            for(uint64_t i = 0; i < STATE_SIZE; ++i) if(t->child[i]->valid) bfs.push(t->child[i].get());
        }
        bfs.pop();
    }
    return ret_set;
}

const std::set<std::vector<uint64_t > > &psystems::post(const std::vector<uint64_t> & word)
{
    static std::map<std::vector<uint64_t>, std::unique_ptr<const std::set<std::vector<uint64_t> > > > memo;
    auto it = memo.find(word);
    if(it != memo.end())
    {
        return *(it->second);
    }

    std::unique_ptr<std::set<std::vector<uint64_t> > > to_ret = std::make_unique<std::set<std::vector<uint64_t> > >();
    for(uint64_t i = 0; i < word.size(); ++i)
    {
        for(const auto& rule: rules.local_rules)
        {
            if(rule.first == word[i])
            {
                std::vector<uint64_t> v = word;
                v[i] = rule.second;
                to_ret->insert(v);
            }
        }
    }
    for(const auto& rule:rules.global_rules)
    {
        for(uint64_t id = 0; id < word.size(); ++id)
        {
            if(rule.second.first == word[id])
            {
                switch(rule.first.first.second)
                {
                    case(Rules::Relation::lt):
                    {
                        switch(rule.first.first.first)
                        {
                            case(Rules::Quantifier::forall):
                            {
                                uint64_t i = 0;
                                for(; i < id; ++i)
                                {
                                    if(! rule.first.second.count(word[i])) break;
                                }
                                if(i == id)
                                {
                                    std::vector<uint64_t> v = word;
                                    v[id] = rule.second.second;
                                    to_ret->insert(v);
                                }
                                break;
                            }
                            case(Rules::Quantifier::exists):
                            {
                                for(uint64_t i = 0; i < id; ++i)
                                {
                                    if(rule.first.second.count(word[i]))
                                    {
                                        std::vector<uint64_t> v = word;
                                        v[id] = rule.second.second;
                                        to_ret->insert(v);
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    }
                    case(Rules::Relation::gt):
                    {
                        switch(rule.first.first.first)
                        {
                            case(Rules::Quantifier::forall):
                            {
                                uint64_t i = id + 1;
                                for(; i < word.size(); ++i)
                                {
                                    if(! rule.first.second.count(word[i])) break;
                                }
                                if(i == word.size())
                                {
                                    std::vector<uint64_t> v = word;
                                    v[id] = rule.second.second;
                                    to_ret->insert(v);
                                }
                                break;
                            }
                            case(Rules::Quantifier::exists):
                            {
                                for(uint64_t i = id + 1; i < word.size(); ++i)
                                {
                                    if(rule.first.second.count(word[i]))
                                    {
                                        std::vector<uint64_t> v = word;
                                        v[id] = rule.second.second;
                                        to_ret->insert(v);
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    }
                    case(Rules::Relation::neq):
                    {
                        switch(rule.first.first.first)
                        {
                            case(Rules::Quantifier::forall):
                            {
                                uint64_t i = 0;
                                for(; i < word.size(); ++i)
                                {
                                    if(i == id) continue;
                                    if(! rule.first.second.count(word[i])) break;
                                }
                                if(i == word.size())
                                {
                                    std::vector<uint64_t> v = word;
                                    v[id] = rule.second.second;
                                    to_ret->insert(v);
                                }
                                break;
                            }
                            case(Rules::Quantifier::exists):
                            {
                                for(uint64_t i = 0; i < word.size(); ++i)
                                {
                                    if(i == id) continue;
                                    if(rule.first.second.count(word[i]))
                                    {
                                        std::vector<uint64_t> v = word;
                                        v[id] = rule.second.second;
                                        to_ret->insert(v);
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    }
                }
            }
        }
    }
    memo[word] = std::move(to_ret);
    return *memo[word];
}

std::set<std::vector<uint64_t> > psystems::post(const std::set<std::vector<uint64_t> > & lang)
{
    std::set<std::vector<uint64_t> > ret_set;
    for(const auto & v: lang)
    {
        for(const auto& w: post(v))
        {
            ret_set.insert(w);
        }
    }
    return ret_set;
}

bool is_subword(const std::vector<uint64_t> &sub, const std::vector<uint64_t> &word)
{
    uint64_t j = 0;
    for(uint64_t i = 0; i < word.size() && j < sub.size(); ++i)
    {
        if(word[i] == sub[j]) ++j;
    }
    return j == sub.size();
}

bool psystems::verify()
{
    // since initial state of each thread is the same (say s), \alpha_k(I) is just words of the form sss... upto size k
    for(uint64_t k = 1; ; k++)
    {
        auto Ik = std::set<std::vector<uint64_t> >({std::vector<uint64_t>(k, init_state)});
        auto alphk = alpha(Ik, k);
        auto Rk = Ik;
        for(const auto& v: post(Ik)) Rk.insert(v);
        while(Rk != Ik)
        {
            Ik = Rk;
            for(const auto& v: post(Ik)) Rk.insert(v);
        }
        for(const auto& r: Rk)
        {
            if(is_subword(bad_min, r)) return false;
        }
        auto V = alphk;
        for(const auto& w: alpha(post(integral(alphk, k, k + 1)), k)) V.insert(w);
        while(V != alphk)
        {
            alphk = V;
            for(const auto& w: alpha(post(integral(alphk, k, k + 1)), k)) V.insert(w);
        }
        bool is_subset = true;
        for(const auto& b: alpha(bad_min.begin(), bad_min.end(), k))
        {
            if(! V.count(b))
            {
                is_subset = false;
                break;
            }
        }
        if(! is_subset) return true;
    }
}

#endif