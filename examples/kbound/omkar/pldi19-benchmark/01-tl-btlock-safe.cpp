#include <atomic>
#include <thread>

void assume(bool);

// class BTLock {
  std::atomic<int64_t> ns;
  std::atomic<int64_t> tc;

// public:
//   BTLock(): ns(0), tc(0) {
//   }

  int64_t lock(int64_t X); // returns 0 when it fails to get a lock
  void unlock();
// };

__attribute__((always_inline)) inline
int64_t
//BTLock::
lock(int64_t X) {
  int64_t t = tc.fetch_add(1, std::memory_order_acquire);
  int64_t n;

  // for (int64_t i = 0; i < X; i++) {
    n = ns.load(std::memory_order_acquire);
    if (n == t)
      return t + 1;
    else
      assume(false);
  // }

  return 0; // lock failed
}

__attribute__((always_inline))
 inline void
//BTLock::
unlock() {
  int64_t n = ns.load(std::memory_order_relaxed);
  ns.store(n + 1, std::memory_order_release);
}

__attribute__((always_inline)) inline void
//BTLock::
unlock_unsafe() {
  int64_t n = ns.load(std::memory_order_relaxed);
  ns.store(n + 1, std::memory_order_relaxed);
}

// BTLock l;

int64_t data;
int64_t ticket;
int64_t observed;
#define X 3

void thread0(//int64_t X
             //, int64_t& data, int64_t& ticket, int64_t& observed
             ) {
  ticket = 1;
  if (//ticket = //l.
      lock(X)) {
    data += 42;
    //observed = data;
    //l.
    unlock();
  }
}

void thread1( //int64_t X
             //, int64_t& data, int64_t& ticket, int64_t& observed
             ) {
  if (//ticket = //l.
      lock(X)) {
    data += 42;
    //observed = data;
    //l.
    unlock();
  }
}

void thread2(//int64_t X
               //, int64_t& data, int64_t& ticket, int64_t& observed
               ){
  if (//ticket = //l.
      lock(X)) {
    data += 42;
    //observed = data;
    //l.
    unlock();
  }
}

void thread3(//int64_t X
               //, int64_t& data, int64_t& ticket, int64_t& observed
               ){
  if (//ticket = //l.
      lock(X)) {
    data += 42;
    //observed = data;
    //l.
    unlock();
  }
}

void thread4(//int64_t X
               //, int64_t& data, int64_t& ticket, int64_t& observed
               ){
  if (//ticket = //l.
      lock(X)) {
    data += 42;
    //observed = data;
    //l.
    unlock();
  }
}

void thread5(//int64_t X
               //, int64_t& data, int64_t& ticket, int64_t& observed
               ){
  if (//ticket = //l.
      lock(X)) {
    data += 42;
    //observed = data;
    //l.
    unlock();
  }
}
