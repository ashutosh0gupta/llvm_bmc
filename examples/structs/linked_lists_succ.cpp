#include <iostream>

bool assert(bool);

struct ListNode {
    int data;
    ListNode* next;
};

int main() {
    ListNode* head = new ListNode{5, nullptr};
    head->next = new ListNode{10, nullptr};
    head->next->next = new ListNode{15, nullptr};
    head->next->next->next = new ListNode{20, nullptr};

    // assert(head->next->data == 10);
    assert(head->next->next != nullptr);

    return 0;
}
