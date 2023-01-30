void dmbsy();
void assert(bool);

long int latch[2] = {1,0};
long int flag[2] = {1,0};
long int wrong=0;

void thread0(){
  wrong = 1;
      dmbsy();
      for (int i = 0; i < 4; i++)
      {
            while(latch[0] == 0);
            dmbsy();
            assert(!latch[0] || flag[0]);
            dmbsy();
            latch[0] = 0;
            dmbsy();
            if(flag[0] != 0){
                  dmbsy();
                  flag[0] = 0;
                  flag[1] = 1;
                  dmbsy();
                  latch[1] = 1;
            }
      }
}

void thread1(){
      dmbsy();
      for (int i = 0; i < 4; i++)
      {
            while(latch[1] == 0);
            dmbsy();
            assert(!latch[1] || flag[1]);
            dmbsy();
            latch[1] = 0;
            dmbsy();
            if(flag[1] != 0){
                  dmbsy();
                  flag[1] = 0;
                  flag[0] = 1;
                  dmbsy();
                  latch[0] = 1;
            }
      }
}

