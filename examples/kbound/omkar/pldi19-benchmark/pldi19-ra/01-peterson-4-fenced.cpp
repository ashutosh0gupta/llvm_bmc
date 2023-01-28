#include <atomic>

void assume(bool);
void dmbsy();
void assert(bool);

int64_t level0, level1, level2, level3;
int64_t waiting0, waiting1, waiting2;
int64_t _cc_x;
int64_t result1 , result2 , result3 , result4;
void thread0(){
		for (int64_t i = 0; i < 2; ++i){
		level0 = 0;
		dmbsy();
		waiting0=0;
		dmbsy();
		assume(waiting0!=0 || (level1 < 0 && level2 < 0 && level3 < 0 && 1));
		level0 = 1;
		dmbsy();
		waiting1=0;
		dmbsy();
		assume(waiting1!=0 || (level1 < 1 && level2 < 1 && level3 < 1 && 1));
		level0 = 2;
		dmbsy();
		waiting2=0;
		dmbsy();
		assume(waiting2!=0 || (level1 < 2 && level2 < 2 && level3 < 2 && 1));
		_cc_x = 0;
		assert(_cc_x==0);
		//result1 = (_cc_x==0);
		 dmbsy();
		 level0 = 0;
		}
}
void thread1(){
		for (int64_t i = 0; i < 2; ++i){
				level1 = 0;
		dmbsy();
		waiting0=1;
		dmbsy();
		assume(waiting0!=1 || (level0 < 0 && level2 < 0 && level3 < 0 && 1));
		level1 = 1;
		dmbsy();
		waiting1=1;
		dmbsy();
		assume(waiting1!=1 || (level0 < 1 && level2 < 1 && level3 < 1 && 1));
		level1 = 2;
		dmbsy();
		waiting2=1;
		dmbsy();
		assume(waiting2!=1 || (level0 < 2 && level2 < 2 && level3 < 2 && 1));
		_cc_x = 1;
		//assert(_cc_x==1);
		//result2 = (_cc_x==1);
		dmbsy();
		level1 = 0;
		}
}
void thread2(){
		for(int64_t i = 0; i < 2; ++i){
				level2 = 0;
		
		waiting0=2;
		
		assume(waiting0!=2 || (level0 < 0 && level1 < 0 && level3 < 0 && 1));
		level2 = 1;
		
		waiting1=2;
		
		assume(waiting1!=2 || (level0 < 1 && level1 < 1 && level3 < 1 && 1));
		level2 = 2;
		
		waiting2=2;
		
		assume(waiting2!=2 || (level0 < 2 && level1 < 2 && level3 < 2 && 1));
		_cc_x = 2;
		assert(_cc_x==2);
		//result3 = (_cc_x==2);
		level2 = 0;
		}
}
void thread3(){
		for (int64_t i = 0; i < 2; ++i){
				level3 = 0;
		dmbsy();
		waiting0=3;
		dmbsy();
		assume(waiting0!=3 || (level0 < 0 && level1 < 0 && level2 < 0 && 1));
		level3 = 1;
		dmbsy();
		waiting1=3;
		dmbsy();
		assume(waiting1!=3 || (level0 < 1 && level1 < 1 && level2 < 1 && 1));
		level3 = 2;
		dmbsy();
		waiting2=3;
		dmbsy();
		assume(waiting2!=3 || (level0 < 2 && level1 < 2 && level2 < 2 && 1));
		_cc_x = 3;
		assert(_cc_x==3);
		//result4 = (_cc_x==3);
		dmbsy();
		level3 = 0;
		}
}
