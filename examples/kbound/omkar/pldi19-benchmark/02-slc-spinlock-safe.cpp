#include <atomic>

void assume(bool);

// class SpinLock {
  std::atomic<long int> locked;

// public:
//   SpinLock(): locked(0) {
//   }

  bool lock();
  void unlock();
// };

__attribute__((always_inline)) inline bool
// SpinLock::
lock() {
  long int v = 0;
  return locked.compare_exchange_strong(v, 1, std::memory_order_acquire, std::memory_order_relaxed);
}

__attribute__((always_inline)) inline void
// SpinLock::
unlock() {
  locked.store(0, std::memory_order_release);
}

#define X 3
long int data;

void thread0(//SpinLock &l, long int X, long int &data
             ) {
  long int i = 0;
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

void thread1(//SpinLock &l, long int X, long int &data
             ) {
  for (long int i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }//else{ assume( i < X-1 ); }
  }
}

void thread2(//SpinLock &l, long int X, long int &data
             ) {
  for (long int i = 0; i < X; ++i) {
    if (//l.
        lock()) {
      data += 42;
      //l.
        unlock();
      break;
    }//else{ assume( i < X-1 ); }
  }
}

// void thread3(//SpinLock &l, long int X, long int &data
//              ) {
//   for (long int i = 0; i < X; ++i) {
//     if (//l.
//         lock()) {
//       data += 42;
//       //l.
//         unlock();
//       break;
//     }else{ assume( i < X-1 ); }
//   }
// }

// void thread4(//SpinLock &l, long int X, long int &data
//              ) {
//   for (long int i = 0; i < X; ++i) {
//     if (//l.
//         lock()) {
//       data += 42;
//       //l.
//         unlock();
//       break;
//     }else{ assume( i < X-1 ); }
//   }
// }

// void thread5(//SpinLock &l, long int X, long int &data
//              ) {
//   for (long int i = 0; i < X; ++i) {
//     if (//l.
//         lock()) {
//       data += 42;
//       //l.
//         unlock();
//       break;
//     }else{ assume( i < X-1 ); }
//   }
// }
