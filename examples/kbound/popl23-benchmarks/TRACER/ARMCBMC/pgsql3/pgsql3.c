/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from:
 * PostgreSQL bug under Power.
 *
 * URL: Listing 1.1 in
 *   https://arxiv.org/pdf/1207.7264.pdf
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#define N 3

// shared variables
long latch[N];      // A workaround
long flag[N];       // A workaround
long x;             // A workaround

void *t0(void *arg)
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

int arg[N];
int main(int argc, char **argv)
{
  	pthread_t ts[N];
    int i;
	for (i=1; i<N; i++) {
	  	atomic_init(&latch[i], 0);
	  	atomic_init(&flag[i], 0);
	}
	atomic_init(&latch[0], 1);
	atomic_init(&flag[0], 1);
	for (i=0; i<N; i++) {
	  	arg[i] = i;
	  	pthread_create(&ts[i], NULL, t0, &arg[i]);
	}
  	for (i=0; i<N; i++) {
  		pthread_join(ts[i], NULL);
  	}
  	return 0;
}
