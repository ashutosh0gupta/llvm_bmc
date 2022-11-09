#include <atomic>
#include <thread>

class BTLock {
  std::atomic<int64_t> ns;
  std::atomic<int64_t> tc;

public:
  BTLock(): ns(0), tc(0) {
  }

  int64_t lock(int64_t X); // returns 0 when it fails to get a lock
  void unlock();
};

__attribute__((always_inline)) inline int64_t BTLock::lock(int64_t X) {
  int64_t t = this->tc.fetch_add(1, std::memory_order_relaxed);
  int64_t n;

  for (int64_t i = 0; i < X; i++) {
    n = this->ns.load(std::memory_order_acquire);
    if (n == t)
      return t + 1;
  }

  return 0; // lock failed
}

__attribute__((always_inline)) inline void BTLock::unlock() {
  int64_t n = this->ns.load(std::memory_order_relaxed);
  this->ns.store(n + 1, std::memory_order_release);
}

void thread0(BTLock& l, int64_t X, int64_t& data, int64_t& ticket, int64_t& observed) {
  if (ticket = l.lock(X)) {
    data += 42;
    observed = data;
    l.unlock();
  }
}

void thread1(BTLock& l, int64_t X, int64_t& data, int64_t& ticket, int64_t& observed) {
  if (ticket = l.lock(X)) {
    data += 42;
    observed = data;
    l.unlock();
  }
}

void thread2(BTLock& l, int64_t X, int64_t& data, int64_t& ticket, int64_t& observed) {
  if (ticket = l.lock(X)) {
    data += 42;
    observed = data;
    l.unlock();
  }
}
