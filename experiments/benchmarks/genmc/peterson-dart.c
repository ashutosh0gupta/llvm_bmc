#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

atomic_int flag0;
atomic_int flag1;
atomic_int turn;

void *thread_0(void *unused)
{
	atomic_store_explicit(&flag0, 1, memory_order_relaxed);
	atomic_store_explicit(&turn, 1, memory_order_relaxed);
	while ((atomic_load_explicit(&flag1, memory_order_relaxed) == 1) &&
	       (atomic_load_explicit(&turn, memory_order_relaxed) == 1))
		;
	return NULL;
}

void *thread_1(void *unused)
{
	atomic_store_explicit(&flag1, 1, memory_order_relaxed);
	atomic_store_explicit(&turn, 1, memory_order_relaxed);
	while ((atomic_load_explicit(&flag0, memory_order_relaxed) == 1) &&
	       (atomic_load_explicit(&turn, memory_order_relaxed) == 1))
		;
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
