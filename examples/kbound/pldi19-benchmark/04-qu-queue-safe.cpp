/**
 * Michael-Scott Queue
 */

#include <atomic>
#include <thread>

void assume(bool);

template<typename T, size_t n>
class Allocator {
  T objects[n];
  size_t idx;

public:
  Allocator() {
    this->idx = 0;
  }

  T *alloc() {
    if (idx < n) {
      return &objects[idx++];
    } else {
      return nullptr;
    }
  }
};

class Node {
public:
  int64_t data;
  std::atomic<Node*> next;
};

Allocator<Node, 10> allocator;

class Queue {
  Node init;
  std::atomic<Node*> head;
  std::atomic<Node*> tail;
  std::atomic<int64_t> is_initialized;

  Node* find_tail();

public:
  void initialize();
  int64_t get_is_initialized();

  // template<size_t n>
  int64_t try_enq(//Allocator<Node, n> &allocator,
                  int64_t data); // -2 if lost, -3 if oom
  int64_t try_deq(int64_t& data); // -1 if empty, -2 if lost
};

__attribute__((always_inline)) inline void Queue::initialize() {
  this->init.next.store(nullptr, std::memory_order_release);
  this->head.store(&this->init, std::memory_order_release);
  this->tail.store(&this->init, std::memory_order_release);
  this->is_initialized.store(1, std::memory_order_release);
}

__attribute__((always_inline)) inline int64_t Queue::get_is_initialized() {
    return this->is_initialized.load(std::memory_order_acquire);
}

__attribute__((always_inline)) inline Node* Queue::find_tail() {
  Node* node = this->tail.load(std::memory_order_acquire);
  Node* next = node->next.load(std::memory_order_relaxed);

  if (next == nullptr)
    return node;

  this->tail.store(next, std::memory_order_release);
  return nullptr;
}

// template<size_t n>
__attribute__((always_inline)) inline
int64_t Queue::try_enq(//Allocator<Node, n> &allocator,
                       int64_t data) {
  Node* node = allocator.alloc();

  if (node == nullptr) {
    return -3; // oom
  }

  node->data = data;
  node->next.store(nullptr, std::memory_order_relaxed);

  Node* tail = nullptr;
  do {
    tail = this->find_tail();
  } while (tail == nullptr);

  Node* v = nullptr;
  if (tail->next.compare_exchange_strong(v, node, std::memory_order_release)) {
    this->tail.store(node, std::memory_order_release);
    return 0;
  }

  return -2; // CAVEAT: memory leak
}

__attribute__((always_inline)) inline int64_t Queue::try_deq(int64_t& data) {
  Node* head = (Node *) this->head.load(std::memory_order_acquire);
  Node* node = (Node *) head->next.load(std::memory_order_acquire);

  if (node == nullptr)
    return -1;

  if (this->head.compare_exchange_strong(head, node, std::memory_order_release)) {
    data = node->data;
    return 0; // CAVEAT: memory leak
  }

  return -2;
}

#define X1 1
#define X2 0
#define X3 0

#define X4 1
#define X5 0
#define X6 0

#define X7 1
#define X8 0
#define X9 0

Queue q;
int64_t result1, result2, result3;
int64_t result4, result5, result6;
int64_t result7, result8, result9;


// int64_t X1, int64_t X2, int64_t X3,

void thread0() {
  int64_t count(1);
  int64_t data;
  int64_t res;

  q.initialize();

  res = 0;
  for (int64_t i = 0; i < X1; i++) {
    if (q.try_enq(//allocator,
                  count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;

  res = 0;
  for (int64_t i = 0; i < X2; i++) {
    if (q.try_deq(data) >= 0) {
      res += data;
    }
  }
  result2 = res;

  res = 0;
  for (int64_t i = 0; i < X3; i++) {
    if (q.try_enq(//allocator,
                  count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result3 = res;
}

void thread1() {
  int64_t count(1);
  int64_t data;
  int64_t res;

  if (q.get_is_initialized() != 1)
    return;

  res = 0;
  for (int64_t i = 0; i < X4; i++) {
    if (q.try_enq(//allocator,
                  count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result4 = res;

  res = 0;
  for (int64_t i = 0; i < X5; i++) {
    if (q.try_deq(data) >= 0) {
      res += data;
    }
  }
  result5 = res;

  res = 0;
  for (int64_t i = 0; i < X6; i++) {
    if (q.try_enq(//allocator,
                  count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result6 = res;
}

void thread2() {
  int64_t count(1);
  int64_t data;
  int64_t res;

  if (q.get_is_initialized() != 1)
    return;

  res = 0;
  for (int64_t i = 0; i < X7; i++) {
    if (q.try_enq(//allocator,
                  count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result7 = res;

  res = 0;
  for (int64_t i = 0; i < X8; i++) {
    if (q.try_deq(data) >= 0) {
      res += data;
    }
  }
  result8 = res;

  res = 0;
  for (int64_t i = 0; i < X9; i++) {
    if (q.try_enq(//allocator,
                  count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result9 = res;
}
