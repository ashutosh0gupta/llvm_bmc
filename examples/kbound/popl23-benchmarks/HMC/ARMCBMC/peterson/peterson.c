/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from HMC benchmarks https://zenodo.org/record/3562083
*/

long flag1; /* Boolean flags */
long flag2;

long turn;   /* Atomic integer that holds the ID of the thread whose turn it is */
long x;     /* Boolean variable to test mutual exclusion */


void *thread_1(void *arg)
{
	atomic_store_explicit(&flag1, 1, memory_order_relaxed);
	atomic_store_explicit(&turn, 1, memory_order_relaxed);

	while (atomic_load_explicit(&flag2, memory_order_relaxed) == 1 &&
	       atomic_load_explicit(&turn, memory_order_relaxed) == 1)
		;

	/* critical section beginning */
	atomic_store_explicit(&x, 1, memory_order_relaxed);
//	assert(atomic_load_explicit(&x, memory_order_relaxed) == 1);
	atomic_load_explicit(&x, memory_order_relaxed);
	/* critical section ending */

	atomic_store_explicit(&flag1, 0, memory_order_relaxed);
	return NULL;
}

void *thread_2(void *arg)
{
	atomic_store_explicit(&flag2, 1, memory_order_relaxed);
	atomic_store_explicit(&turn, 0, memory_order_relaxed);

	while (atomic_load_explicit(&flag1, memory_order_relaxed) == 1 &&
			  atomic_load_explicit(&turn, memory_order_relaxed) == 0)
		;

	/* critical section beginning */
	atomic_store_explicit(&x, 2, memory_order_relaxed);
//	assert(atomic_load_explicit(&x, memory_order_relaxed) == 2);
	atomic_load_explicit(&x, memory_order_relaxed);
	/* critical section ending */

	atomic_store_explicit(&flag2, 0, memory_order_relaxed);
	return NULL;
}
