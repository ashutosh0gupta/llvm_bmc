// https://github.com/jeehoonkang/crossbeam-rfcs/blob/deque-proof/text/2018-01-07-deque-proof.md
//
// CAVEAT: no resizing

#include <atomic>
#include <thread>

class Deque {
  std::atomic<uint64_t> bottom;
  std::atomic<uint64_t> top;
  int64_t buffer[10]; // in fact, it should be marked as atomic due to the race between push and
                     // steal.

public:
  Deque(): bottom(0), top(0) {
  }

  int64_t try_push(int64_t N, int64_t data); // -1 if full
  int64_t try_pop(int64_t N, int64_t& data); // -1 if empty, -2 if lost
  int64_t try_steal(int64_t N, int64_t& data); // -1 if empty, -2 if lost
};

__attribute__((always_inline)) inline int64_t Deque::try_push(int64_t N, int64_t data) {
  uint64_t b = bottom.load(std::memory_order_relaxed);
  uint64_t t = top.load(std::memory_order_relaxed);

  int64_t len = static_cast<int64_t>(b - t);
  if (len >= N) {
    return -1; // full
  }

  buffer[b % N] = data;
  bottom.store(b + 1, std::memory_order_release);
  return 0;
}

__attribute__((always_inline)) inline int64_t Deque::try_pop(int64_t N, int64_t& data) {
  uint64_t b = bottom.load(std::memory_order_relaxed);
  bottom.store(b - 1, std::memory_order_relaxed);

  std::atomic_thread_fence(std::memory_order_seq_cst);

  uint64_t t = top.load(std::memory_order_relaxed);
  int64_t len = static_cast<int64_t>(b - t);

  if (len <= 0) {
    bottom.store(b, std::memory_order_relaxed);
    return -1; // empty
  }

  data = buffer[(b - 1) % N];

  if (len > 1) {
    return 0;
  }

  // len = 1.
  bool is_successful = top.compare_exchange_strong(t, t + 1, std::memory_order_release);
  bottom.store(b, std::memory_order_relaxed);
  return (is_successful ? 0 : -2); // success or lost
}

__attribute__((always_inline)) inline int64_t Deque::try_steal(int64_t N, int64_t& data) {
  uint64_t t = top.load(std::memory_order_relaxed);

  std::atomic_thread_fence(std::memory_order_seq_cst);

  uint64_t b = bottom.load(std::memory_order_acquire);
  int64_t len = static_cast<int64_t>(b - t);

  if (len <= 0) {
    return -1; // empty
  }

  data = buffer[t % N];

  bool is_successful = top.compare_exchange_strong(t, t + 1, std::memory_order_release);
  return (is_successful ? 0 : -2); // success or lost
}

Deque que;
//int64_t N;
#define N 2
#define X01  2
#define X02  1
#define X1 2
#define X2 1
#define X3 1
// int64_t X, X1, X2, X3;
int64_t result1, result2, result3;
int64_t result4, result5, result6;

void thread0() {
  int64_t count(1);
  int64_t data;
  int64_t res;

  res = 0;
  for (int64_t i = 0; i < X1; ++i) {
    if (que.try_push(N, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result1 = res;

  res = 0;
  for (int64_t i = 0; i < X2; ++i) {
    if (que.try_pop(N, data) >= 0) {
      res += data;
    }
  }
  result2 = res;

  res = 0;
  for (int64_t i = 0; i < X3; ++i) {
    if (que.try_push(N, count) >= 0) {
      res += count;
      count *= 2;
    }
  }
  result3 = res;
}

void thread1() {
  int64_t data;
  int64_t res = 0;
  for (int64_t i = 0; i < X01; ++i) {
    if (que.try_steal(N, data) >= 0) {
      res += data;
    }
  }
  result4 = res;
}

void thread2() {
  int64_t data;
  int64_t res = 0;
  for (int64_t i = 0; i < X02; ++i) {
    if (que.try_steal(N, data) >= 0) {
      res += data;
    }
  }
  result5 = res;
}
