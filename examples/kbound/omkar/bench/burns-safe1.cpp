//#include<atomic>
void dmbsy();
long int flag0=0 , flag1=0 ;
//long int var = 0;
long int var=0;
void thread0 (){
      //lock
      dmbsy();/////
      flag0 = 1;
      dmbsy();
      if (flag1 == 1) return;
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag0= 0;
}

void thread1 (){
      //lock
      //while(1) {
            dmbsy();///
            flag1 = 0;
            dmbsy();
            if( flag0 == 1) return;
            dmbsy();
            flag1 = 1;
            dmbsy();
            if( flag0 == 1) return;
            //else break;
      //}
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag1 = 0;
      //dmbsy();
}
