#include <atomic>
void dmbsy();

std::atomic<int> lockvar;
std::atomic<int> var;

loop:
      dmbsy();
      int temp = localvar.load(std::memory_order_acquire);
      if (temp != 1) goto loop:
      localvar.store(n + 1, std::memory_order_release);
      
