
long int flag[2];
long int var;

void thread0(){
      flag[0] = 1;
      while(flag[1] >= 3);
      flag[0] = 3;
      if(flag[1] == 1){
            flag[0] = 2;
            while(flag[1] != 4);
      }
      flag[0] = 4;
      while(flag[1] >= 2);
      //CS
      var = var + 1;
      //unlock 
      while(flag[1] != 3 && flag[1] != 2);
      flag[0] = 0;
}
void thread1(){
      flag[1] = 1;
      while(flag[0] >= 3) {}
      flag[1] = 3;
      if(flag[0] == 1){   
            flag[1] = 2;
            while(flag[0] != 4){}
      }
      flag[1] = 4;
      while(flag[0] >= 2) {}
      //CS
      var = var + 1;
      //unlock
      while(flag[0] != 3 && flag[0] != 2){}
      flag[1] = 0;
}