void assert(bool);
long int x=0,y=0;
long int result1, result2;
long int vars[4] = {0,0,0,0};

void thread0(){
  long r1 = x;
  y = 1;
  result1 = r1;
  r1 = vars[2];
  long r2 = r1 + 3 ;
  vars[1] = r2;
  vars[2] = r2 + r2;
  r1 = vars[3];
  r2 = vars[1];
  r2 = r2 + r1;
  vars[1] = r2;
}

void thread1(){
  long int r1 = y;
  x = 1;
  result2 = r1;
  r1 = vars[0];
  long r2 = r1 + 1;
  vars[0] = r2;
  r1 = vars[3];
  r2 = vars[1];
  r2 = r2 + r1;
  vars[1] = r2;
  r1 = vars[3];
  r2 = vars[1];
  r2 = r2 + r1;
  vars[1] = r2;
}