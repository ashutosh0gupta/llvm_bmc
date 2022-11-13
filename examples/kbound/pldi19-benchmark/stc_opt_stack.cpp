// Treiber stack.

#include <atomic>
#include <thread>

template<typename T, size_t n>
class Allocator {
  T objects[n];
  size_t idx;

public:
  T *alloc() {
    if (idx < n) {
      return &objects[idx++];
    } else {
      return nullptr;
    }
  }
};

struct Node {
  std::atomic<int64_t> data;
  std::atomic<Node*> next;
};

class Stack {
  std::atomic<Node *> head;

public:
  Stack(): head(nullptr) {
  }

  template<size_t n>
  int64_t try_push(Allocator<Node, n> &allocator, int64_t data); // -2 if lost, -3 if oom
  int64_t try_pop(int64_t& data); // -1 if empty, -2 if lost
};

template<size_t n>
__attribute__((always_inline)) inline
int64_t Stack::try_push(Allocator<Node, n> &allocator, int64_t data) {
  Node *node = allocator.alloc();

  if (node == nullptr) {
    return -3; // oom
  }

  node->data.store(data, std::memory_order_relaxed);
  auto head = this->head.load(std::memory_order_relaxed);
  node->next.store(head, std::memory_order_relaxed);
  bool is_successful = this->head.compare_exchange_strong(head, node, std::memory_order_release);
  return (is_successful ? 0 : -2); // CAVEAT: memory leak if unsuccessful
}

__attribute__((always_inline)) inline int64_t Stack::try_pop(int64_t& data) {
  auto head = this->head.load(std::memory_order_relaxed);

  if (head == nullptr) {
    return -1; // empty
  }

  data = head->data.load(std::memory_order_relaxed);
  Node* next = head->next.load(std::memory_order_relaxed);
  bool is_successful = this->head.compare_exchange_strong(head, next, std::memory_order_relaxed);
  return (is_successful ? 0 : -2); // CAVEAT: memory leak if successful
}

void thread0(Stack& s, Allocator<Node, 10>& allocator, int64_t X1, int64_t X2,
    int64_t X3, int64_t& result1, int64_t& result2, int64_t& result3) {
  int64_t count(1);
  int64_t data;
  int64_t res;

  res = 0;
  for (int64_t i = 0; i < X1; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;

  res = 0;
  for (int64_t i = 0; i < X2; i++) {
    if (s.try_pop(data) >= 0) {
      res += data;
    }
  }
  result2 = res;

  res = 0;
  for (int64_t i = 0; i < X3; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result3 = res;
}

void thread1(Stack& s, Allocator<Node, 10>& allocator, int64_t X1, int64_t X2,
    int64_t X3, int64_t& result1, int64_t& result2, int64_t& result3) {
  int64_t count(1);
  int64_t data;
  int64_t res;

  res = 0;
  for (int64_t i = 0; i < X1; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;

  res = 0;
  for (int64_t i = 0; i < X2; i++) {
    if (s.try_pop(data) >= 0) {
      res += data;
    }
  }
  result2 = res;

  res = 0;
  for (int64_t i = 0; i < X3; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result3 = res;
}

void thread2(Stack& s, Allocator<Node, 10>& allocator, int64_t X1, int64_t X2,
    int64_t X3, int64_t& result1, int64_t& result2, int64_t& result3) {
  int64_t count(1);
  int64_t data;
  int64_t res;

  res = 0;
  for (int64_t i = 0; i < X1; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;

  res = 0;
  for (int64_t i = 0; i < X2; i++) {
    if (s.try_pop(data) >= 0) {
      res += data;
    }
  }
  result2 = res;

  res = 0;
  for (int64_t i = 0; i < X3; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result3 = res;
}
