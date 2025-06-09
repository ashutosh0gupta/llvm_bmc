#include <iostream>

bool assert(bool);

struct Node {
    int data;
    Node* next;
};

Node* fun(Node* node_1, Node* node_2, int limit) {
    // Node* current1 = head;
    // Node* current2 = head->next;

    Node* selected = nullptr;
    int i = 0;

    while( i < limit) {
        if (i %2 == 0) {
            selected = node_1;
        } else {
            selected = node_2;
        }
        i++;
    }

    assert(selected == node_2);

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

    // int cond;
    // std::cin >> cond;

    Node* selected = fun(head, node3, 6);

    return 0;
}
