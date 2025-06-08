#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

TreeNode* fun(TreeNode* node_1, TreeNode* node_2, int cond) {
    TreeNode* selected = nullptr;

    if (cond > 0) {
        selected = node_1;
    } else {
        selected = node_2;
    }

    assert(selected == node_1);

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

    int cond;
    std::cin >> cond;
    TreeNode* selected = fun(root->left, root->right, cond);

    return 0;
}
