/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-C-DAC/pthread-demo-datarace-1.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
# warning "N is not defined, assuming 2"
# define N 2
#endif

#define LOOP 5

// shared variables
long myglobal;   // A workaround
pthread_mutex_t mymutex;

void *thread_function_mutex(void* arg)
{
  for (int i=0; i<LOOP; i++ )
  {
    pthread_mutex_lock(&mymutex);
    int j = atomic_load_explicit(&myglobal, memory_order_relaxed);
	j = j + 1;
	atomic_store_explicit(&myglobal, j, memory_order_relaxed);
	pthread_mutex_unlock(&mymutex);
  }

  return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t threads[N];

	pthread_mutex_init (&mymutex, NULL);
	atomic_init(&myglobal, 0);

	for (int i=0; i<N; i++)
    	pthread_create(&threads[i], NULL, thread_function_mutex, NULL);
  	for (int i=0; i<N; i++)
  		pthread_join(threads[i], NULL);

	return 0;
}