void assert(bool);

long int x=0,y=0;

void thread0(){
	long int r1 = x;
	y = 1;
	long int r2 = 0;

	
}

void thread1(){
	long r1 = y;
	x = 2;
	long r2 = x;
	assert(r1 == 0);
}
