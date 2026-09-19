#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

TreeNode* fun(TreeNode* TreeNode_1, 
        TreeNode* TreeNode_2, int limit) {
    TreeNode* selected = nullptr;
    for(int i=0; i<limit; i++){
        selected = (i%2==0)? TreeNode_1 : TreeNode_2;
    }
    assert(selected == TreeNode_2);
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

    TreeNode* selected = fun(root->left->left, root->right, 8);

    return 0;
}
