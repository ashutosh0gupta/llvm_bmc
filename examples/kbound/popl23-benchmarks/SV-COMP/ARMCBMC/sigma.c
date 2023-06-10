/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/sigma.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
long array[N];      // A workaround
long array_index;   // A workaround

void *thread(void *arg) {
  atomic_store(array + atomic_load(&array_index), 1);

  return NULL;
}

int main(int argc, char *argv[]) {
	pthread_t tids[N];
	atomic_init(&array_index, -1);

#ifdef CDSC
	for (int i = 0; i < N; i++){
		atomic_init(&array[i], 0);
	}
#endif

	for (int i = 0; i < N; i++){
		atomic_store(&array_index, atomic_load(&array_index)+1);
		pthread_create(&tids[i], NULL, thread, NULL);
	}

	for (int i = 0; i < N; i++){
		pthread_join(tids[i], NULL);
	}

	return 0;
}