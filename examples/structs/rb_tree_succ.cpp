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

RBNode* create(int data, Color color, RBNode* parent) {
    return new RBNode{data, color, nullptr, nullptr, parent};
}

int main() {
    // Level 0
    RBNode* root = create(10, BLACK, nullptr);

    // Level 1
    RBNode* leftChild = create(5, RED, root);
    RBNode* rightChild = create(15, RED, root);
    root->left = leftChild;
    root->right = rightChild;

    // Level 2
    RBNode* leftLeft = create(3, BLACK, leftChild);
    RBNode* leftRight = create(7, BLACK, leftChild);
    leftChild->left = leftLeft;
    leftChild->right = leftRight;

    RBNode* rightLeft = create(12, BLACK, rightChild);
    RBNode* rightRight = create(17, BLACK, rightChild);
    rightChild->left = rightLeft;
    rightChild->right = rightRight;

    // Level 3 are leaf nodes
    leftLeft->left  = create(1, RED, leftLeft);
    leftLeft->right = create(4, RED, leftLeft);

    leftRight->left  = create(6, RED, leftRight);
    leftRight->right = create(8, RED, leftRight);

    rightLeft->left  = create(11, RED, rightLeft);
    rightLeft->right = create(13, RED, rightLeft);

    rightRight->left  = create(16, RED, rightRight);
    rightRight->right = create(18, RED, rightRight);

    // assert(root->color == BLACK); // Root must be black

    assert(root->left->color == RED && root->left->left->color != RED); // child of red must not be red




    return 0;
}
