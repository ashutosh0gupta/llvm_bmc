
long int flag[2];
long int turn;
long int var;

void thread0(){
      //lock
      flag[0] = 1;
      turn = 1;
      if(flag[1] == 1 && turn == 1) return;
      //CS
      var = var + 1;
      //unlock
      flag[0] = 0;
}

void thread1(){
      //lock
      flag[1] = 1;
      turn = 0;
      if(flag[0] == 1 && turn == 0) return;
      //CS
      var = var + 1;
      //unlock
      flag[1] = 0;
}