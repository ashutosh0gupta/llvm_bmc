void dmbsy();
long int flag[2] = {1,0};
long int var;

void thread0(){
      flag[0] = 1;
      dmbsy();
      while(flag[0] >= 3) {dmbsy();}
      dmbsy();
      flag[0] = 3;
       dmbsy();
      if(flag[1] == 1){
            dmbsy();
            flag[0] =1;
            dmbsy();
            while(flag[1] != 4){dmbsy();}
      }
      flag[0] = 4;
      
}
