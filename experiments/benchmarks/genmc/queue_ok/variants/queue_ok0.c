/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/queue_ok.c */

#include <assert.h>
#include <stdatomic.h>
#include <pthread.h>

#include "../queue_ok.c"

int arg[NUM_ENQUEUE_THREADS];
int main(int argc, char *argv[])
{
	int i;
	pthread_t t1s[NUM_ENQUEUE_THREADS], t2s[NUM_DEQUEUE_THREADS];

	atomic_init(&enqueue_flag, TRUE);
	atomic_init(&dequeue_flag, FALSE);
	pthread_mutex_init (&lock, NULL);

	init();

  	if (!(empty()==EMPTY)) {
    	assert(0);
  	}

  	for (i=0; i<SIZE; i++) {
    	atomic_init(&stored_elements[i], 0);
  	}

  	for (i=0; i<NUM_ENQUEUE_THREADS; i++) {
    	arg[i] = i;
    	pthread_create(&t1s[i], NULL, enqueuethread, &arg[i]);
  	}

  	for (i=0; i<NUM_DEQUEUE_THREADS; i++) {
    	pthread_create(&t2s[i], NULL, dequeuethread, NULL);
  	}

  	return 0;
}
