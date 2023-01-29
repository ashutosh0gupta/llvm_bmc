#include <atomic>
void dmbsy();

std::atomic<int64_t> lockvar;
std::atomic<int64_t> var;

void thread0(){
      int64_t v = 0;
      int64_t t = 1;
      while(lockvar != 0){
            lockvar = 1;
      }
      var = var + 1;
      //unlock
      lockvar = 0;

}
void thread1(){
      int64_t v = 0;
      int64_t t = 2;
      while(lockvar != 0){
            lockvar = 1;
      }
      //cs
      var = var + 1;
      //unlock
      lockvar = 0;

}