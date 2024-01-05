#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

atomic_int flag1;
atomic_int flag2;

void *thread_0(void *unused)
{
	while (1) {
		atomic_store_explicit(&flag1, 1, memory_order_relaxed);
		while (atomic_load_explicit(&flag2, memory_order_relaxed) >= 3)
			;
		atomic_store_explicit(&flag1, 3, memory_order_relaxed);
		if (atomic_load_explicit(&flag2, memory_order_relaxed) == 1) {
			atomic_store_explicit(&flag1, 2, memory_order_relaxed);
			while (atomic_load_explicit(&flag2, memory_order_relaxed) != 4)
				;
		};
		atomic_store_explicit(&flag1, 4, memory_order_relaxed);
		while (atomic_load_explicit(&flag2, memory_order_relaxed) >= 2)
			;
		int f2;
		while ((f2 = atomic_load_explicit(&flag2, memory_order_relaxed)) >= 2 &&
		       f2 <= 3)
			;
	}
	return NULL;
}

void *thread_1(void *unused)
{
	while (1) {
		atomic_store_explicit(&flag2, 1, memory_order_relaxed);
		while (atomic_load_explicit(&flag1, memory_order_relaxed) >= 3)
			;
		atomic_store_explicit(&flag2, 3, memory_order_relaxed);
		if (atomic_load_explicit(&flag1, memory_order_relaxed) == 1) {
			atomic_store_explicit(&flag2, 2, memory_order_relaxed);
			while (atomic_load_explicit(&flag1, memory_order_relaxed) != 4)
				;
		};
		atomic_store_explicit(&flag2, 4, memory_order_relaxed);
		while (atomic_load_explicit(&flag1, memory_order_relaxed) >= 2)
			;
		int f1;
		while ((f1 = atomic_load_explicit(&flag1, memory_order_relaxed)) >= 2 &&
		       f1 <= 3)
			;
	}
	return NULL;
}

int main()
{
	pthread_t t0, t1;

	if (pthread_create(&t0, NULL, thread_0, NULL))
		abort();
	if (pthread_create(&t1, NULL, thread_1, NULL))
		abort();

	return 0;
}
