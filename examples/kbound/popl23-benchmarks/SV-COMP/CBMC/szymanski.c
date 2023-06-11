/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/*
 * Adapted from: https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-atomic/szymanski-b.c
 */

#include <assert.h>
#include <pthread.h>

// shared variables
volatile int flag1;
volatile int flag2;  // A workaround
volatile int x;      // A workaround

void *p1(void *arg)
{
  	int ok;
  	while(1)
  	{
    	flag1 = 1;

    	ok = 0;
    	while(1)
    	{
      		if (flag2 < 3) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
    	flag1 = 3;

    	if (flag2 == 1) {
      		flag1 = 2;

      		ok =0;
      		while(1)
      		{
        		if (flag2 == 4) {
          			ok = 1;
          			break;
        		}
      		}

			if (ok==0) return NULL;
    	}

    	flag1 = 4;

    	ok = 0;
    	while(1)
    	{
      		if (flag2 < 2) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
      	// critical section
    	x = 1;
    	assert(x == 1);

    	ok = 0;
    	while(1)
    	{
      		if (2 > flag2 || flag2 > 3) {
        		ok = 1;
        		break;
      		}
    	}

    	if (ok==0) return NULL;
    	flag1 = 0;
  	}

	return NULL;
}

void *p2(void *arg)
{
  	int ok;
  	while(1)
  	{
    	flag2 = 1;

    	ok = 0;
    	while(1)
    	{
      		if (flag1 < 3) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
    	flag2 = 3;

    	if (flag1 == 1) {
      		flag2 = 2;

      		ok =0;
      		while(1)
      		{
        		if (flag1 == 4) {
          			ok = 1;
          			break;
        		}
      		}

			if (ok==0) return NULL;

    	}

    	flag2 = 4;

    	ok = 0;
    	while(1)
    	{
      		if (flag1 < 2) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
      	// critical section
    	x = 2;
    	assert(x == 2);

    	ok = 0;
    	while(1)
    	{
      		if (2 > flag1 || flag1 > 3) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
    	flag2 = 0;
  	}

	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t a, b;

	flag1 = 0;
	flag2 = 0;
	x = 0;

  	pthread_create(&a, NULL, p1, NULL);
  	pthread_create(&b, NULL, p2, NULL);

	pthread_join(a, NULL);
  	pthread_join(b, NULL);

 	return 0;
}
