#include<atomic>
//void 
int flag[2] = {0,0};
//int var=0;
std::atomic<int> var;
void thread0 (){
      int temp;
      flag[0] = 1;
      
      //while (flag[1] == 1);
      for (int i = 0; i < 5; i++)
      {
           
            temp = flag[1];
           
      }
      
      var.fetch_add(1, std::memory_order_relaxed);
      
      flag[0]=0;
}

void thread1 (){
      int temp;
      flag[1] = 0;
      
      //while (flag[0] == 1);
      for (int i = 0; i < 5; i++)
      {
            
            temp = flag[0];
            
      }
      
      flag[1] =1 ;
      
      //while (flag[0] == 1);
      for (int i = 0; i < 5; i++)
      {
            
            temp = flag[0];
            
      }
      
      var.fetch_add(1, std::memory_order_relaxed);
      
      flag[1]=0;
}