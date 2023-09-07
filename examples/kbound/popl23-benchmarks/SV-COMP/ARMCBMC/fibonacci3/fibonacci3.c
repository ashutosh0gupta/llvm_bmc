/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread/fib_bench-2.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#define NUM 3

// shared variables
long i, j;  // A workaround

void *t1(void *arg)
{
	int _i, _j;
	for (int k=0; k<NUM; k++) {
		_i = atomic_load_explicit(&i, memory_order_relaxed);
		_j = atomic_load_explicit(&j, memory_order_relaxed);
		atomic_store_explicit(&i, _i+_j, memory_order_relaxed);
	}
	return NULL;
}

void *t2(void *arg)
{
	int _i, _j;
	for (int k=0; k<NUM; k++) {
		_i = atomic_load_explicit(&i, memory_order_relaxed);
		_j = atomic_load_explicit(&j, memory_order_relaxed);
		atomic_store_explicit(&j, _i+_j, memory_order_relaxed);
	}
	return NULL;
}

static int fib(int n) {
	int cur = 1, prev = 0;
	while(n--) {
		int next = prev+cur;
		prev = cur;
		cur = next;
	}
	return prev;
}

int main(int argc, char *argv[])
{
	pthread_t a, b;

	atomic_init(&i, 1);
	atomic_init(&j, 1);

	pthread_create(&a, NULL, t1, NULL);
	pthread_create(&b, NULL, t2, NULL);

	int correct = fib(2+2*NUM);
	int _i = atomic_load_explicit(&i, memory_order_relaxed);;
	int _j = atomic_load_explicit(&j, memory_order_relaxed);

	if (_i > correct || _j > correct) {
		assert(0);
	}

	return 0;
}
