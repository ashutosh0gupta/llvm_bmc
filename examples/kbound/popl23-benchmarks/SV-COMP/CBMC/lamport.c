/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-atomic/lamport-b.c */

#include <assert.h>
#include <pthread.h>

// shared variables
volatile int x, y;
volatile int b1, b2;
volatile int var;

void *p1(void *arg)
{
  	int ok;
  	while(1)
  	{
    	ok = 0;

    	while(1)
    	{
      		b1 = 1;
      		x = 1;

      		if (y != 0) {
        		b1 = 0;

        		while(1)
        		{
          			if (y == 0)
            			goto breaklbl0;
        		}

        		goto breaklbl;
       			breaklbl0:;
        		continue;
      		}

			y = 1;

      		if (x != 1) {
        		b1 = 0;

        		while(1)
    	        {
          			if (b2 < 1)
            			goto breaklbl1;
        		}

        		goto breaklbl;
        		breaklbl1:;

        		if (y != 1) {
          			while(1)
          			{
            			if (y == 0)
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
    	var = 1;
    	assert(var == 1);

    	y = 0;
    	b1 = 0;
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
      		b2 = 1;
      		x = 2;

       		if (y != 0) {
        		b2 = 0;

        		while(1)
        		{
          			if (y == 0)
            			goto breaklbl0;
        		}

        		goto breaklbl;
        		breaklbl0:;
        		continue;

      		}

      		y = 2;

      		if (x != 2) {
        		b2 = 0;

        		while(1)
        		{
         			if (b1 < 1)
            			goto breaklbl1;
        		}

        		goto breaklbl;
        		breaklbl1:;

        		if (y != 2) {
          			while(1)
          			{
            			if (y == 0)
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
    	var = 2;
    	assert(var == 2);

    	y = 0;
    	b2 = 0;
  	}

	return NULL;
}

int main(int argc, char *argv[])
{
  	pthread_t a, b;

  	x = 0;
  	y = 0;
  	b1 = 0;
  	b2 = 0;
  	var = 0;

  	pthread_create(&a, NULL, p1, NULL);
  	pthread_create(&b, NULL, p2, NULL);

  	pthread_join(a, NULL);
  	pthread_join(b, NULL);

	return 0;
}
