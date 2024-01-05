/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-atomic/dekker-b.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

// shared variables
long flag1; // A workaround
long flag2; // A workaround
long turn;  // A workaround
long x;     // A workaround

void *p1(void *arg)
{
  	while (1)
  	{
    	atomic_store_explicit(&flag1, 1, memory_order_relaxed);   
    	while (1)
    	{
      		if (atomic_load_explicit(&flag2, memory_order_relaxed)) {
        		if (atomic_load_explicit(&turn, memory_order_relaxed) != 0)
        		{
          			atomic_store_explicit(&flag1, 0, memory_order_relaxed);
          			while (1)
          			{
            			if (atomic_load_explicit(&turn, memory_order_relaxed) == 0) {
              				break;
            			}
          			}
				    atomic_store_explicit(&flag1, 1, memory_order_relaxed);
        		}
      		} else {
        		break;
      		}
    	}
    	// critical section
    	atomic_store_explicit(&x, 1, memory_order_relaxed);
    	assert(atomic_load_explicit(&x, memory_order_relaxed) == 1);
    	atomic_store_explicit(&turn, 1, memory_order_relaxed);
    	atomic_store_explicit(&flag1, 0, memory_order_relaxed);
  	}
	return NULL;
}

void *p2(void *arg)
{  
  	while (1)
  	{
    	atomic_store_explicit(&flag2, 1, memory_order_relaxed);   
    	while (1)
  	    {
      		if (atomic_load_explicit(&flag1, memory_order_relaxed)) {
        		if (atomic_load_explicit(&turn, memory_order_relaxed) != 1)
        		{
          			atomic_store_explicit(&flag2, 0, memory_order_relaxed);
          			while (1)
  	                {
            			if (atomic_load_explicit(&turn, memory_order_relaxed) == 1) {
              				break;
            			}
          			}
          			atomic_store_explicit(&flag2, 1, memory_order_relaxed);
        		}
      		} else {
        		break;
      		}
    	}
    	// critical section
    	atomic_store_explicit(&x, 2, memory_order_relaxed);
    	assert(atomic_load_explicit(&x, memory_order_relaxed) == 2);
    	atomic_store_explicit(&turn, 0, memory_order_relaxed);
    	atomic_store_explicit(&flag2, 0, memory_order_relaxed);
  	}
	return NULL;
}

int main(int argc, char *argv[])
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
