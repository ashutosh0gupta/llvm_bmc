#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>
#include <model-assert.h>

#define smp_mb() atomic_thread_fence(memory_order_seq_cst)

#define N 1

atomic_int x;
atomic_int flag1;
atomic_int flag2;

static void thread_1(void *unused)
{
	for (int i = 0u; i < N; i++ ) {
		atomic_store_explicit(&flag1, 1, memory_order_relaxed);
		smp_mb();
		if (atomic_load_explicit(&flag2, memory_order_relaxed) >= 3)
			goto exit;

		atomic_store_explicit(&flag1, 3, memory_order_relaxed);
		smp_mb();
		if (atomic_load_explicit(&flag2, memory_order_relaxed) == 1) {
			atomic_store_explicit(&flag1, 2, memory_order_relaxed);
			smp_mb();
			if (atomic_load_explicit(&flag2, memory_order_relaxed) != 4)
				goto exit;
		}

		atomic_store_explicit(&flag1, 4, memory_order_relaxed);
		smp_mb();
		if (atomic_load_explicit(&flag2, memory_order_relaxed) >= 2)
			goto exit;

		/* Critical section start */
		atomic_store_explicit(&x, 0, memory_order_relaxed);
		/* atomic_load_explicit(&x, memory_order_relaxed); */
		int r = atomic_load_explicit(&x, memory_order_relaxed) <= 0;
		smp_mb();
		/* Critical section end */

		if (2 <= atomic_load_explicit(&flag2, memory_order_relaxed) &&
		    atomic_load_explicit(&flag2, memory_order_relaxed) <= 3)
			goto exit;
		atomic_store_explicit(&flag1, 0, memory_order_relaxed);
	}

exit:
	return;
}

static void thread_2(void *unused)
{
	for (int i = 0u; i < N; i++ ) {
		atomic_store_explicit(&flag2, 1, memory_order_relaxed);
		smp_mb();
		if (atomic_load_explicit(&flag1, memory_order_relaxed) >= 3)
			goto exit;

		atomic_store_explicit(&flag2, 3, memory_order_relaxed);
		smp_mb();
		if (atomic_load_explicit(&flag1, memory_order_relaxed) == 1) {
			atomic_store_explicit(&flag2, 2, memory_order_relaxed);
			smp_mb();
			if (atomic_load_explicit(&flag1, memory_order_relaxed) != 4)
				goto exit;
		}

		atomic_store_explicit(&flag2, 4, memory_order_relaxed);
		smp_mb();
		if (atomic_load_explicit(&flag1, memory_order_relaxed) >= 2)
			goto exit;

		/* Critical section start */
		atomic_store_explicit(&x, 1, memory_order_relaxed);
		/* atomic_load_explicit(&x, memory_order_relaxed); */
		int r = atomic_load_explicit(&x, memory_order_relaxed) >= 1;
		smp_mb();
		/* Critical section end */

		if (2 <= atomic_load_explicit(&flag1, memory_order_relaxed) &&
		    atomic_load_explicit(&flag1, memory_order_relaxed) <= 3)
			goto exit;
		atomic_store_explicit(&flag2, 0, memory_order_relaxed);
	}

exit:
	return;
}

int user_main(int argc, char** argv)
{
	thrd_t t1, t2;

	atomic_init(&flag1, 0);
	atomic_init(&flag2, 0);
	atomic_init(&x, 0);

	if (thrd_create(&t1, (thrd_start_t) &thread_1, NULL))
		abort();
	if (thrd_create(&t2, (thrd_start_t) &thread_2, NULL))
		abort();

	if (thrd_join(t1))
		abort();
	if (thrd_join(t2))
		abort();

	return 0;
}
