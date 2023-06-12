/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread/fib_bench-2.c */

#include <assert.h>
#include <pthread.h>

#define NUM 4

// shared variables
volatile int i, j;

void *t1(void *arg)
{
	int _i, _j;
	int k;
	for (k=0; k<NUM; k++) {
		_i = i;
		_j = j;
		i = _i+_j;
	}
	return NULL;
}

void *t2(void *arg)
{
	int _i, _j;
	int k;
	for (k=0; k<NUM; k++) {
		_i = i;
		_j = j;
		j = _i+_j;
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

	i = 1;
	j = 1;

	pthread_create(&a, NULL, t1, NULL);
	pthread_create(&b, NULL, t2, NULL);

	int correct = fib(2+2*NUM);
	int _i = i;
	int _j = j;

	if (_i > correct || _j > correct) {
		assert(0);
	}

	return 0;
}
