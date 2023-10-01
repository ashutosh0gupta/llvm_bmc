/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/stack-1.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../stack_true.c"

int arg[NUM_PUSH_THREADS];
int main(int argc, char *argv[])
{
	int i;
	pthread_t t1s[NUM_PUSH_THREADS], t2s[NUM_POP_THREADS];

	atomic_init(&top, 0);
	pthread_mutex_init (&lock, NULL);

	for (int i=0; i<SIZE; i++)
    	atomic_init(&stack[i], 0);

  	for (int i=0; i<NUM_PUSH_THREADS; i++) {
    	arg[i] = i;
    	pthread_create(&t1s[i], NULL, pushthread, &arg[i]);
  	}

  	for (int i=0; i<NUM_POP_THREADS; i++) {
    	pthread_create(&t2s[i], NULL, popthread, NULL);
  	}

  	return 0;
}
