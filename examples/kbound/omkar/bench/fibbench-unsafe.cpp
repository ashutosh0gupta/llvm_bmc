long int i=1,j=1;
void thread0(){
      for (long int k = 0; k < 5; k++)
      {
            i = i+j;
      }
      
}
void thread1(){
      for (long int k = 0; k < 5; k++)
      {
            j = i+j;
      }
      
}