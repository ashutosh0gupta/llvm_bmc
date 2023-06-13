/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from:
 * Peterson's critical section algorithm, implemented with fences.
 *
 * Adapted from: https://svn.sosy-lab.org/software/sv-benchmarks/trunk/c/pthread-atomic/peterson_true-unreach-call.c
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

long flag0;                 // A workaround
long flag1;                 // A workaround
long turn;                  // A workaround
long x; // to avoid race    // A workaround

void *p0(void *arg)
{
  	while(1) {
    	atomic_store_explicit(&flag0, 1, memory_order_relaxed);
    	atomic_store_explicit(&turn, 1, memory_order_relaxed);

    	int ok = 0;
    	while (1) {
      		int _flag1 = atomic_load_explicit(&flag1, memory_order_relaxed);
      		int _turn =  atomic_load_explicit(&turn, memory_order_relaxed);
      		if ( _flag1 != 1 || _turn != 1) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
    	// critical section
    	atomic_store_explicit(&x, 1, memory_order_relaxed);
    	assert(atomic_load_explicit(&x, memory_order_relaxed) == 1);

    	atomic_store_explicit(&flag0, 0, memory_order_relaxed);
  	}

	return NULL;
}

void *p1(void *arg)
{
  	while (1) {
    	atomic_store_explicit(&flag1, 1, memory_order_relaxed);
    	atomic_store_explicit(&turn, 0, memory_order_relaxed);

    	int ok = 0;
    	while (1) {
      		int _flag0 = atomic_load_explicit(&flag0, memory_order_relaxed);
      		int _turn =  atomic_load_explicit(&turn, memory_order_relaxed);
      		if (_flag0 != 1 || _turn != 0) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;

    	// critical section
    	atomic_store_explicit(&x, 2, memory_order_relaxed);
    	assert(atomic_load_explicit(&x, memory_order_relaxed) == 2);

    	atomic_store_explicit(&flag1, 0, memory_order_relaxed);
  	}

	return NULL;
}

int main(int argc, char **argv)
{
 	pthread_t a, b;

 	atomic_init(&flag0, 0);
 	atomic_init(&flag1, 0);
 	atomic_init(&turn, 0);
 	atomic_init(&x, 0);

 	pthread_create(&a, NULL, p0, NULL);
 	pthread_create(&b, NULL, p1, NULL);

 	pthread_join(a, NULL);
  	pthread_join(b, NULL);

 	return 0;
}