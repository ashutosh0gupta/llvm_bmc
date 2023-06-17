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

#define N 2

// shared variables
int interested[N];
int passed[N];
int k;
int x;

void *t(void *arg)
{
	int ok = 0;
	int done, _k;
 	int tid = *((int *)arg);

  	interested[tid] = 1;

  	done = 0;
  	while (1) {
  		while (1) {
  			_k = k;
	    	if (_k==tid) {
	    		ok = 1;
	    		break;
	    	}
	    	if (interested[_k]==0)
	    		k = tid;
	    }

	  	if (ok==0) return NULL;
	  	passed[tid] = 1;

	  	done = 1;
	  	int j;
	  	for (j=0; j<N; j++) {
	  		if (j==tid) continue;
	  		if (passed[j] == 1) {
	  			passed[tid] = 0;
	  			done = 0;
	  		}
	  	}

	  	if (done==1) {
	  		ok = 1;
	  		break;
	  	} else
	  		ok = 0;
  	}

  	if (ok==0) return NULL;

  	// critical section
	x = tid;
	assert(x == tid);

  	passed[tid] = 0;
  	interested[tid] = 0;
	return NULL;
}

int arg[N];
int main(int argc, char **argv)
{
  	pthread_t ts[N];

    int i;
	for (i=0; i<N; i++) {
	  	interested[i] = 0;
	  	passed[i] = 0;
	}
	k = 0;
	x = 0;

	for (i=0; i<N; i++) {
	  	arg[i] = i;
	  	pthread_create(&ts[i], NULL, t, &arg[i]);
	}

  	for (i=0; i<N; i++) {
  		pthread_join(ts[i], NULL);
  	}

  	return 0;
}