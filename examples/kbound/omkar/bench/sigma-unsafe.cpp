void dmbsy();
long int array[2];
long int signal[3];
long int index;
long int wrong;

 void thread0(){
      while(signal[0] == 0);
      dmbsy();
      array[index] = array[index] + 1;
      dmbsy();
      signal[0] = 0;
 }

 void thread1(){
      while(signal[1] == 0);
      dmbsy();
      array[index] = array[index] + 1;
      dmbsy();
      signal[1] = 0;
 }

 void thread2(){
      signal[0] = 1;
      dmbsy();
      index = index + 1;
      signal[1] = 1;
      dmbsy();
      while(signal[0] == 0);
      while(signal[1] == 0);
      dmbsy();
      signal[2] = 1;
 }

 void thread3(){
      while(signal[2] == 0);
      dmbsy();
      if((array[0] + array[1]) != 2){
            dmbsy();
            wrong = 1;
      }

 }