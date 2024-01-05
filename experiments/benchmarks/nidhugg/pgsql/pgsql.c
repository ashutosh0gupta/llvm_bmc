/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from:
 * PostgreSQL bug under Power.
 *
 * URL: Listing 1.1 in
 *   https://arxiv.org/pdf/1207.7264.pdf
 */

#ifndef N
# define N 3
#endif

// shared variables
atomic_int latch[N];
atomic_int flag[N];
atomic_int x;

void *t(void *arg)
{
  	int tid = *((int *)arg);
    while (1) {
    	if (atomic_load_explicit(&latch[tid], memory_order_relaxed)==1) {
    		break;
    	}
    }
	assert(atomic_load_explicit(&latch[tid], memory_order_relaxed)==0 ||
			atomic_load_explicit(&flag[tid], memory_order_relaxed)==1);

	atomic_store_explicit(&latch[tid], 0, memory_order_relaxed);

	if (atomic_load_explicit(&flag[tid], memory_order_relaxed)==1) {
		atomic_store_explicit(&flag[tid], 0, memory_order_relaxed);
		atomic_store_explicit(&flag[(tid+1)%N], 1, memory_order_relaxed);
		atomic_store_explicit(&latch[(tid+1)%N], 1, memory_order_relaxed);
	}
	return NULL;
}


