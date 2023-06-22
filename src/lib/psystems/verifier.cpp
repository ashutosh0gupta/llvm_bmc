#ifndef PSYSTEMS_VERIFIER_CPP
#define PSYSTEMS_VERIFIER_CPP

#include "psystems.h"

const psystems::lang_t & psystems::size_k_substrs(word_t::const_iterator start, word_t::const_iterator end, state_t size)
{
    static std::map<std::pair<word_t, state_t>, std::unique_ptr<const lang_t> > memo;
    std::pair<word_t, state_t> args(word_t(start, end), size);
    auto it = memo.find(args);
    if(it != memo.end())
    {
        return *(it->second);
    }

    std::unique_ptr<lang_t> ret_set = std::make_unique<lang_t>();
    if(size == 0)
    {
        ret_set->insert(word_t());
        memo[args] = std::move(ret_set);
        return *memo[args];
    }
    for(word_t::const_iterator i = start; i < end; ++i)
    {
        lang_t alph = size_k_substrs(start, i, size - 1);
        for(word_t v: alph)
        {
            v.push_back(*i);
            ret_set->insert(v);
        }
    }
    memo[args] = std::move(ret_set);
    return *memo[args];
}

psystems::lang_t psystems::alpha(const word_t &word, state_t k)
{
    lang_t ret_set;
    for(state_t size = 0; size <= k; ++size)
    {
        const lang_t &sks = size_k_substrs(word.begin(), word.end(), size);
        for(const word_t &x: sks)
        {
            ret_set.insert(x);
        }
    }
    return ret_set;
}

psystems::lang_t psystems::alpha(const lang_t & lang, state_t k)
{
    lang_t ret_set;
    for(const word_t& w: lang)
    {
        for(const word_t& ww: alpha(w, k))
        {
            ret_set.insert(ww);
        }
    }
    return ret_set;
}

struct psystems::Trie {
    word_t str;
    std::unique_ptr<Trie> child[STATE_SIZE];
    Trie *parent;
    bool valid;
    std::set<Trie *> prop_subwords;

    Trie(): parent(nullptr), valid(true) {}

    Trie(Trie *parent, state_t ins):  str(parent->str), parent(parent), valid(parent->valid), prop_subwords(parent->prop_subwords)
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

psystems::lang_t psystems::integral(const lang_t &lang, state_t k, state_t l)
{
    lang_t ret_set;
    std::unique_ptr<Trie> root = std::make_unique<Trie>();
    std::queue<Trie *> bfs;
    bfs.push(root.get());
    while(!bfs.empty())
    {
        Trie *t = bfs.front();
        if(t->str.size() > l) break;
        for(const word_t &v: alpha(t->str, k))
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
            for(state_t i = 0; i < STATE_SIZE; ++i) t->child[i] = std::make_unique<Trie>(t, i);
            for(state_t i = 0; i < STATE_SIZE; ++i) if(t->child[i]->valid) bfs.push(t->child[i].get());
        }
        bfs.pop();
    }
    return ret_set;
}

const psystems::lang_t &psystems::post(const word_t & word)
{
    static std::map<word_t, std::unique_ptr<const lang_t> > memo;
    auto it = memo.find(word);
    if(it != memo.end())
    {
        return *(it->second);
    }

    std::unique_ptr<lang_t> to_ret = std::make_unique<lang_t>();
    for(state_t i = 0; i < word.size(); ++i)
    {
        for(const transition& rule: rules.local_rules)
        {
            if(rule.from == word[i])
            {
                word_t v = word;
                v[i] = rule.to;
                to_ret->insert(v);
            }
        }
    }
    for(const global_rule& rule: rules.global_rules)
    {
        for(state_t id = 0; id < word.size(); ++id)
        {
            if(rule.trans.from == word[id])
            {
                switch(rule.r)
                {
                    case(LT):
                    {
                        switch(rule.q)
                        {
                            case(FORALL):
                            {
                                state_t i = 0;
                                for(; i < id; ++i)
                                {
                                    if(! rule.guard.count(word[i])) break;
                                }
                                if(i == id)
                                {
                                    word_t v = word;
                                    v[id] = rule.trans.to;
                                    to_ret->insert(v);
                                }
                                break;
                            }
                            case(EXISTS):
                            {
                                for(state_t i = 0; i < id; ++i)
                                {
                                    if(rule.guard.count(word[i]))
                                    {
                                        word_t v = word;
                                        v[id] = rule.trans.to;
                                        to_ret->insert(v);
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    }
                    case(GT):
                    {
                        switch(rule.q)
                        {
                            case(FORALL):
                            {
                                state_t i = id + 1;
                                for(; i < word.size(); ++i)
                                {
                                    if(! rule.guard.count(word[i])) break;
                                }
                                if(i == word.size())
                                {
                                    word_t v = word;
                                    v[id] = rule.trans.to;
                                    to_ret->insert(v);
                                }
                                break;
                            }
                            case(EXISTS):
                            {
                                for(state_t i = id + 1; i < word.size(); ++i)
                                {
                                    if(rule.guard.count(word[i]))
                                    {
                                        word_t v = word;
                                        v[id] = rule.trans.to;
                                        to_ret->insert(v);
                                    }
                                }
                                break;
                            }
                        }
                        break;
                    }
                    case(NEQ):
                    {
                        switch(rule.q)
                        {
                            case(FORALL):
                            {
                                state_t i = 0;
                                for(; i < word.size(); ++i)
                                {
                                    if(i == id) continue;
                                    if(! rule.guard.count(word[i])) break;
                                }
                                if(i == word.size())
                                {
                                    word_t v = word;
                                    v[id] = rule.trans.to;
                                    to_ret->insert(v);
                                }
                                break;
                            }
                            case(EXISTS):
                            {
                                for(state_t i = 0; i < word.size(); ++i)
                                {
                                    if(i == id) continue;
                                    if(rule.guard.count(word[i]))
                                    {
                                        word_t v = word;
                                        v[id] = rule.trans.to;
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

psystems::lang_t psystems::post(const lang_t & lang)
{
    lang_t ret_set;
    for(const word_t &v: lang)
    {
        for(const word_t &w: post(v))
        {
            ret_set.insert(w);
        }
    }
    return ret_set;
}

bool psystems::is_subword(const word_t &sub, const word_t &word)
{
    state_t j = 0;
    for(state_t i = 0; i < word.size() && j < sub.size(); ++i)
    {
        if(word[i] == sub[j]) ++j;
    }
    return j == sub.size();
}

bool psystems::verify()
{
    // since initial state of each thread is the same (say s), \alpha_k(I) is just words of the form sss... upto size k
    for(state_t k = 1; ; k++)
    {
        lang_t Ik({word_t(k, init_state)});
        lang_t alphk = alpha(Ik, k);
        lang_t Rk = Ik;
        for(const word_t &v: post(Ik)) Rk.insert(v);
        while(Rk != Ik)
        {
            Ik = Rk;
            for(const word_t &v: post(Ik)) Rk.insert(v);
        }
        for(const word_t &r: Rk)
        {
            if(is_subword(bad_min, r)) return false;
        }
        lang_t V = alphk;
        for(const word_t &w: alpha(post(integral(alphk, k, k + 1)), k)) V.insert(w);
        while(V != alphk)
        {
            alphk = V;
            for(const word_t &w: alpha(post(integral(alphk, k, k + 1)), k)) V.insert(w);
        }
        bool is_subset = true;
        for(const word_t &b: alpha(bad_min, k))
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
