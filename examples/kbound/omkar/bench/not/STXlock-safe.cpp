#include <atomic>
void dmbsy();

std::atomic<int64_t> lockvar;
std::atomic<int64_t> var;

void thread0(){
      dmbsy();
      while(lockvar != 0){
            dmbsy();
            lockvar = 1;
            dmbsy();
      }
      //while(lockvar.compare_exchange_strong(v,t,std::memory_order_acquire, std::memory_order_relaxed));   
      dmbsy();
      //cs
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      lockvar = 0;

}
void thread1(){
      dmbsy();
      while(lockvar != 0){
            dmbsy();
            lockvar = 2;
            dmbsy();
      }
      //while(lockvar.compare_exchange_strong(v,t,std::memory_order_acquire, std::memory_order_relaxed));   
      dmbsy();
      //cs
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      lockvar = 0;

}