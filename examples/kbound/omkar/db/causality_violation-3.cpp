void assert(bool);
long int x,y,z,w ;
void _t1(){
	x = 1;
	int r1 = y;
	int r2 = 0;
	assert(r1 == 0);
}

void _t2(){
	int r1 = x;
	w = 1;
	y = 2;
	int r3 = 0;
	assert(r1 == 1);
 }

void _t3(){	
	z = 1;
	int r1 = x;
	int r2 = y;
	int r3 = 0;
	assert( r1 == 0 && r2 == 2);
}


void thread0(){
 	_t1();
}

void thread2(){
	_t2();
}
void thread3(){
	//printf(" ");
	_t3();
}
