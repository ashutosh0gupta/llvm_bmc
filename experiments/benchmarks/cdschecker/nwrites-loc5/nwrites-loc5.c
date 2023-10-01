#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>

#ifndef N
# define N 5
#endif

atomic_int x;

static void thread_n(void *unused)
{
	atomic_store_explicit(&x, 42, memory_order_release);
	return;
}

int user_main(int argc, char **argv)
{
	thrd_t t[N];

	for (int i = 0; i < N; i++) {
		if (thrd_create(&t[i], (thrd_start_t) &thread_n, NULL))
			abort();
	}

	return 0;
}
