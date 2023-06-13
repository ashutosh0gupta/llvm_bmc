/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from filesystem example in PLDI paper
   https://dl.acm.org/citation.cfm?id=1040315
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#define NUMBLOCKS  26
#define NUMINODE  32

#ifndef NUM_THREADS
#  warning "NUM_THREADS was not defined"
#  define NUM_THREADS 16
#endif

pthread_mutex_t  locki[NUMINODE];
long inode[NUMINODE];              // A workaround
pthread_mutex_t  lockb[NUMBLOCKS];
long busy[NUMBLOCKS];              // A workaround
pthread_t  tids[NUM_THREADS];

// thread code
void *thread_routine(void * arg)
{
  	int tid;
  	int i, b;
  	tid = *((int *)arg);

  	i = tid % NUMINODE;
  	pthread_mutex_lock(&locki[i]);
  	if (atomic_load_explicit(&inode[i], memory_order_relaxed)==0) {
    	b = (i*2) % NUMBLOCKS;
    	while (1) {
			pthread_mutex_lock(&lockb[b]);
      		if (!atomic_load_explicit(&busy[b], memory_order_relaxed)) {
        		atomic_store_explicit(&busy[b], 1, memory_order_relaxed);
        		atomic_store_explicit(&inode[i], b+1, memory_order_relaxed);
        		pthread_mutex_unlock(&lockb[b]);
        		break;
      		}
			pthread_mutex_unlock(&lockb[b]);
     	 	b = (b+1) % NUMBLOCKS;
    	}
  	}
	pthread_mutex_unlock(&locki[i]);

	return NULL;
}

int arg[NUM_THREADS];
int main(int argc, char *argv[])
{
  	int i;
  	// init
  	for (i = 0; i < NUMINODE; i++) {
    	pthread_mutex_init (&locki[i], NULL);
    	atomic_init(&inode[i], 0);
  	}

  	// init
  	for (i = 0; i < NUMBLOCKS; i++) {
		pthread_mutex_init (&lockb[i], NULL);
		atomic_init(&busy[i], 0);
  	}

  	// create threads
  	for (i = 0; i < NUM_THREADS; i++){
    	arg[i] = i;
    	pthread_create(&tids[i], NULL, thread_routine, &arg[i]);
  	}

  	for (i = 0; i < NUM_THREADS; i++){
    	pthread_join(tids[i], NULL);
  	}

  	return 0;
}
