#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

TreeNode* fun(TreeNode* current1, TreeNode* current2, int limit) {
    // TreeNode* current1 = root->left;           // Traversal start point
    // TreeNode* current2 = root->right;    // Some other node in tree

    TreeNode* selected = nullptr;

    for (int i = 0; i < limit; ++i) {
        if (i%2 == 0) {
            selected = current1;
        } else {
            selected = current2;
        }
    }

    assert(selected == current1);  // Assertion always fails; for BMC purposes

    return selected;
}

int main() {
    TreeNode* root = new TreeNode{10, nullptr, nullptr};
    TreeNode* leftChild = new TreeNode{5, nullptr, nullptr};
    TreeNode* rightChild = new TreeNode{15, nullptr, nullptr};
    TreeNode* leftLeft = new TreeNode{3, nullptr, nullptr};
    TreeNode* leftRight = new TreeNode{7, nullptr, nullptr};

    root->left = leftChild;
    root->right = rightChild;
    leftChild->left = leftLeft;
    leftChild->right = leftRight;

    // int cond;
    // std::cin >> cond;

    TreeNode* selected = fun(root->left, root->right, 6);

    return 0;
}
