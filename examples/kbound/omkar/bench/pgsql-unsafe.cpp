long int latch[2] = {1,0};
long int flag[2] = {1,0};
long int wrong;
long int stop;

void thread0(){
      while(1)
      {
            if(stop != 0) break;
            while(latch[0] == 0);
            //assert(!latch[0] || flag[0]);
            if(!(latch[0] == 0 || flag[0]!=0 )){
                   wrong = 1;
            }
            latch[0] = 0;
            if(flag[0] == 0) continue;
            flag[0] = 0;
            flag[1] = 1;
            latch[1] = 1;
      }
}

void thread1(){
       while(1)
      {
            if(stop != 0) break;
            while(latch[1] == 0);
            //assert(!latch[0] || flag[0]);
            if(!(latch[1] == 0 || flag[1]!=0 )){
                   wrong = 1;
            }
            latch[1] = 0;
            if(flag[1] == 0) continue;
            flag[1] = 0;
            flag[0] = 1;
            latch[0] = 1;
      }
}

void thread2(){
      stop = 1;
}