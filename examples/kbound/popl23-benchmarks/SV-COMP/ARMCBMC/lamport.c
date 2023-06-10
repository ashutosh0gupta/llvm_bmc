/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-atomic/lamport-b.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

// shared variables
long x, y;    // A workaround
long b1, b2;  // A workaround
long var;     // A workaround

void *p1(void *arg)
{
  	int ok;
  	while(1)
  	{
    	ok = 0;

    	while(1)
    	{
      		atomic_store_explicit(&b1, 1, memory_order_relaxed);
      		atomic_store_explicit(&x, 1, memory_order_relaxed);

      		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
        		atomic_store_explicit(&b1, 0, memory_order_relaxed);

        		while(1)
        		{
          			if (atomic_load_explicit(&y, memory_order_relaxed) == 0)
            			goto breaklbl0;
        		}

        		goto breaklbl;
       			breaklbl0:;
        		continue;
      		}

			atomic_store_explicit(&y, 1, memory_order_relaxed);

      		if (atomic_load_explicit(&x, memory_order_relaxed) != 1) {
        		atomic_store_explicit(&b1, 0, memory_order_relaxed);

        		while(1)
    	        {
          			if (atomic_load_explicit(&b2, memory_order_relaxed) < 1)
            			goto breaklbl1;
        		}

        		goto breaklbl;
        		breaklbl1:;

        		if (atomic_load_explicit(&y, memory_order_relaxed) != 1) {
          			while(1)
          			{
            			if (atomic_load_explicit(&y, memory_order_relaxed) == 0)
              				goto breaklbl2;
          			}

					goto breaklbl;
          			breaklbl2:;
          			continue;
        		}
      		}

			ok = 1;
      		goto breaklbl;
    	}

    	breaklbl:;
    	if (ok==0) return NULL;

        // critical section
    	atomic_store_explicit(&var, 1, memory_order_relaxed);
    	assert(atomic_load_explicit(&var, memory_order_relaxed) == 1);

    	atomic_store_explicit(&y, 0, memory_order_relaxed);
    	atomic_store_explicit(&b1, 0, memory_order_relaxed);
  	}

	return NULL;

}

void *p2(void *arg)
{
  	int ok;
  	while(1)
  	{
    	ok = 0;

    	while(1)
    	{
      		atomic_store_explicit(&b2, 1, memory_order_relaxed);
      		atomic_store_explicit(&x, 2, memory_order_relaxed);

      		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
        		atomic_store_explicit(&b2, 0, memory_order_relaxed);

        		while(1)
        		{
          			if (atomic_load_explicit(&y, memory_order_relaxed) == 0)
            			goto breaklbl0;
        		}

        		goto breaklbl;
        		breaklbl0:;
        		continue;

      		}

      		atomic_store_explicit(&y, 2, memory_order_relaxed);

      		if (atomic_load_explicit(&x, memory_order_relaxed) != 2) {
        		atomic_store_explicit(&b2, 0, memory_order_relaxed);

        		while(1)
        		{
         			if (atomic_load_explicit(&b1, memory_order_relaxed) < 1)
            			goto breaklbl1;
        		}

        		goto breaklbl;
        		breaklbl1:;

        		if (atomic_load_explicit(&y, memory_order_relaxed) != 2) {
          			while(1)
          			{
            			if (atomic_load_explicit(&y, memory_order_relaxed) == 0)
              				goto breaklbl2;
          			}

          			goto breaklbl;
          			breaklbl2:;
          			continue;
        		}
      		}

      		ok = 1;
      		goto breaklbl;
		}

    	breaklbl:;
    	if (ok==0) return NULL;

        // critical section
    	atomic_store_explicit(&var, 2, memory_order_relaxed);
    	assert(atomic_load_explicit(&var, memory_order_relaxed) == 2);

    	atomic_store_explicit(&y, 0, memory_order_relaxed);
    	atomic_store_explicit(&b2, 0, memory_order_relaxed);
  	}

	return NULL;
}

int main(int argc, char *argv[])
{
  	pthread_t a, b;

  	atomic_init(&x, 0);
  	atomic_init(&y, 0);
  	atomic_init(&b1, 0);
  	atomic_init(&b2, 0);
  	atomic_init(&var, 0);

  	pthread_create(&a, NULL, p1, NULL);
  	pthread_create(&b, NULL, p2, NULL);

  	pthread_join(a, NULL);
  	pthread_join(b, NULL);

	return 0;
}
