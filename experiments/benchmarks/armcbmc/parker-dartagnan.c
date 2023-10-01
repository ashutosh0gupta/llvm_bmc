#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int cond;
atomic_int park_counter;

void *thread_1(void *unused)
{
	while (atomic_load_explicit(&cond, memory_order_relaxed) == 0) {
		int counter = atomic_load_explicit(&park_counter, memory_order_relaxed);
		atomic_store_explicit(&park_counter, 0, memory_order_relaxed);
	}
	return NULL;
}

void *thread_2(void *args)
{
	atomic_store_explicit(&cond, 1, memory_order_relaxed);
	atomic_store_explicit(&park_counter, 1, memory_order_relaxed);
	return NULL;
}

int main()
{
	pthread_t t0, t1;

	if (pthread_create(&t0, NULL, thread_1, NULL))
		abort();
	if (pthread_create(&t1, NULL, thread_2, NULL))
		abort();

	return 0;
}
