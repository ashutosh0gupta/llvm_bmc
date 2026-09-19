#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

int main() {
    TreeNode* root = new TreeNode{10, nullptr, nullptr};
    
    TreeNode* leftChild = new TreeNode{5, nullptr, nullptr};
    TreeNode* rightChild = new TreeNode{15, nullptr, nullptr};
    
    TreeNode* leftLeft = new TreeNode{3, nullptr, nullptr};
    TreeNode* leftRight = new TreeNode{7, nullptr, nullptr};

    TreeNode* rightLeft = new TreeNode{12, nullptr, nullptr};
    TreeNode* rightRight = new TreeNode{17, nullptr, nullptr};

    // Connect children
    root->left = leftChild;
    root->right = rightChild;

    leftChild->left = leftLeft;
    leftChild->right = leftRight;

    rightChild->left = rightLeft;
    rightChild->right = rightRight;

    // Perform deletion of leftRight (node with value 7)
    delete leftRight;
    leftChild->right = nullptr;  // Disconnect the pointer

    // Assertion to confirm deletion
    assert(leftChild->right == nullptr);        // ✅ Should pass
    // assert(leftRight != leftChild->right);      // ✅ Should pass
    // assert(leftRight->data != 7);               // ❌ This will fail (dangling pointer still has data)
    // Note: Accessing leftRight after deletion is undefined behavior

    return 0;
}
