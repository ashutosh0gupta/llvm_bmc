#include <atomic>
void dmbsy();

int queue[3];
int var;
std::atomic<int> lock;
int doorbell[3];

void thread0(){
      //getlock
      while(lock != 0){
            lock=1;
      }
      int i=0;
      dmbsy();
      while(queue[i] != -1){

            dmbsy();
      }

}