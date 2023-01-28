#include <atomic>

void assume(bool);
//void __fence_var.fetch_add(0,std::memory_order_relaxed);
void assert(bool);

int64_t level0, level1, level2, level3;
int64_t waiting0, waiting1, waiting2;
int64_t _cc_x;
int64_t result1 , result2 , result3 , result4;
std::atomic<int64_t> __fence_var;
void thread0(){
		for (int64_t i = 0; i < 2; ++i){
		level0 = 0;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting0=0;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting0!=0 || (level1 < 0 && level2 < 0 && level3 < 0 && 1));
		level0 = 1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting1=0;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting1!=0 || (level1 < 1 && level2 < 1 && level3 < 1 && 1));
		level0 = 2;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting2=0;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting2!=0 || (level1 < 2 && level2 < 2 && level3 < 2 && 1));
		_cc_x = 0;
		assert(_cc_x==0);
		//result1 = (_cc_x==0);
		 __fence_var.fetch_add(0,std::memory_order_relaxed);
		 level0 = 0;
		}
}
void thread1(){
		for (int64_t i = 0; i < 2; ++i){
				level1 = 0;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting0=1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting0!=1 || (level0 < 0 && level2 < 0 && level3 < 0 && 1));
		level1 = 1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting1=1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting1!=1 || (level0 < 1 && level2 < 1 && level3 < 1 && 1));
		level1 = 2;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting2=1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting2!=1 || (level0 < 2 && level2 < 2 && level3 < 2 && 1));
		_cc_x = 1;
		//assert(_cc_x==1);
		//result2 = (_cc_x==1);
		__fence_var.fetch_add(0,std::memory_order_relaxed);
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
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting0=3;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting0!=3 || (level0 < 0 && level1 < 0 && level2 < 0 && 1));
		level3 = 1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting1=3;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting1!=3 || (level0 < 1 && level1 < 1 && level2 < 1 && 1));
		level3 = 2;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		waiting2=3;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(waiting2!=3 || (level0 < 2 && level1 < 2 && level2 < 2 && 1));
		_cc_x = 3;
		assert(_cc_x==3);
		//result4 = (_cc_x==3);
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		level3 = 0;
		}
}
