/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from example in Figure 5,
 * Data-centric dynamic partial order reduction
 *   https://dl.acm.org/citation.cfm?id=3158119
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
long x;        // A workaround

void *thread1(void *arg) {
    int i;
	for (i=0; i<N; i++)
		atomic_store_explicit(&x, 1, memory_order_relaxed);

	return NULL;
}

void *thread2(void *arg) {
	int i;
	for (i=0; i<N; i++)
		atomic_store_explicit(&x, 2, memory_order_relaxed);

	return NULL;
}

void *thread3(void *arg) {
	atomic_load_explicit(&x, memory_order_relaxed);
	atomic_load_explicit(&x, memory_order_relaxed);

	return NULL;
}

int main(int argc, char **argv)
{
	pthread_t t1, t2, t3;

	atomic_init(&x, 0);

	pthread_create(&t1, NULL, thread1, NULL);
	pthread_create(&t2, NULL, thread2, NULL);
	pthread_create(&t3, NULL, thread3, NULL);

	return 0;
}