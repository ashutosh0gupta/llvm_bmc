#include <atomic>
#define LOOP 1
void assert(bool);
std::atomic<long int> level0;
std::atomic<long int> level1;
std::atomic<long int> level2;
std::atomic<long int> waiting0;
std::atomic<long int> waiting1;
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
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 0) || (((atomic_load_explicit(&level1, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level0, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 0, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 0) || (((atomic_load_explicit(&level1, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && 1)))return;
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
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 1) || (((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level1, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 1) || (((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level2, std::memory_order_acquire) < 1)) && 1)))return;
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
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting0, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting0, std::memory_order_acquire) != 2) || (((atomic_load_explicit(&level0, std::memory_order_acquire) < 0) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 0)) && 1)))return;
;
atomic_store_explicit(&level2, 1, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&waiting1, 2, std::memory_order_release);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
if(!((atomic_load_explicit(&waiting1, std::memory_order_acquire) != 2) || (((atomic_load_explicit(&level0, std::memory_order_acquire) < 1) && (atomic_load_explicit(&level1, std::memory_order_acquire) < 1)) && 1)))return;
;
atomic_store_explicit(&_cc_x, 1, std::memory_order_release);
assert(atomic_load_explicit(&_cc_x, std::memory_order_acquire) == 2);
atomic_fetch_add_explicit(&__fence_var, 0, std::memory_order_acq_rel);
atomic_store_explicit(&level2, 0, std::memory_order_release);
        }
}