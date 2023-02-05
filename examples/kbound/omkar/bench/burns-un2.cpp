//#include<atomic>
long int flag0=0 , flag1=0 ;
//long int var = 0;
long int var=0;
void thread0 (){
      for (int i = 0; i < 2; i++)
      {
            //lock
            /////
            flag0 = 1;
            
            if (flag1 == 1) return;
            //CS
            
            var = var + 1;
            //unlock
            
            flag0= 0;
      }
      
}

void thread1 (){
      for (int i = 0; i < 2; i++)
      {
            //lock
      //while(1) {
            ///
            flag1 = 0;
            
            if( flag0 == 1) return;
            
            flag1 = 1;
            
            if( flag0 == 1) return;
            //else break;
      //}
      //CS
      
      var = var + 1;
      //unlock
      
      flag1 = 0;
      //
      }
      
}
