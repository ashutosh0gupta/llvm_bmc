void dmbsy();

long int latch[2]= {1,0};
long int flag[2]= {1,0};
long int wrong;
long int stop;

void thread0(){
      //while(1)
      //{
            if(stop != 0) return;
            if(latch[0] == 0) return;
            //assert(!latch[0] || flag[0]);
            dmbsy();
            if(!(latch[0] == 0 || flag[0]!=0 )){
                   wrong = 1;
            }
            dmbsy();
            latch[0] = 0;
            dmbsy();
            if(flag[0] == 0) return;
            dmbsy();
            flag[0] = 0;
            flag[1] = 1;
            dmbsy();
            latch[1] = 1;
      //}
}

void thread1(){
      // while(1)
      //{
            if(stop != 0) return;
            if(latch[1] == 0) return;
            dmbsy();
            if(!(latch[1] == 0 || flag[1]!=0 )){
                   wrong = 1;
            }
            dmbsy();
            latch[1] = 0;
            dmbsy();
            if(flag[1] == 0) return;
            dmbsy();
            flag[1] = 0;
            flag[0] = 1;
            dmbsy();
            latch[0] = 1;
      //}
}

void thread2(){
      stop = 1;
}