#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>
#include <assert.h>

#ifdef MAKE_ALL_RELAXED
# define mo_acq memory_order_relaxed
# define mo_rel memory_order_relaxed
#else
# define mo_acq memory_order_acquire
# define mo_rel memory_order_release
#endif

#define BND 30

atomic_int flag1;
atomic_int flag2;
atomic_int turn;

atomic_int x;

static void thread_0(void *unused)
{
	atomic_store_explicit(&flag1, 1, mo_rel);
	atomic_store_explicit(&turn, 1, mo_rel);

	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			return;
		if (atomic_load_explicit(&flag2, mo_acq) != 1 ||
		    atomic_load_explicit(&turn, mo_acq) != 1)
			break;
	}

	/* critical section beginning */
	atomic_store_explicit(&x, 0, mo_rel);
//	assert(atomic_load_explicit(&x, mo_acq) <= 0);
	atomic_load_explicit(&x, mo_acq);
	/* critical section ending */

	atomic_store_explicit(&flag1, 0, mo_rel);
	return;
}

static void thread_1(void *unused)
{
	atomic_store_explicit(&flag2, 1, mo_rel);
	atomic_store_explicit(&turn, 0, mo_rel);


	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			return;
		if (atomic_load_explicit(&flag1, mo_acq) != 1 ||
		    atomic_load_explicit(&turn, mo_acq) != 0)
			break;
	}

	/* critical section beginning */
	atomic_store_explicit(&x, 1, mo_rel);
//	assert(atomic_load_explicit(&x, mo_acq) >= 1);
	atomic_load_explicit(&x, mo_acq);
	/* critical section ending */

	atomic_store_explicit(&flag2, 0, mo_rel);
	return;
}

int user_main(int argc, char **argv)
{
	thrd_t t0, t1;

	atomic_init(&flag1, 0);
	atomic_init(&flag2, 0);
	atomic_init(&turn, 0);

	if (thrd_create(&t0, (thrd_start_t) &thread_0, NULL))
		abort();
	if (thrd_create(&t1, (thrd_start_t) &thread_1, NULL))
		abort();

	return 0;
}
