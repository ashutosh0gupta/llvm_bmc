void dmbsy();
long int flag[2];
long int var;

void thread0(){
      flag[0] = 1;
      dmbsy();
      if(flag[1] >= 3) return;
      dmbsy();
      flag[0] = 3;
      dmbsy();
      if(flag[1] == 1){
            dmbsy();
            flag[0] = 2;
            dmbsy();
            if(flag[1] != 4) return;
      }
      dmbsy();
      flag[0] = 4;
      dmbsy();
      if(flag[1] >= 2) return;
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      if(flag[1] != 3 && flag[1] != 2) return;
      dmbsy();
      flag[0] = 0;
}
void thread1(){
      flag[1] = 1;
      dmbsy();
      if(flag[0] >= 3) return;
      dmbsy();
      flag[1] = 3;
      dmbsy();
      if(flag[0] == 1){
            dmbsy();
            flag[1] = 2;
            dmbsy();
            if(flag[0] != 4) return;
      }
      dmbsy();
      flag[1] = 4;
      dmbsy();
      if(flag[0] >= 2) return;
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      if(flag[0] != 3 && flag[0] != 2) return;
      dmbsy();
      flag[1] = 0;
}