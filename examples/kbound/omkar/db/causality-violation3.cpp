void assert(bool);
long int x,y;
long result1,result2, result3 , result4;
long int vars[4] = {0,0,0,0};

void thread0(){
 	x = 1;
	result1 = y;
	//
	long r1 = vars[2];
	long r2 = r1 + 3 ;
	vars[1] = r2;
	vars[2] = r2 + r2;

}

void thread1(){
	result2 = x;
	y = 2;
	//
	long r1 = vars[3];
	long r2 = vars[1];
	r2 = r2 + r1;
	vars[1] = r2;
	r1 = vars[2];
	r2 = r1 + 3 ;
	vars[1] = r2;
	vars[2] = r2 + r2;
}
void thread2(){
	result3 = x;
	result4 = y;
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
	long r1 = vars[0];
	long r2 = r1 + 1;
	vars[0] = r2;
	r1 = vars[3];
	r2 = vars[1];
	r2 = r2 + r1;
	vars[1] = r2;
}
