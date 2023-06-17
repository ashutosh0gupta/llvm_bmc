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

#define N 5

// shared variables
int latch[N];
int flag[N];
int x;

void *t(void *arg)
{
  	int tid = *((int *)arg);
  	int ok = 0;

    while (1) {
    	if (latch[tid] == 1) {
    		ok = 1;
    		break;
    	}
    }

    if (ok==0) return NULL;
	assert(latch[tid] == 0 || flag[tid] == 1);

	latch[tid] = 0;

	if (flag[tid] == 1) {
		flag[tid] = 0;
		flag[(tid+1)%N] = 1;
		latch[(tid+1)%N] = 1;
	}

	return NULL;

}

int arg[N];
int main(int argc, char **argv)
{
  	pthread_t ts[N];

    int i;
	for (i=1; i<N; i++) {
	  	latch[i] = 0;
	  	flag[i] = 0;
	}
	latch[0] = 1;
	flag[0] = 1;

	for (i=0; i<N; i++) {
	  	arg[i] = i;
	  	pthread_create(&ts[i], NULL, t, &arg[i]);
	}

  	for (i=0; i<N; i++) {
  		pthread_join(ts[i], NULL);
  	}

  	return 0;
}