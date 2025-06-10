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

RBNode* fun(RBNode* current1, RBNode* current2, int limit) {
    // RBNode* current1 = root->left;
    // RBNode* current2 = root->right;

    RBNode* selected = nullptr;

    for (int i = 0; i < limit; ++i) {
        if (i%2 == 0) {
            selected = current1;
        } else {
            selected = current2;
        }
    }

    assert(selected == current1);  // always false to force phi node

    return selected;
}

int main() {
    // Manual construction of simple red-black tree
    RBNode* root = new RBNode{10, BLACK, nullptr, nullptr, nullptr};
    RBNode* leftChild = new RBNode{5, RED, nullptr, nullptr, root};
    RBNode* rightChild = new RBNode{15, RED, nullptr, nullptr, root};

    root->left = leftChild;
    root->right = rightChild;

    // int cond;
    // std::cin >> cond;

    RBNode* selected = fun(root->left, root->right, 7);

    return 0;
}
