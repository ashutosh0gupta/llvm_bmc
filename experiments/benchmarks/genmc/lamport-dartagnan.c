#include <stdatomic.h>
#include <pthread.h>
#include <assert.h>

atomic_int x = ATOMIC_VAR_INIT(0);
atomic_int y = ATOMIC_VAR_INIT(0);
atomic_int b1 = ATOMIC_VAR_INIT(0);
atomic_int b2 = ATOMIC_VAR_INIT(0);
atomic_int b3 = ATOMIC_VAR_INIT(0);

void *thrd0(void *args)
{
	while (1) {
		atomic_store_explicit(&b1, 1, memory_order_relaxed);
		atomic_store_explicit(&x, 1, memory_order_relaxed);
		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
			atomic_store_explicit(&b1, 0, memory_order_relaxed);
		};
		atomic_store_explicit(&y, 1, memory_order_relaxed);
		if (atomic_load_explicit(&x, memory_order_relaxed) != 1) {
			atomic_store_explicit(&b1, 0, memory_order_relaxed);
		}
	}
	return NULL;
}

void *thrd1(void *args)
{
	while (1) {
		atomic_store_explicit(&b2, 1, memory_order_relaxed);
		atomic_store_explicit(&x, 2, memory_order_relaxed);
		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
			atomic_store_explicit(&b2, 0, memory_order_relaxed);
		};
		atomic_store_explicit(&y, 2, memory_order_relaxed);
		if (atomic_load_explicit(&x, memory_order_relaxed) != 2) {
			atomic_store_explicit(&b2, 0, memory_order_relaxed);
		}
	}
	return NULL;
}

void *thrd2(void *args)
{
	while (1) {
		atomic_store_explicit(&b3, 1, memory_order_relaxed);
		atomic_store_explicit(&x, 3, memory_order_relaxed);
		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
			atomic_store_explicit(&b3, 0, memory_order_relaxed);
		};
		atomic_store_explicit(&y, 3, memory_order_relaxed);
		if (atomic_load_explicit(&x, memory_order_relaxed) != 3) {
			atomic_store_explicit(&b3, 0, memory_order_relaxed);
		}
	}
	return NULL;
}

int main()
{

	pthread_t t0, t1, t2;

	pthread_create(&t0, NULL, thrd0, NULL);
	pthread_create(&t1, NULL, thrd1, NULL);
	pthread_create(&t2, NULL, thrd2, NULL);

	return 0;
}
