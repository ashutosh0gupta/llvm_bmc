#include<atomic>
void dmbsy();
std::atomic<long int> flag0 , flag1 ;
//long int var = 0;
std::atomic<long int> var;
void thread0 (){
      //lock
      dmbsy();/////
      flag0 = 1;
      dmbsy();
      while ( flag1 == 1 );
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag0= 0;
}

void thread1 (){
      //lock
      while(1) {
            dmbsy();///
            flag1 = 0;
            dmbsy();
            if( flag0 == 1) continue;
            dmbsy();
            flag1 = 1;
            dmbsy();
            if( flag0 == 1) continue;
            else break;
      }
      //CS
      dmbsy();
      var = var + 1;
      //unlock
      dmbsy();
      flag1 = 0;
      //dmbsy();
}
