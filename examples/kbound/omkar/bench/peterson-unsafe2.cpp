void dmbsy();

long int flag[2];
long int turn;
long int var;

void thread0(){
      //lock
      dmbsy();
      flag[0] = 1;
      turn = 1;
      dmbsy();
      while(flag[1] == 1 && turn == 1){dmbsy();}
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag[0] = 0;
}

void thread1(){
      //lock
      dmbsy();
      flag[1] = 1;
      turn = 0;
      dmbsy();
      while(flag[0] == 1 && turn == 0){dmbsy();}
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag[1] = 0;
}