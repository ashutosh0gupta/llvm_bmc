#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>

atomic_int x;
atomic_int idx[N+1];

static void thread_writer(void *unused)
{
	atomic_store_explicit(&x, 42, memory_order_release);
}

static void thread_reader(void *arg)
{
	int r = *((int *) arg);
	atomic_load_explicit(&x, memory_order_acquire);
}

int user_main(int argc, char **argv)
{
	thrd_t t[N+1];

	atomic_init(&x, 0);
	for (int i = 0; i <= N; i++)
		atomic_init(&idx[i], i);

	for (int i = 0; i <= N; i++) {
		if (i == 0)
			thrd_create(&t[i], (thrd_start_t)&thread_writer, NULL);
		else
			thrd_create(&t[i], (thrd_start_t)&thread_reader, &idx[i-1]);
	}

	for (int i = 0; i <= N; i++) {
		thrd_join(t[i]);
	}

	return 0;
}
