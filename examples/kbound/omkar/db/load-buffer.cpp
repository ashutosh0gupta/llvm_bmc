void assert(bool);
long int x=0,y=0;
long int result1, result2;
void thread0(void *arg){
  long r1 = x;
  y = 1;
  result1 = r1;
}

void thread1(void *arg){
  long int r1 = y;
  x = 1;
  result2 = r1;
}
