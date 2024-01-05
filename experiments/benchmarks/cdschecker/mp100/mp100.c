#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>

atomic_int x;
atomic_int y;

int r;

#ifndef N
# define N 100
#endif

static void thread_1(void *unused)
{
	atomic_store_explicit(&x, 1, memory_order_relaxed);
	atomic_store_explicit(&y, 1, memory_order_release);
	return;
}

static void thread_2(void *unused)
{
	for (int i = 0u; i <= N; i++) {
		if (i == N)
			goto exit;
		if (atomic_load_explicit(&y, memory_order_acquire) != 0)
			break;
	}
	r = atomic_load_explicit(&x, memory_order_relaxed);

exit:
	return;
}

int user_main(int argc, char **argv)
{
	thrd_t t1, t2;

	atomic_init(&x, 0);
	atomic_init(&y, 0);

	thrd_create(&t1, (thrd_start_t) &thread_1, NULL);
	thrd_create(&t2, (thrd_start_t) &thread_2, NULL);

	return 0;
}
