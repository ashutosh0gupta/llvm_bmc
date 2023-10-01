/* Lamport's fast mutex algorithm 2
 * (https://users.soe.ucsc.edu/~scott/courses/Fall11/221/Papers/Sync/lamport-tocs87.pdf)
 */

#ifndef N
#  warning "N was not defined, assuming 3"
#  define N 3
#endif

#define BND 3

void __VERIFIER_assume(int);
#define await(cond) __VERIFIER_assume(cond)

atomic_int b[N+1], x, y;
atomic_int v;

static void lock(intptr_t thread)
{
	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			pthread_exit(NULL);

		atomic_store_explicit(&b[thread], 1, memory_order_relaxed);
		atomic_store_explicit(&x, thread, memory_order_relaxed);
		
		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
			atomic_store_explicit(&b[thread], 0, memory_order_relaxed);
			await(atomic_load_explicit(&y, memory_order_relaxed) == 0);
			continue;
		}
		atomic_store_explicit(&y, thread, memory_order_relaxed);
		if (atomic_load_explicit(&x, memory_order_relaxed) != thread) {
			atomic_store_explicit(&b[thread], 0, memory_order_relaxed);
			for (int j = 1; j <= N; j++)
				await(atomic_load_explicit(&b[j], memory_order_relaxed) == false);
			if (atomic_load_explicit(&y, memory_order_relaxed) != thread) {
				await(atomic_load_explicit(&y, memory_order_relaxed) == 0);
				continue;
			}
		}
		break;
	}
}

static void unlock(intptr_t thread)
{
	atomic_store_explicit(&y, 0, memory_order_relaxed);
	atomic_store_explicit(&b[thread], 0, memory_order_relaxed);
}

static void *thread(void *arg)
{
	int thread = *((int *) arg);
	lock(thread);
	/* Critical section start */
	atomic_store_explicit(&v, thread, memory_order_relaxed);
	assert(atomic_load_explicit(&v, memory_order_relaxed) == thread);
	unlock(thread);
	return NULL;
}
