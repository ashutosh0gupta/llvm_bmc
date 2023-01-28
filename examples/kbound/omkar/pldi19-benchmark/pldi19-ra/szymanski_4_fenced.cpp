#include <atomic>
void assume(bool);
//void __fence_var.fetch_add(0,std::memory_order_relaxed);
void assert(bool);

int flag0, flag1, flag2, flag3;
int _cc_x;
std::atomic<int64_t> __fence_var;

void thread0(){
	for (int64_t i = 0; i < 2; ++i){
			flag0=1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(flag1<3 && flag2<3 && flag3<3 && 1);
		flag0=3;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		if(flag1==1 || flag2==1 || flag3==1){
			flag0 = 2;
			__fence_var.fetch_add(0,std::memory_order_relaxed);
			assume(flag1==4 || flag2==4 || flag3==4);
			}
			flag0 = 4;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		_cc_x = 0;
		assert(_cc_x==0);
		assume(flag1 != 3 && flag1 != 2 && flag2 != 3 && flag2 != 2 && flag3 != 3 && flag3 != 2 );
		flag0 = 0;
		}
		}
void thread1(){
	for (int64_t i = 0; i < 1; ++i){
			flag1=1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(flag0<3 && flag2<3 && flag3<3 && 1);
		flag1=3;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		if(flag0==1 || flag2==1 || flag3==1){
			flag1 = 2;
			__fence_var.fetch_add(0,std::memory_order_relaxed);
			assume(flag0==4 || flag2==4 || flag3==4);
			}
			flag1 = 4;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(flag0 < 2);
		_cc_x = 1;
		assert(_cc_x==1);
		assume(flag2 != 3 && flag2 != 2 && flag3 != 3 && flag3 != 2 );
		flag1 = 0;
		}
		}
void thread2(){
	for (int64_t i = 0; i < 1; ++i){
			flag2=1;
		
		assume(flag0<3 && flag1<3 && flag3<3 && 1);
		flag2=3;
		
		if(flag0==1 || flag1==1 || flag3==1){
			flag2 = 2;
			
			assume(flag0==4 || flag1==4 || flag3==4);
			}
			flag2 = 4;
		
		assume(flag0 < 2 && flag1 < 2);
		_cc_x = 2;
		assert(_cc_x==2);
		assume(flag3 != 3 && flag3 != 2 );
		flag2 = 0;
		}
		}
void thread3(){
	for (int64_t i = 0; i < 1; ++i){
			flag3=1;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(flag0<3 && flag1<3 && flag2<3 && 1);
		flag3=3;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		if(flag0==1 || flag1==1 || flag2==1){
			flag3 = 2;
			__fence_var.fetch_add(0,std::memory_order_relaxed);
			assume(flag0==4 || flag1==4 || flag2==4);
			}
			flag3 = 4;
		__fence_var.fetch_add(0,std::memory_order_relaxed);
		assume(flag0 < 2 && flag1 < 2 && flag2 < 2);
		_cc_x = 3;
		assert(_cc_x==3);
		flag3 = 0;
		}
		}