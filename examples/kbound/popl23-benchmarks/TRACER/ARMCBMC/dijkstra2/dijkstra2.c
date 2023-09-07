/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from:
 * Dijkstra's critical section algorithm, implemented with fences.
 *
 * URL:
 *   https://www.eecs.yorku.ca/course_archive/2007-08/W/6117/DijMutexNotes.pdf
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#define N 2

// shared variables
long interested[N];     // A workaround
long passed[N];         // A workaround
long k;                 // A workaround
long x;                 // A workaround

void *t(void *arg)
{
	int ok = 0;
	int done, _k;
 	int tid = *((int *)arg);
  	atomic_store_explicit(&interested[tid], 1, memory_order_relaxed);
  	done = 0;
  	while (1) {
  		while (1) {
  			_k = atomic_load_explicit(&k, memory_order_relaxed);
	    	if (_k==tid) {
	    		break;
	    	}
	    	if (atomic_load_explicit(&interested[_k], memory_order_relaxed)==0)
	    		atomic_store_explicit(&k, tid, memory_order_relaxed);
	    }
	  	atomic_store_explicit(&passed[tid], 1, memory_order_relaxed);
	  	done = 1;
	  	for (int j=0; j<N; j++) {
	  		if (j==tid) continue;
	  		if (atomic_load_explicit(&passed[j], memory_order_relaxed)==1) {
	  			atomic_store_explicit(&passed[tid], 0, memory_order_relaxed);
	  			done = 0;
	  		}
	  	}
	  	if (done==1) {
	  		break;
	  	}
  	}
  	// critical section
	atomic_store_explicit(&x, tid, memory_order_relaxed);
	assert(atomic_load_explicit(&x, memory_order_relaxed) == tid);
  	atomic_store_explicit(&passed[tid], 0, memory_order_relaxed);
  	atomic_store_explicit(&interested[tid], 0, memory_order_relaxed);
	return NULL;
}

int arg[N];
int main(int argc, char **argv)
{
  	pthread_t ts[N];
    int i;
	for (i=0; i<N; i++) {
	  	atomic_init(&interested[i], 0);
	  	atomic_init(&passed[i], 0);
	}
	atomic_init(&k, 0);
	atomic_init(&x, 0);
	for (i=0; i<N; i++) {
	  	arg[i] = i;
	  	pthread_create(&ts[i], NULL, t, &arg[i]);
	}
  	for (i=0; i<N; i++) {
  		pthread_join(ts[i], NULL);
  	}
  	return 0;
}