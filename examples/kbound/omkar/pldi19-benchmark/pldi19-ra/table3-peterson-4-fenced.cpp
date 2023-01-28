#include <atomic>

void assume(bool);
void assert(bool);
void dmbsy();


int level0, level1, level2, level3;
int waiting0, waiting1, waiting2;
int _cc_x;
std::atomic<int64_t> __fence_var;
void thread0(){
		for (int64_t i = 0; i < 1; ++i){
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
		dmbsy();
		level0 = 0;
		}
}
void thread1(){
		for (int64_t i = 0; i < 1; ++i){
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
		assert(_cc_x==1);
		dmbsy();
		level1 = 0;
		}
}
void thread2(){
		for (int64_t i = 0; i < 1; ++i){
				level2 = 0;
		dmbsy();
		waiting0=2;
		dmbsy();
		assume(waiting0!=2 || (level0 < 0 && level1 < 0 && level3 < 0 && 1));
		level2 = 1;
		dmbsy();
		waiting1=2;
		dmbsy();
		assume(waiting1!=2 || (level0 < 1 && level1 < 1 && level3 < 1 && 1));
		level2 = 2;
		dmbsy();
		waiting2=2;
		dmbsy();
		assume(waiting2!=2 || (level0 < 2 && level1 < 2 && level3 < 2 && 1));
		_cc_x = 1;
		assert(_cc_x==2);
		dmbsy();
		level2 = 0;
		}
}
void thread3(){
		for (int64_t i = 0; i < 1; ++i){
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
		dmbsy();
		level3 = 0;
		}
}
