#include <iostream>
#include <string>
#include <chrono>
#include <vector>
#include <set>
#include <tuple>
#include <map>
#include <queue>
#include <memory>


std::map<std::tuple<std::vector<bool>::iterator, std::vector<bool>::iterator, int64_t>, std::unique_ptr<const std::set<std::vector<bool> > > > sks_memo;
const std::set<std::vector<bool > > & size_k_substrs(const std::vector<bool>::iterator start, const std::vector<bool>::iterator end, int64_t size)
{
    auto it = sks_memo.find(std::tuple<std::vector<bool>::iterator, std::vector<bool>::iterator, int64_t>(start, end, size));
    if(it != sks_memo.end())
    {
        return *(it->second);
    }

    std::unique_ptr<std::set<std::vector<bool > > > ret_set = std::make_unique<std::set<std::vector<bool> > >();
    if(size == 0)
    {
        ret_set->insert(std::vector<bool>());
        sks_memo[std::tuple<std::vector<bool>::iterator, std::vector<bool>::iterator, int64_t>(start, end, size)] = std::move(ret_set);
        return *sks_memo[std::tuple<std::vector<bool>::iterator, std::vector<bool>::iterator, int64_t>(start, end, size)];
    }
    for(std::vector<bool>::iterator i = start; i < end; ++i)
    {
        std::set<std::vector<bool> > alph = size_k_substrs(start, i, size - 1);
        for(std::vector<bool> v: alph)
        {
            v.push_back(*i);
            ret_set->insert(v);
        }
    }
    sks_memo[std::tuple<std::vector<bool>::iterator, std::vector<bool>::iterator, int64_t>(start, end, size)] = std::move(ret_set);
    return *sks_memo[std::tuple<std::vector<bool>::iterator, std::vector<bool>::iterator, int64_t>(start, end, size)];
}

std::set<std::vector<bool> > alpha(const std::vector<bool>::iterator start, const std::vector<bool>::iterator end, int64_t k)
{
    std::set<std::vector<bool> > ret_set;
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
    std::vector<bool> str;
    std::unique_ptr<Trie> child[2];
    Trie *parent;
    bool valid;
    std::set<Trie *> prop_subwords;

    Trie(): valid(true), parent(nullptr)
    {
        child[0] = nullptr;
        child[1] = nullptr;
    }

    Trie(Trie *parent, bool ins): valid(parent->valid), parent(parent), str(parent->str), prop_subwords(parent->prop_subwords)
    {
        child[0] = nullptr;
        child[1] = nullptr;
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

std::set<std::vector<bool> > integral(const std::set<std::vector<bool> > &lang, int64_t k, int64_t l)
{
    std::set<std::vector<bool> > ret_set;
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
            sks_memo.clear();
        }
        if(t->valid)
        {
            ret_set.insert(t->str);
            t->child[0] = std::make_unique<Trie>(t, 0);
            t->child[1] = std::make_unique<Trie>(t, 1);
            if(t->child[0]->valid) bfs.push(t->child[0].get());
            if(t->child[1]->valid) bfs.push(t->child[1].get());
        }
        bfs.pop();
    }
    return ret_set;
}

int main(int argc, char **argv)
{
    if(argc != 2 && argc != 3)
    {
        std::cerr << "Usage: " << argv[0] << " <value of l> <optional: debug>" << std::endl;
        exit(-1);
    }
    // ios::sync_with_stdio(false);
    // cin.tie(0);
    // cout.tie(0);
    std::set<std::vector<bool> > language;
    language.insert(std::vector<bool>());
    std::string s;
    while(std::cin >> s)
    {
        // cout << "Input taken: " << s << endl;
        std::vector<bool> b = std::vector<bool>();
        for(int64_t i = 0; i < s.size(); ++i)
        {
            b.push_back(s[i] == '1');
        }
        language.insert(b);
    }
    // cout << "Language is: ";
    // for(const auto& vb: language)
    // {
    //     for(bool b: vb)
    //     {
    //         cout << b;
    //     }
    //     cout << endl;
    // }
    int64_t l = std::stoi(argv[1]);
    auto t = std::chrono::steady_clock::now();
    std::set<std::vector<bool> > integ = integral(language, l - 1, l);
    std::cout << std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now() - t).count() << " ms\n";
    std::cout << "Size: " << integ.size() << std::endl;

    if(argc == 3)
    {
        // cout << "Set is: " << endl;
        for(const auto& v: integ)
        {
            for(bool b: v)
            {
                std::cout << b;
            }
            std::cout << std::endl;
        }
        // cout << "NUM IS " << num << endl;
    }
    // cout << "MEMO" << endl;
    // for(auto it = LatticeNode::memo.begin(); it != LatticeNode::memo.end(); ++it)
    // {
    //     for(bool b: it->first) cout << b;
    //     cout << " : ";
    //     cout << it->second;
    // }
    // auto v = witness[root->child[1]->child[0]->child[0]->child[0]->child[0]->child[0]->child[0]->child[0]->child[1]];
    // if(language.count(v)) cout << "BRUHHHHHH" << endl;
    // for(bool b: v) cout << b;
    // cout << endl;
    return 0;
}