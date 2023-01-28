#include <atomic>
#include <thread>

class Queue {
  std::atomic<int64_t> ri;
  std::atomic<int64_t> wi;
  int64_t buffer[10];

public:
  Queue(): ri(0), wi(0) {
  }

  int64_t try_prod(int64_t N, int64_t data); // -1 if full
  int64_t try_cons(int64_t N, int64_t& data); // -1 if empty, -2 if lost
};


inline int64_t Queue::try_prod(int64_t N, int64_t data) {
  int64_t w = this->wi.load(std::memory_order_relaxed);
  int64_t r = this->ri.load(std::memory_order_acquire);

  if (w >= r + N) {
    return -1; // full
  }

  this->buffer[w % N] = data;
  this->wi.store(w + 1, std::memory_order_release);

  return 0;
}

inline int64_t Queue::try_cons(int64_t N, int64_t& data) {
  int64_t w = this->wi.load(std::memory_order_acquire);
  int64_t r = this->ri.load(std::memory_order_acquire);

  if (r >= w) {
    return -1; // empty
  }

  data = this->buffer[r % N];
  bool is_successful = this->ri.compare_exchange_strong(r, r + 1, std::memory_order_release);

  if (is_successful) {
    return 0; // successful
  } else {
    return -2; // lost race
  }
}

Queue que;
int64_t result1, result2, result3;
//int64_t N;
#define N 2
#define X1 1
#define X2 1
#define X3 1


void thread0() {
  int64_t count(1);
  int64_t res = 0;
  for (int64_t i = 0; i < X1; ++i) {
    if (que.try_prod(N, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;
}

void thread1() {
  int64_t data;
  int64_t res = 0;
  for (int64_t i = 0; i < X2; ++i) {
    if (que.try_cons(N, data) >= 0) {
      res += data;
    }
  }
  result2 = res;
}

void thread2() {
  int64_t data;
  int64_t res = 0;
  for (int64_t i = 0; i < X3; ++i) {
    if (que.try_cons(N, data) >= 0) {
      res += data;
    }
  }
  result3 = res;
}
