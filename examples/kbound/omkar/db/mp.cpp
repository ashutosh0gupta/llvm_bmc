void assert(bool);
long int x=0,y=0,z=0;
void thread0(){
	x = 1;//
	y = 1;
	y = 2;
}

void thread1(){
	assert(!(y==2 && x==1));
}

