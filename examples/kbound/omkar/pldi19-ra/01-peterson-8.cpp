#include <atomic>
#define LOOP 1
void assert(bool);

std::atomic<long int> level0;
std::atomic<long int> level1;
std::atomic<long int> level2;
std::atomic<long int> level3;
std::atomic<long int> level4;
std::atomic<long int> level5;
std::atomic<long int> level6;
std::atomic<long int> level7;
std::atomic<long int> waiting0;
std::atomic<long int> waiting1;
std::atomic<long int> waiting2;
std::atomic<long int> waiting3;
std::atomic<long int> waiting4;
std::atomic<long int> waiting5;
std::atomic<long int> waiting6;
std::atomic<long int> _cc_x;
std::atomic<long int> __fence_var;
void thread0()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level0, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level0, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level0, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level0, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level0, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level0, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level0, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 0) || ((((((((atomic_load_explicit(&level1, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 0, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 0);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level0, 0, std::memory_order_release);
        }
}
void thread1()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level1, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level1, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level1, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level1, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level1, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level1, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level1, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 1) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 1, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 1);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level1, 0, std::memory_order_release);
        }
}
void thread2()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level2, 0, std::memory_order_release);
atomic_store_explicit(&waiting0, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level2, 1, std::memory_order_release);
atomic_store_explicit(&waiting1, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level2, 2, std::memory_order_release);
atomic_store_explicit(&waiting2, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level2, 3, std::memory_order_release);
atomic_store_explicit(&waiting3, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level2, 4, std::memory_order_release);
atomic_store_explicit(&waiting4, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level2, 5, std::memory_order_release);
atomic_store_explicit(&waiting5, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level2, 6, std::memory_order_release);
atomic_store_explicit(&waiting6, 2, std::memory_order_release);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 2) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 2, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 2);
atomic_store_explicit(&level2, 0, std::memory_order_release);
        }
}
void thread3()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level3, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level3, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level3, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level3, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level3, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level3, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level3, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 3) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 3, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 3);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level3, 0, std::memory_order_release);
        }
}
void thread4()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level4, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level4, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level4, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level4, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level4, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level4, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level4, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 4) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 4, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 4);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level4, 0, std::memory_order_release);
        }
}
void thread5()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level5, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level5, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level5, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level5, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level5, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level5, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level5, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 5) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 5, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 5);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level5, 0, std::memory_order_release);
        }
}
void thread6()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level6, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level6, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level6, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level6, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level6, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level6, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level6, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 6) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level7, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 6, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 6);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level6, 0, std::memory_order_release);
        }
}
void thread7()
{
for(int l=0;l<LOOP;l++)
        {
atomic_store_explicit(&level7, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 0)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level7, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 1)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&level7, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting2, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting2, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 2) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 2)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 2)) && 1)))return;
;
atomic_store_explicit(&level7, 3, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting3, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting3, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 3) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 3)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 3)) && 1)))return;
;
atomic_store_explicit(&level7, 4, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting4, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting4, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 4) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 4)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 4)) && 1)))return;
;
atomic_store_explicit(&level7, 5, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting5, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting5, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 5) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 5)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 5)) && 1)))return;
;
atomic_store_explicit(&level7, 6, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting6, 7, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting6, std::memory_order_acquire) != 7) || ((((((((atomic_load_explicit(&level0, std::memory_order_acquire) < 6) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level3, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level4, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level5, std::memory_order_acquire) < 6)) && (atomic_load_explicit(&level6, std::memory_order_acquire) < 6)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 7, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 7);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level7, 0, std::memory_order_release);
        }
}
