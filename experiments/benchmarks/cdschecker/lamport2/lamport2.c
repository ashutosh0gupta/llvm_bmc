#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>
#include <stdbool.h>

/* Lamport's fast mutex algorithm 2
 * (https://users.soe.ucsc.edu/~scott/courses/Fall11/221/Papers/Sync/lamport-tocs87.pdf)
 */

#define N 2

#ifdef MAKE_ASSUME_FUNCTION
void __VERIFIER_assume(int);
#else
# define __VERIFIER_assume(cond) \
 do {			        \
         if (!(cond))		\
		 goto exit;	\
 } while (0)
#endif
#define await(cond) __VERIFIER_assume(cond)

#define BND 3

atomic_intptr_t b[N+1], x, y;

static void thread(void *arg)
{
	intptr_t thread = (intptr_t)arg;

	/* LOCK() */
	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			goto exit;
		atomic_store_explicit(&b[thread], true, memory_order_release);
		atomic_store_explicit(&x, thread, memory_order_release);
		if (atomic_load_explicit(&y, memory_order_acquire) != 0) {
			atomic_store_explicit(&b[thread], false, memory_order_release);
			await(atomic_load_explicit(&y, memory_order_acquire) == 0);
			continue;
		}
		atomic_store_explicit(&y, thread, memory_order_release);
		if (atomic_load_explicit(&x, memory_order_acquire) != thread) {
			atomic_store_explicit(&b[thread], false, memory_order_release);
			for (intptr_t j = 1; j <= N; j++)
				await(atomic_load_explicit(&b[j], memory_order_acquire) == false);
			if (atomic_load_explicit(&y, memory_order_acquire) != thread) {
				await(atomic_load_explicit(&y, memory_order_acquire) == 0);
				continue;
			}
		}
		break;
	}

	/* UNLOCK() */
	atomic_store_explicit(&y, 0, memory_order_release);
	atomic_store_explicit(&b[thread], false, memory_order_release);

exit:
	return;
}


int user_main(int argc, char **argv)
{

	thrd_t t[N + 1];

	atomic_init(&x, 0);
	atomic_init(&y, 0);
	for (int i = 0u; i <= N; i++)
		atomic_init(&b[i], 0);

	for (intptr_t i = 1; i <= N; i++)
		thrd_create(t+i, (thrd_start_t) &thread, (void *) i);
	for (intptr_t i = 1; i <= N; i++)
		thrd_join(t[i]);

	return 0;
}
