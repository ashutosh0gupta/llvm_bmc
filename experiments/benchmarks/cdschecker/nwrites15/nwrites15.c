#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>

#ifndef N
# define N 15
#endif

atomic_int x[N];
atomic_int idx[N];

static void thread_n(void *arg)
{
	int i = *((int *) arg);
	atomic_store_explicit(&x[i], 42, memory_order_release);
	return;
}

int user_main(int argc, char **argv)
{
	thrd_t t[N];

	for (int i = 0; i < N; i++)
                atomic_init(&idx[i], i);
	for (int i = 0; i < N; i++) {
		if (thrd_create(&t[i], (thrd_start_t) &thread_n, &idx[i]))
			abort();
	}

	return 0;
}
