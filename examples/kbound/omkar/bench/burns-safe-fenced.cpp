#include<atomic>
void dmbsy();
std::atomic<int> flag0 , flag1 ;
//int var = 0;
std::atomic<int> var;
void thread0 (){
      int temp;
      //lock
      dmbsy();/////
      temp = 1;
      flag0 = temp;
      dmbsy();
      //while (flag[1] == 1);
      for (int i = 0; i < 2; i++)
      {
            dmbsy();
            temp = flag1;
            //dmbsy();
            if(temp == 1){
                  continue;
            }
            else{
                  break;
            }
          
      }
      //CS
      dmbsy();
      temp = var;
      dmbsy();/////
      temp = temp + 1;
      var = temp;
      //unlock
      dmbsy();
      temp = 0;
      flag0= temp;
      dmbsy();
}

void thread1 (){
      int temp;
      //while (flag[0] == 1);
      for (int i = 0; i < 2; i++)
      {
            dmbsy();///
            temp = 0;
            flag1 = temp;
            dmbsy();
            temp = flag0;
            if( temp == 1){
                  continue;
            }
            dmbsy();
            temp = 1;
            flag1 = temp;
            dmbsy(); 
            temp = flag0;
            if( temp == 1){
                  continue;
            }
      }
      //CS
      dmbsy();
      temp = var;
      dmbsy(); ///
      temp = temp + 1;
      var = temp;
      //unlock
      dmbsy();
      temp = 0;
      flag1 = temp;
      //dmbsy();
}