long int latch[2];
long int flag[2];
long int wrong;

void thread0(){
      for (long int i = 0; i < 4; i++)
      {
            while(latch[0] != 1);
            //assert(!latch[0] || flag[0]);
            if(!(latch[0] == 0 || flag[0]==1)){
                wrong = 1;  
            }
             latch[0] = 0;
                  if(flag[0] == 1){
                        flag[0] = 0;
                        flag[1] = 1;
                        latch[1] = 1;
                  }
           
      }
}

void thread1(){
      for (long int i = 0; i < 4; i++)
      {
            while(latch[1] != 1);
            if(!(latch[1]==0 || flag[1] == 1)){
                  wrong = 1;
            }
            latch[1] = 0;
                  if(flag[1] == 1){
                        flag[1] = 0;
                        flag[0] = 1;
                        latch[0] = 1;
                  }
      }
}

