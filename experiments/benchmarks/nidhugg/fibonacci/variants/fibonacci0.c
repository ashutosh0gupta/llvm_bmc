/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread/fib_bench-2.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../fibonacci.c"

int main(int argc, char *argv[])
{
	pthread_t a, b;

	atomic_init(&i, 1);
	atomic_init(&j, 1);

	pthread_create(&a, NULL, t1, NULL);
	pthread_create(&b, NULL, t2, NULL);

	int correct = fib(2+2*N);
	int _i = atomic_load_explicit(&i, memory_order_relaxed);;
	int _j = atomic_load_explicit(&j, memory_order_relaxed);

	if (_i > correct || _j > correct) {
		assert(0);
	}

	return 0;
}
