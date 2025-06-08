#include <iostream>
bool assert(bool);
struct Node {
    int data;
    Node* next;
};

int main() {
    Node a{10, nullptr};
    Node b{20, nullptr};

    Node* head = nullptr;

    int cond;
    std::cin >> cond;

    if (cond > 0) {
        head = &a;
    } else {
        head = &b;
    }

    assert(head != nullptr);


    return 0;
}
