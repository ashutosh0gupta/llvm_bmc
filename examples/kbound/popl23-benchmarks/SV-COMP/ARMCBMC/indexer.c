/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/indexer.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>


#define SIZE  128
#define MAX   4

#ifndef NUM_THREADS
#  warning "NUM_THREADS was not defined"
#  define NUM_THREADS 14
#endif

long table[SIZE];   // A workaround
pthread_mutex_t  cas_mutex[SIZE];

pthread_t  tids[NUM_THREADS];

int cas(atomic_int * tab, int h, int val, int new_val)
{
  int ret_val = 0;

  pthread_mutex_lock(&cas_mutex[h]);
  if (atomic_load_explicit(&tab[h], memory_order_relaxed) == val ) {
    atomic_store_explicit(&tab[h], new_val,memory_order_relaxed);
    ret_val = 1;
  }
  pthread_mutex_unlock(&cas_mutex[h]);


  return ret_val;
}


void *thread_routine(void * arg)
{
  	int tid;
  	int m = 0, w, h;
  	tid = *((int *)arg);


  	while(1)
  	{
    	if ( m < MAX ){
      		w = (++m) * 11 + tid;
    	} else{
      		return NULL;
    	}

    	h = (w * 7) % SIZE;

    	if (h<0) assert(0);

    	while ( cas(table, h, 0, w) == 0){
      		h = (h+1) % SIZE;
    	}

  	}

	return NULL;
}

int arg[NUM_THREADS];
int main(int argc, char *argv[])
{
  	int i;

  	for (i = 0; i < SIZE; i++)
		pthread_mutex_init (&cas_mutex[i], NULL);

  	for (i = 0; i < SIZE; i++)
    	atomic_init(&table[i], 0);

  	for (i = 0; i < NUM_THREADS; i++){
    	arg[i]=i;
    	pthread_create(&tids[i], NULL, thread_routine, &arg[i]);
  	}

  	for (i = 0; i < NUM_THREADS; i++){
    	pthread_join(tids[i], NULL);
  	}

  	return 0;
}