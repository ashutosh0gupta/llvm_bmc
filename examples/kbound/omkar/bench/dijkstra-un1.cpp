void dmbsy();

long int flag[2] = {0,0};
long int turn = 0;
long int var = 0;

void thread0(){
      //begin:
            dmbsy();
            flag[0] = 1;
            dmbsy();
            if ( turn == 0) goto endloop;
            //ide_loop:
                  dmbsy();
                  if( flag[1] != 0) return; //goto ide_loop;
            turn = 0;
            endloop:
                  dmbsy();
                  flag[0] = 2;
                  dmbsy();
                  if(flag[1] == 2) return; //goto begin;
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag[0] = 0;

}
void thread1(){
      //begin:
            dmbsy();
            flag[1] = 1;
            dmbsy();
            if ( turn != 0) goto endloop;
            //ide_loop:
                  dmbsy();
                  if( flag[0] != 0) return; //goto ide_loop;
            turn = 1;
            endloop:
                  dmbsy();
                  flag[1] = 2;
                  dmbsy();
                  if(flag[0] == 2) return; //goto begin;
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag[1] = 0;

}