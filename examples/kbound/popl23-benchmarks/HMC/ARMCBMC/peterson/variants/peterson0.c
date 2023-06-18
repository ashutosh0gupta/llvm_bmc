/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from HMC benchmarks https://zenodo.org/record/3562083
*/

#include <pthread.h>
#include <assert.h>
#include <stdatomic.h>

#include "../peterson.c"

int main()
{
	pthread_t t1, t2;
	
	atomic_init(&flag1, 0);
 	atomic_init(&flag2, 0);
 	atomic_init(&turn, 0);
 	atomic_init(&x, 0);
 	
 	pthread_create(&t1, NULL, thread_1, NULL);
 	pthread_create(&t2, NULL, thread_2, NULL);

 	pthread_join(t1, NULL);
  	pthread_join(t2, NULL);
  	
	return 0;
}
