#include <atomic>

void assume(bool);

// class SpinLock {
  std::atomic<int64_t> locked;

// public:
//   SpinLock(): locked(0) {
//   }

  bool lock();
  void unlock();
// };

__attribute__((always_inline)) inline bool
// SpinLock::
lock() {
  int64_t v = 0;
  return locked.compare_exchange_strong(v, 1, std::memory_order_acquire, std::memory_order_relaxed);
}

__attribute__((always_inline)) inline void
// SpinLock::
unlock() {
  locked.store(0, std::memory_order_release);
}

#define X 3
int64_t data;

void thread0(//SpinLock &l, int64_t X, int64_t &data
             ) {
  int64_t i = 0;
  for (; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }//else{ assume( i < X-1 ); }
  }
}

void thread1(//SpinLock &l, int64_t X, int64_t &data
             ) {
  for (int64_t i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }//else{ assume( i < X-1 ); }
  }
}

void thread2(//SpinLock &l, int64_t X, int64_t &data
             ) {
  for (int64_t i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }//else{ assume( i < X-1 ); }
  }
}

void thread3(//SpinLock &l, int64_t X, int64_t &data
             ) {
  for (int64_t i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }else{ assume( i < X-1 ); }
  }
}

void thread4(//SpinLock &l, int64_t X, int64_t &data
             ) {
  for (int64_t i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }else{ assume( i < X-1 ); }
  }
}

void thread5(//SpinLock &l, int64_t X, int64_t &data
             ) {
  for (int64_t i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }else{ assume( i < X-1 ); }
  }
}
