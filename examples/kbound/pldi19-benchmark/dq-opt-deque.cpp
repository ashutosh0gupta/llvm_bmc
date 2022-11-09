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
  uint64_t b = this->bottom.load(std::memory_order_relaxed);
  uint64_t t = this->top.load(std::memory_order_relaxed);

  int64_t len = static_cast<int64_t>(b - t);
  if (len >= N) {
    return -1; // full
  }

  this->buffer[b % N] = data;
  this->bottom.store(b + 1, std::memory_order_release);
  return 0;
}

__attribute__((always_inline)) inline int64_t Deque::try_pop(int64_t N, int64_t& data) {
  uint64_t b = this->bottom.load(std::memory_order_relaxed);
  this->bottom.store(b - 1, std::memory_order_relaxed);

  std::atomic_thread_fence(std::memory_order_seq_cst);

  uint64_t t = this->top.load(std::memory_order_relaxed);
  int64_t len = static_cast<int64_t>(b - t);

  if (len <= 0) {
    this->bottom.store(b, std::memory_order_relaxed);
    return -1; // empty
  }

  data = this->buffer[(b - 1) % N];

  if (len > 1) {
    return 0;
  }

  // len = 1.
  bool is_successful = this->top.compare_exchange_strong(t, t + 1, std::memory_order_release);
  this->bottom.store(b, std::memory_order_relaxed);
  return (is_successful ? 0 : -2); // success or lost
}

__attribute__((always_inline)) inline int64_t Deque::try_steal(int64_t N, int64_t& data) {
  uint64_t t = this->top.load(std::memory_order_relaxed);

  std::atomic_thread_fence(std::memory_order_seq_cst);

  uint64_t b = this->bottom.load(std::memory_order_acquire);
  int64_t len = static_cast<int64_t>(b - t);

  if (len <= 0) {
    return -1; // empty
  }

  data = this->buffer[t % N];

  bool is_successful = this->top.compare_exchange_strong(t, t + 1, std::memory_order_release);
  return (is_successful ? 0 : -2); // success or lost
}

void thread0(Deque& que, int64_t N, int64_t X1, int64_t X2, int64_t X3, int64_t& result1, int64_t& result2, int64_t& result3) {
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

void thread1(Deque& que, int64_t N, int64_t X, int64_t& result) {
  int64_t data;
  int64_t res = 0;
  for (int64_t i = 0; i < X; ++i) {
    if (que.try_steal(N, data) >= 0) {
      res += data;
    }
  }
  result = res;
}

void thread2(Deque& que, int64_t N, int64_t X, int64_t& result) {
  int64_t data;
  int64_t res = 0;
  for (int64_t i = 0; i < X; ++i) {
    if (que.try_steal(N, data) >= 0) {
      res += data;
    }
  }
  result = res;
}
