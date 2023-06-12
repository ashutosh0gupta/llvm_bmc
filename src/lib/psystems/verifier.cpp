#include <vector>
#include <set>
#include <utility>
#include <map>
#include <queue>
#include <memory>

constexpr uint64_t STATE_SIZE = 10000;

const std::set<std::vector<uint64_t > > & size_k_substrs(const std::vector<uint64_t>::iterator start, const std::vector<uint64_t>::iterator end, uint64_t size)
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
    for(std::vector<uint64_t>::iterator i = start; i < end; ++i)
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

std::set<std::vector<uint64_t> > alpha(const std::vector<uint64_t>::iterator start, const std::vector<uint64_t>::iterator end, uint64_t k)
{
    std::set<std::vector<uint64_t> > ret_set;
    for(int size = 0; size <= k; ++size)
    {
        auto sks = size_k_substrs(start, end, size);
        for(const auto &x: sks)
        {
            ret_set.insert(x);
        }
    }
    return ret_set;
}

struct Trie {
    std::vector<uint64_t> str;
    std::unique_ptr<Trie> child[STATE_SIZE];
    Trie *parent;
    bool valid;
    std::set<Trie *> prop_subwords;

    Trie(): valid(true), parent(nullptr) {}

    Trie(Trie *parent, uint64_t ins): valid(parent->valid), parent(parent), str(parent->str), prop_subwords(parent->prop_subwords)
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

std::set<std::vector<uint64_t> > integral(const std::set<std::vector<uint64_t> > &lang, uint64_t k, uint64_t l)
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

