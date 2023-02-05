void assert(bool);

long x=0,y=0;
long result1, result2, result3, result4;

void thread0(){
	x = 1;
}

void thread1(){
	y = 2;
	
}

void thread2(){
	result1 = x;
	result2 = y;
}

void thread3(){
	result3 = x;
	result4 = y;
}

