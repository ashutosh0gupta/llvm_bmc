void assert(bool);
long int x=0,y=0,z=0;
long int vars[4] = {0,0,0,0};
void thread0(){
	x = 1;//
	y = 1;
	y = 2;
	long int r1 = vars[3];
  	long int r2 = vars[1];
  	r2 = r2 + r1;
  	vars[1] = r2;
}

void thread1(){
	long int r1 = vars[0];
  	long int r2 = r1 + 1;
  	vars[0] = r2;
	assert(!(y==2 && x==1));
	 r1 = vars[2];
  	 r2 = r1 + 3 ;
  	vars[1] = r2;
  	vars[2] = r2 + r2;
}