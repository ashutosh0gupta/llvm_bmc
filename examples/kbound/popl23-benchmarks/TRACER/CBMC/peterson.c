/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from:
 * Peterson's critical section algorithm, implemented with fences.
 *
 * Adapted from: https://svn.sosy-lab.org/software/sv-benchmarks/trunk/c/pthread-atomic/peterson_true-unreach-call.c
 */

#include <assert.h>
#include <pthread.h>

int flag0;
int flag1;
int turn;
int x;

void *p0(void *arg)
{
  	while(1) {
    	flag0 = 1;
    	turn = 1;

    	int ok = 0;
    	while (1) {
      		int _flag1 = flag1;
      		int _turn =  turn;
      		if ( _flag1 != 1 || _turn != 1) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;
    	// critical section
    	x = 1;
    	assert(x == 1);
    	flag0 = 0;
  	}

	return NULL;
}

void *p1(void *arg)
{
  	while (1) {
    	flag1 = 1;
    	turn = 0;

    	int ok = 0;
    	while (1) {
      		int _flag0 = flag0;
      		int _turn =  turn;
      		if (_flag0 != 1 || _turn != 0) {
        		ok = 1;
        		break;
      		}
    	}

		if (ok==0) return NULL;

    	// critical section
    	x = 2;
    	assert(x == 2);
    	flag1 = 0;
  	}

	return NULL;
}

int main(int argc, char **argv)
{
 	pthread_t a, b;

 	flag0 = 0;
 	flag1 = 0;
 	turn = 0;
 	x = 0;

 	pthread_create(&a, NULL, p0, NULL);
 	pthread_create(&b, NULL, p1, NULL);

 	pthread_join(a, NULL);
  	pthread_join(b, NULL);

 	return 0;
}