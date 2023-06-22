/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from HMC benchmarks https://zenodo.org/record/3562083
*/

#include <pthread.h>
#include <stdatomic.h>

#define N 15

long x;
long idx[N+1];

void *thread_writer(void *unused)
{
	atomic_store_explicit(&x, 42, memory_order_relaxed);
	return NULL;
}

void *thread_reader(void *arg)
{
	int r = *((int *) arg);
	atomic_load_explicit(&x, memory_order_relaxed);
	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t t[N+1];

	for (int i = 0; i <= N; i++)
                atomic_init(&idx[i], i);
        pthread_create(&t[0], NULL, thread_writer, NULL);
	for (int i = 1; i <= N; i++) {
		/* if (i == 0) { */
		/* 	pthread_create(&t[i], NULL, thread_writer, NULL); */
		/* } else { */
			pthread_create(&t[i], NULL, thread_reader, &idx[i-1]);
		/* } */
	}

	for (int i = 0; i <= N; i++) {
		pthread_join(t[i], NULL);
	}

	return 0;
}
