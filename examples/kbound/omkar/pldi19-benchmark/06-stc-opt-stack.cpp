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
  std::atomic<long int> data;
  std::atomic<Node*> next;
};

class Stack {
  std::atomic<Node *> head;

public:
  Stack(): head(nullptr) {
  }

  template<size_t n>
  long int try_push(Allocator<Node, n> &allocator, long int data); // -2 if lost, -3 if oom
  long int try_pop(long int& data); // -1 if empty, -2 if lost
};

template<size_t n>
__attribute__((always_inline)) inline
long int Stack::try_push(Allocator<Node, n> &allocator, long int data) {
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

__attribute__((always_inline)) inline long int Stack::try_pop(long int& data) {
  auto head = this->head.load(std::memory_order_relaxed);

  if (head == nullptr) {
    return -1; // empty
  }

  data = head->data.load(std::memory_order_relaxed);
  Node* next = head->next.load(std::memory_order_relaxed);
  bool is_successful = this->head.compare_exchange_strong(head, next, std::memory_order_relaxed);
  return (is_successful ? 0 : -2); // CAVEAT: memory leak if successful
}

Stack s;
Allocator<Node, 10> allocator;
long int result1, result2, result3;
long int result4, result5, result6;
long int result7, result8, result9;

#define X1 2
#define X2 2
#define X3 3

#define X4 2
#define X5 2
#define X6 3

#define X7 2
#define X8 2
#define X9 3

void thread0() {
  long int count(1);
  long int data;
  long int res;

  res = 0;
  for (long int i = 0; i < X1; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;

  res = 0;
  for (long int i = 0; i < X2; i++) {
    if (s.try_pop(data) >= 0) {
      res += data;
    }
  }
  result2 = res;

  res = 0;
  for (long int i = 0; i < X3; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result3 = res;
}

void thread1() {
  long int count(1);
  long int data;
  long int res;

  res = 0;
  for (long int i = 0; i < X1; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result4 = res;

  res = 0;
  for (long int i = 0; i < X2; i++) {
    if (s.try_pop(data) >= 0) {
      res += data;
    }
  }
  result5 = res;

  res = 0;
  for (long int i = 0; i < X3; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result6 = res;
}

void thread2() {
  long int count(1);
  long int data;
  long int res;

  res = 0;
  for (long int i = 0; i < X1; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result7 = res;

  res = 0;
  for (long int i = 0; i < X2; i++) {
    if (s.try_pop(data) >= 0) {
      res += data;
    }
  }
  result8 = res;

  res = 0;
  for (long int i = 0; i < X3; i++) {
    if (s.try_push(allocator, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result9 = res;
}

// void thread0(Stack& s, Allocator<Node, 10>& allocator, long int X1, long int X2,
//     long int X3, long int& result1, long int& result2, long int& result3) {
//   long int count(1);
//   long int data;
//   long int res;

//   res = 0;
//   for (long int i = 0; i < X1; i++) {
//     if (s.try_push(allocator, count) >= 0) {
//       res += count;
//       count *= 2;
//     }
//   }
//   result1 = res;

//   res = 0;
//   for (long int i = 0; i < X2; i++) {
//     if (s.try_pop(data) >= 0) {
//       res += data;
//     }
//   }
//   result2 = res;

//   res = 0;
//   for (long int i = 0; i < X3; i++) {
//     if (s.try_push(allocator, count) >= 0) {
//       res += count;
//       count *= 2;
//     }
//   }
//   result3 = res;
// }

// void thread1(Stack& s, Allocator<Node, 10>& allocator, long int X1, long int X2,
//     long int X3, long int& result1, long int& result2, long int& result3) {
//   long int count(1);
//   long int data;
//   long int res;

//   res = 0;
//   for (long int i = 0; i < X1; i++) {
//     if (s.try_push(allocator, count) >= 0) {
//       res += count;
//       count *= 2;
//     }
//   }
//   result1 = res;

//   res = 0;
//   for (long int i = 0; i < X2; i++) {
//     if (s.try_pop(data) >= 0) {
//       res += data;
//     }
//   }
//   result2 = res;

//   res = 0;
//   for (long int i = 0; i < X3; i++) {
//     if (s.try_push(allocator, count) >= 0) {
//       res += count;
//       count *= 2;
//     }
//   }
//   result3 = res;
// }

// void thread2(Stack& s, Allocator<Node, 10>& allocator, long int X1, long int X2,
//     long int X3, long int& result1, long int& result2, long int& result3) {
//   long int count(1);
//   long int data;
//   long int res;

//   res = 0;
//   for (long int i = 0; i < X1; i++) {
//     if (s.try_push(allocator, count) >= 0) {
//       res += count;
//       count *= 2;
//     }
//   }
//   result1 = res;

//   res = 0;
//   for (long int i = 0; i < X2; i++) {
//     if (s.try_pop(data) >= 0) {
//       res += data;
//     }
//   }
//   result2 = res;

//   res = 0;
//   for (long int i = 0; i < X3; i++) {
//     if (s.try_push(allocator, count) >= 0) {
//       res += count;
//       count *= 2;
//     }
//   }
//   result3 = res;
// }
