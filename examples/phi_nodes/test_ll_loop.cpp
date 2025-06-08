#include <iostream>

bool assert(bool);

struct Node {
    int data;
    Node* next;
};

Node* fun(Node* head, int cond, int limit) {
    Node* current1 = head;
    Node* current2 = head->next;

    Node* selected = nullptr;

    for (int i = 0; i < limit; ++i) {
        if (cond > 0) {
            selected = current1;
        } else {
            selected = current2;
        }
    }

    assert(selected != current2);

    return selected;
}

int main() {
    Node* node1 = new Node{1, nullptr};
    Node* node2 = new Node{2, nullptr};
    Node* node3 = new Node{3, nullptr};
    Node* node4 = new Node{4, nullptr};
    Node* node5 = new Node{5, nullptr};

    node1->next = node2;
    node2->next = node3;
    node3->next = node4;
    node4->next = node5;

    Node* head = node1;

    int cond;
    std::cin >> cond;

    Node* selected = fun(head, cond, 1);

    return 0;
}
