/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from HMC benchmarks https://zenodo.org/record/3562083
*/

#include <pthread.h>
#include <stdatomic.h>

# define N 5

long x[N];
long idx[N];

void *thread_n(void *arg)
{
	int i = *((int *) arg);
	atomic_store_explicit(&x[i], 42, memory_order_relaxed);
	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t t[N];

	for (int i = 0; i < N; i++)
                atomic_init(&idx[i], i);
	for (int i = 0; i < N; i++) {
		pthread_create(&t[i], NULL, thread_n, &idx[i]);
	}

	return 0;
}

