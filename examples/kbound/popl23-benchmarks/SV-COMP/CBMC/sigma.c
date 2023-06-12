/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/sigma.c */

#include <assert.h>
#include <pthread.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
volatile int array[N];
volatile int array_index;

void *thread(void *arg) {
  array[array_index] = 1;

  return NULL;
}

int main(int argc, char *argv[]) {
	pthread_t tids[N];
	array_index = -1;

    int i;
	for (i = 0; i < N; i++){
		array[i] = 0;
	}

	for (i = 0; i < N; i++){
		array_index = array_index + 1;
		pthread_create(&tids[i], NULL, thread, NULL);
	}

	for (i = 0; i < N; i++){
		pthread_join(tids[i], NULL);
	}

	return 0;
}