/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Get inspiration from the Control-flow benchmark in Fig 8 in the journal JACM 2017
   https://dl.acm.org/citation.cfm?id=3073408
*/

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
long x, y, z;         // A workaround

void *p(void *arg)
{
	int loc_x;
	loc_x =  atomic_load_explicit(&x, memory_order_relaxed);
	return NULL;
}

void *q(void *arg)
{
	atomic_store_explicit(&y, 1, memory_order_relaxed);
	return NULL;
}

void *r(void *arg)
{
	if (atomic_load_explicit(&y, memory_order_relaxed) == 0)
		atomic_store_explicit(&z, 1, memory_order_relaxed);
	return NULL;
}

void *s(void *arg)
{
	if (atomic_load_explicit(&z, memory_order_relaxed) == 1)
		if (atomic_load_explicit(&y, memory_order_relaxed) == 0)
			atomic_store_explicit(&x, 1, memory_order_relaxed);
	return NULL;
}

int main(int argc, char *argv[])
{
	int i;
	pthread_t ps[N], qs[N], rs, ss;

	atomic_init(&x, 0);
	atomic_init(&y, 0);
	atomic_init(&z, 0);

	for (i = 0; i < N; i++){
		pthread_create(&ps[i], NULL, p, NULL);
		pthread_create(&qs[i], NULL, q, NULL);
	}

	pthread_create(&rs, NULL, r, NULL);
	pthread_create(&ss, NULL, s, NULL);

	return 0;
}