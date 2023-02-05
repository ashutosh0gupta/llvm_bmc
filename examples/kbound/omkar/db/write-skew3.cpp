void assert(bool);

long int x=0,y=0;
long int vars[4] = {0,0,0,0};

void thread0(){
	long int r1 = x;
	y = 1;
	long int r2 = 0;
	assert( r1 == 0);
	 r1 = vars[2];
	 r2 = r1 + 3 ;
	vars[1] = r2;
	vars[2] = r2 + r2;
	
}

void thread1(){
	long int  r1 = vars[0];
  	long int  r2 = r1 + 1;
  	vars[0] = r2;
	r1 = y;
	x = 2;
	r2 = x;
	long int r3 = 0;
	assert(r1 == 0);
	 r1 = vars[2];
	 r2 = r1 + 3 ;
	vars[1] = r2;
	vars[2] = r2 + r2;

}

void thread2(){
	long int  r1 = vars[0];
  	long int  r2 = r1 + 1;
  	vars[0] = r2;
	 r1 = vars[2];
	 r2 = r1 + 3 ;
	vars[1] = r2;
	vars[2] = r2 + r2;
	long int r3 = 0;
	r1 = vars[3];
   	r2 = vars[1];
  	r2 = r2 + r1;
  	vars[1] = r2;

}

void thread3(){
	long r1 = vars[3];
   	long r2 = vars[1];
  	r2 = r2 + r1;
  	vars[1] = r2;
	 r1 = vars[2];
	 r2 = r1 + 3 ;
	vars[1] = r2;
	vars[2] = r2 + r2;

}