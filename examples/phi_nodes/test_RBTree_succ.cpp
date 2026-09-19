#include <iostream>

bool assert(bool);

enum Color { RED, BLACK };

struct RBNode {
    int data;
    Color color;
    RBNode* left;
    RBNode* right;
    RBNode* parent;
};

RBNode* fun(RBNode* RBNode_1, 
        RBNode* RBNode_2, int limit) {
    RBNode* selected = nullptr;
    for(int i=0; i<limit; i++){
        selected = (i%2==0)? RBNode_1 : RBNode_2;
    }
    assert(selected == RBNode_1);
    return selected;
}

int main() {
    // Manual construction of simple red-black tree
    RBNode* root = new RBNode{10, BLACK, nullptr, nullptr, nullptr};
    RBNode* leftChild = new RBNode{5, RED, nullptr, nullptr, root};
    RBNode* rightChild = new RBNode{15, RED, nullptr, nullptr, root};

    root->left = leftChild;
    root->right = rightChild;

    // assert(root->left->parent == root);  // always false to force phi node

    // int cond;
    // std::cin >> cond;

    RBNode* selected = fun(root->left, root->right, 31);

    return 0;
}
