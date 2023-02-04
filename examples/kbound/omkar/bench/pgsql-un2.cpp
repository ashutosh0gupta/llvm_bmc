
long int latch[2]= {1,0};
long int flag[2]= {1,0};
long int wrong;
long int stop;

void thread0(){
      for (int i = 0; i < 2; i++)
      {
            if(stop != 0) return;
            if(latch[0] == 0) return;
            //assert(!latch[0] || flag[0]);
            
            if(!(latch[0] == 0 || flag[0]!=0 )){
                   wrong = 1;
            }
            
            latch[0] = 0;
            
            if(flag[0] == 0) return;
            
            flag[0] = 0;
            flag[1] = 1;
            
            latch[1] = 1;
      }
      
}

void thread1(){
      for (int i = 0; i < 2; i++)
      {
            if(stop != 0) return;
            if(latch[1] == 0) return;
            
            if(!(latch[1] == 0 || flag[1]!=0 )){
                   wrong = 1;
            }
            
            latch[1] = 0;
            
            if(flag[1] == 0) return;
            
            flag[1] = 0;
            flag[0] = 1;
            
            latch[0] = 1;
      }
      
}

void thread2(){
      stop = 1;
}