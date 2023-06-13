/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from example in Figure 5,
 * Data-centric dynamic partial order reduction
 *   https://dl.acm.org/citation.cfm?id=3158119
 */

#include <assert.h>
#include <pthread.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
int x;

void *thread1(void *arg) {
    int i;
	for (i=0; i<N; i++)
		x = 1;

	return NULL;
}

void *thread2(void *arg) {
	int i;
	for (i=0; i<N; i++)
		x = 2;

	return NULL;
}

void *thread3(void *arg) {
	int _x1 = x;
	int _x2 = x;

	return NULL;
}

int main(int argc, char **argv)
{
	pthread_t t1, t2, t3;

	x = 0;

	pthread_create(&t1, NULL, thread1, NULL);
	pthread_create(&t2, NULL, thread2, NULL);
	pthread_create(&t3, NULL, thread3, NULL);

	return 0;
}