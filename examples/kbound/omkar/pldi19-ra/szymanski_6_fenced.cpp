#include <atomic>

#define LOOP 1
void assert(bool);

std::atomic<long int> flag0;
std::atomic<long int> flag1;
std::atomic<long int> flag2;
std::atomic<long int> flag3;
std::atomic<long int> flag4;
std::atomic<long int> flag5;
std::atomic<long int> __fence_var;
std::atomic<long int> _cc_x;
void thread0()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&flag0, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((((atomic_load_explicit(&flag1, std::memory_order_acquire) < 3) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) < 3)) && 1))return;
;
atomic_store_explicit(&flag0, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if ((((atomic_load_explicit(&flag1, std::memory_order_acquire) == 1) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 1) || atomic_load_explicit(&flag5, std::memory_order_acquire) == 1)
                {
atomic_store_explicit(&flag0, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag1, std::memory_order_acquire) == 4) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag5, std::memory_order_acquire) == 4)))return;
;
                }
atomic_store_explicit(&flag0, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&_cc_x, 0, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 0);
if(!((((((((((atomic_load_explicit(&flag1, std::memory_order_acquire) != 3) && (atomic_load_explicit(&flag1, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 2)))return;
;
atomic_store_explicit(&flag0, 0, std::memory_order_release);
        }
}
void thread1()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&flag1, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) < 3)) && 1))return;
;
atomic_store_explicit(&flag1, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if ((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 1) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 1) || atomic_load_explicit(&flag5, std::memory_order_acquire) == 1)
                {
atomic_store_explicit(&flag1, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 4) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag5, std::memory_order_acquire) == 4)))return;
;
                }
atomic_store_explicit(&flag1, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(atomic_load_explicit(&flag0, std::memory_order_acquire) < 2))return;
;
atomic_store_explicit(&_cc_x, 1, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 1);
if(!((((((((atomic_load_explicit(&flag2, std::memory_order_acquire) != 3) && (atomic_load_explicit(&flag2, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 2)))return;
;
atomic_store_explicit(&flag1, 0, std::memory_order_release);
        }
}
void thread2()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&flag2, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) < 3)) && 1))return;
;
atomic_store_explicit(&flag2, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if ((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 1) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 1) || atomic_load_explicit(&flag5, std::memory_order_acquire) == 1)
                {
atomic_store_explicit(&flag2, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 4) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag5, std::memory_order_acquire) == 4)))return;
;
                }
atomic_store_explicit(&flag2, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&flag0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 2)))return;
;
atomic_store_explicit(&_cc_x, 1, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 2);
if(!((((((atomic_load_explicit(&flag3, std::memory_order_acquire) != 3) && (atomic_load_explicit(&flag3, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 2)))return;
;
atomic_store_explicit(&flag2, 0, std::memory_order_release);
        }
}
void thread3()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&flag3, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) < 3)) && 1))return;
;
atomic_store_explicit(&flag3, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if ((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 1) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 1) || atomic_load_explicit(&flag5, std::memory_order_acquire) == 1)
                {
atomic_store_explicit(&flag3, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 4) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag5, std::memory_order_acquire) == 4)))return;
;
                }
atomic_store_explicit(&flag3, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((atomic_load_explicit(&flag0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 2)))return;
;
atomic_store_explicit(&_cc_x, 3, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 3);
if(!((((atomic_load_explicit(&flag4, std::memory_order_acquire) != 3) && (atomic_load_explicit(&flag4, std::memory_order_acquire) != 2)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 2)))return;
;
atomic_store_explicit(&flag3, 0, std::memory_order_release);
        }
}
void thread4()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&flag4, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag5, std::memory_order_acquire) < 3)) && 1))return;
;
atomic_store_explicit(&flag4, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if ((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 1) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 1) || atomic_load_explicit(&flag5, std::memory_order_acquire) == 1)
                {
atomic_store_explicit(&flag4, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 4) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag5, std::memory_order_acquire) == 4)))return;
;
                }
atomic_store_explicit(&flag4, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 2)))return;
;
atomic_store_explicit(&_cc_x, 4, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 4);
if(!((atomic_load_explicit(&flag5, std::memory_order_acquire) != 3) && (atomic_load_explicit(&flag5, std::memory_order_acquire) != 2)))return;
;
atomic_store_explicit(&flag4, 0, std::memory_order_release);
        }
}
void thread5()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&flag5, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) < 3)) && 1))return;
;
atomic_store_explicit(&flag5, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if ((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 1) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 1)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 1) || atomic_load_explicit(&flag4, std::memory_order_acquire) == 1)
                {
atomic_store_explicit(&flag5, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag0, std::memory_order_acquire) == 4) || (atomic_load_explicit(&flag1, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag2, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag3, std::memory_order_acquire) == 4)) || (atomic_load_explicit(&flag4, std::memory_order_acquire) == 4)))return;
;
                }
atomic_store_explicit(&flag5, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!(((((atomic_load_explicit(&flag0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&flag1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&flag2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&flag3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&flag4, std::memory_order_acquire) < 2)))return;
;
atomic_store_explicit(&_cc_x, 5, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 5);
atomic_store_explicit(&flag5, 0, std::memory_order_release);
        }
}


