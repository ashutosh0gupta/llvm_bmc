#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>

atomic_int x;

static void thread_n(void *unused)
{
	atomic_fetch_add_explicit(&x, 1, memory_order_relaxed);
}

int user_main(int argc, char **argv)
{
	thrd_t t[N];

	atomic_init(&x, 0);
	for (int i = 0; i < N; i++)
		thrd_create(&t[i], (thrd_start_t)&thread_n, NULL);

	return 0;
}
