#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

int main() {
    TreeNode* root = new TreeNode{10, nullptr, nullptr};
    
    TreeNode* leftChild = new TreeNode{15, nullptr, nullptr};
    TreeNode* rightChild = new TreeNode{5, nullptr, nullptr};
    
    TreeNode* leftLeft = new TreeNode{17, nullptr, nullptr};
    TreeNode* leftRight = new TreeNode{12, nullptr, nullptr};

    TreeNode* rightLeft = new TreeNode{7, nullptr, nullptr};
    TreeNode* rightRight = new TreeNode{3, nullptr, nullptr};

    // Connect children
    root->left = leftChild;
    root->right = rightChild;

    leftChild->left = leftLeft;
    leftChild->right = leftRight;

    rightChild->left = rightLeft;
    rightChild->right = rightRight;


    //single depth
    // assert(root->left->data < root->data);
    // assert(root->right->data > root->data);
    // assert(root->left != leftChild);

    // //more than one depth
    // assert(root->left->left->data < root->left->data);
    // assert(root->left->right->data > root->left->data);
    // assert(root->right->left->data < root->right->data);
    assert(root->right->left != rightLeft);

    return 0;
}
