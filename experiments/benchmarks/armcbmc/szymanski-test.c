#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

#define smp_mb() atomic_thread_fence(memory_order_seq_cst)

atomic_int x;
atomic_int flag1;
atomic_int flag2;

void *thread_1(void *unused)
{
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
	atomic_load_explicit(&x, memory_order_relaxed);
	assert(atomic_load_explicit(&x, memory_order_relaxed) <= 0);
	smp_mb();
	/* Critical section end */

	if (2 <= atomic_load_explicit(&flag2, memory_order_relaxed) &&
	    atomic_load_explicit(&flag2, memory_order_relaxed) <= 3)
		goto exit;
	atomic_store_explicit(&flag1, 0, memory_order_relaxed);

exit:
	return NULL;
}

void *thread_2(void *unused)
{
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
	atomic_load_explicit(&x, memory_order_relaxed);
	assert(atomic_load_explicit(&x, memory_order_relaxed) >= 1);
	smp_mb();
	/* Critical section end */

	if (2 <= atomic_load_explicit(&flag1, memory_order_relaxed) &&
	    atomic_load_explicit(&flag1, memory_order_relaxed) <= 3)
		goto exit;
	atomic_store_explicit(&flag2, 0, memory_order_relaxed);

exit:
	return NULL;
}

int main()
{
	pthread_t t1, t2;

	if (pthread_create(&t1, NULL, thread_1, NULL))
		abort();
	if (pthread_create(&t2, NULL, thread_2, NULL))
		abort();

	if (pthread_join(t1, NULL))
		abort();
	if (pthread_join(t2, NULL))
		abort();

	return 0;
}
