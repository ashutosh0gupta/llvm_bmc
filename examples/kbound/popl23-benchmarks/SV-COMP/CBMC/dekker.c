/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from https://github.com/sosy-lab/sv-benchmarks/blob/master/c/pthread-atomic/dekker-b.c */

#include <assert.h>
#include <pthread.h>

// shared variables
volatile int flag1;
volatile int flag2;
volatile int turn;
volatile int x;

void *p1(void *arg)
{
  	int ok1, ok2;
  	while (1)
  	{
    	flag1 = 1;
    
    	ok1 = 0;
    	while (1)
    	{
      		if (flag2) {
        		if (turn != 0)
        		{
          			flag1 = 0;
          
					ok2 = 0;
          			while (1)
          			{
            			if (turn == 0) {
              				ok2 = 1;
              				break;
            			}
          			}
          
					if (ok2 == 0) return NULL;
          			flag1 = 1;
        		}
      		} else {
        		ok1 = 1;
        		break;
      		}
    	}
    	
		if (ok1 == 0) return NULL;    
    	// critical section
    	x = 1;
    	assert(x == 1);
    
    	turn = 1;
    	flag1 = 0;
  	}
	return NULL;
}

void *p2(void *arg)
{
  	int ok1, ok2;
  
  	while (1)
  	{
    	flag2 = 1;
    
    	ok1 = 0;
    	while (1)
  	    {
      		if (flag1) {
        		if (turn != 1)
        		{
          			flag2 = 0;
          			
					ok2 = 0;
          			while (1)
  	                {
            			if (turn == 1) {
              				ok2 = 1;
              				break;
            			}
          			}

          			if (ok2==0) return NULL;
          			flag2 = 1;
        		}
      		} else {
        		ok1 = 1;
        		break;
      		}
    	}

    	if (ok1==0) return NULL;    
    	// critical section
    	x = 2;
    	assert(x == 2);
    
    	turn = 0;
    	flag2 = 0;
  	}
	return NULL;
}

int main(int argc, char *argv[])
{
  	pthread_t a, b;
  
  	flag1 = 0;
  	flag2 = 0;
  	turn = 0;
  	x = 0;
  	
  	pthread_create(&a, NULL, p1, NULL);
  	pthread_create(&b, NULL, p2, NULL);
  
  	pthread_join(a, NULL);
  	pthread_join(b, NULL);
  
  	return 0;
}
