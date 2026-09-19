#include <iostream>

bool assert(bool);

struct ListNode {
    int data;
    ListNode* next;
};

int main() {
    // Creating a linked list: 5 -> 7 
    ListNode* head = new ListNode{5, nullptr};
    head->next = new ListNode{7, nullptr};

    assert(head->next->data == 10); // Assertion to force phi node in LLVM IR
    // assert(head->next->next != nullptr); // Another assertion to force phi node

    // assert(head->next->next->next); 

    return 0;
}
