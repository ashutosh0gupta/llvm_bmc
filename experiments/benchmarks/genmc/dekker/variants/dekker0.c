/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-atomic/dekker-b.c */

#include <stdlib.h>
#include <pthread.h>
#include <assert.h>
#include <stdatomic.h>

#include "../dekker.c"

int main()
{
  	pthread_t a, b;
  
  	atomic_init(&flag1, 0);
  	atomic_init(&flag2, 0);
  	atomic_init(&turn, 0);
  	atomic_init(&x, 0);
  	
  	pthread_create(&a, NULL, p1, NULL);
  	pthread_create(&b, NULL, p2, NULL);
  
  	pthread_join(a, NULL);
  	pthread_join(b, NULL);
  
  	return 0;
}
