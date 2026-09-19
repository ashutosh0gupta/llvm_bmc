#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

TreeNode* fun(TreeNode* current1, TreeNode* current2, int limit) {

    TreeNode* selected = nullptr;

    for (int i = 0; i < limit; ++i) {
        if (i%2 == 0) {
            selected = current1;
        } else {
            selected = current2;
        }
    }

    assert(selected == current2);

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

    TreeNode* selected = fun(root->left->left, root->right, 11);

    return 0;
}
