void assert(bool);

long x=0,y=0;
long vars[4] = {0,0,0,0};
long result1, result2, result3, result4;

void thread0(){
	x = 1;
	///
	long r1 = vars[3];
	long r2 = vars[1];
	r2 = r2 + r1;
	vars[1] = r2;
	
}

void thread1(){
	y = 2;
	////
	long r1 = vars[0];
	long r2 = r1 + 1;
	vars[0] = r2;
	
	
}

void thread2(){
	result1 = x;
	result2 = y;
	//
	long r1 = vars[0];
	long r2 = r1 + 1;
	vars[0] = r2;
	r1 = vars[3];
	 r2 = vars[1];
	r2 = r2 + r1;
	vars[1] = r2;
}

void thread3(){
	result3 = x;
	result4 = y;
	//
	long r1 = vars[3];
	long r2 = vars[1];
	r2 = r2 + r1;
	vars[1] = r2;
}

