void assert(bool);

long int x,y,z,w;
long int vars[4];
void _t1(){
	x = 1;
	w = 2;
	int r1 = x;
}

void _t2(){
	int r1 = x;
	w = 1;
	y = 1;
	assert(r1 == 2);
 }

void _t5(){
	int r1 = vars[0];
	int r2 = r1 + 1;
	vars[0] = r2;
}

void _t6(){
	int r1 = vars[2];
	int r2 = r1 * 3 ;
	vars[1] = r2;
	vars[2] = r2 * r2;
}

void _t7(){
	int r1 = vars[3];
	int r2 = vars[1];
	r2 = r2 + r1;
	vars[1] = r2;
}

void _t3(){	
	z = 1;
	int r1 = x;
	int r3 = 0;
	assert(r1 == 1);
	x = 2;
}
void _t4(){	
	int r1 = x;
	int r2 = y;
	assert( r1== 1 && r2 == 1);
}

void thread0(){
 	_t1();
 	_t2();
 	_t5();
 	_t6();
}

void thread1(){
	_t3();
	_t4();
	_t5();
	_t7();
}
void thread2(){
 	_t5();
 	_t7();
}

void thread3(){
	_t7();
	_t6();
}