/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/sigma.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../sigma.c"

int main(int argc, char *argv[]) {
	pthread_t tids[N];
	int sum = 0;
	atomic_init(&array_index, -1);


	for (int i = 0; i < N; i++){
		atomic_init(&array[i], 0);
	}

	for (int i = 0; i < N; i++){
		atomic_store_explicit(&array_index, atomic_load_explicit(&array_index, memory_order_relaxed) + 1, memory_order_relaxed);
		pthread_create(&tids[i], NULL, thread, NULL);
	}

	for (int i = 0; i < N; i++){
		pthread_join(tids[i], NULL);
	}
	
	// Check a condition
	for (int i=0; i < N; i++) {
		sum += atomic_load_explicit(&array[i], memory_order_relaxed);
	}
	
	assert(sum == N); // <-- wrong, different threads might use the same array offset when writing



	return 0;
}
