void assert(bool);
long int x,y;
long result1,result2, result3 , result4;

void thread0(){
 	x = 1;
	result1 = y;
}

void thread1(){
	result2 = x;
	y = 2;
}
void thread2(){
	result3 = x;
	result4 = y;
}