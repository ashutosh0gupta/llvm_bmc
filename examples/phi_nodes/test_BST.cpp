#include <iostream>

bool assert(bool);

struct TreeNode {
    int data;
    TreeNode* left;
    TreeNode* right;
};

// Insert a value into BST
TreeNode* insert(TreeNode* root, int data) {
    if (!root) return new TreeNode{data, nullptr, nullptr};
    if (data < root->data)
        root->left = insert(root->left, data);
    else
        root->right = insert(root->right, data);
    return root;
}

TreeNode* fun(TreeNode* node1, TreeNode* node2, int limit) {
    TreeNode* selected = nullptr;

    for(int i = 0; i < limit; ++i) {
        if (i % 2 == 0) {
            selected = node1;
        } else {
            selected = node2;
        }
    }

    assert(selected == node1);

    return selected;
}

int main() {
    // Constructing BST manually
    TreeNode* root = nullptr;
    root = insert(root, 10);
    insert(root, 5);
    insert(root, 15);
    insert(root, 3);
    insert(root, 7);
    insert(root, 12);
    insert(root, 17);

    TreeNode* node1 = root->left;  // Node with data 5
    TreeNode* node2 = root->right; // Node with data 15

    // int cond;
    // std::cin >> cond;
    TreeNode* selected = fun(node1, node2, 6);

    return 0;
}
