/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/stack-1.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#define TRUE      (1)
#define FALSE     (0)
#define SIZE      (6)
#define OVERFLOW  (-1)
#define UNDERFLOW (-2)
#define FULL (-3)
#define NUM_PUSH_THREADS 1
#define NUM_POP_THREADS 1

// shared variables
long top;               // A workaround
long  stack[SIZE];      // A workaround
pthread_mutex_t  lock;

void inc_top(void)
{
  	int _top;
  	_top = atomic_load_explicit(&top, memory_order_relaxed);
  	atomic_store_explicit(&top, _top+1, memory_order_relaxed);
}

void dec_top(void)
{
  	int _top;
  	_top = atomic_load_explicit(&top, memory_order_relaxed);
  	atomic_store_explicit(&top, _top-1, memory_order_relaxed);
}

int get_top(void)
{
  	int _top;
  	_top = atomic_load_explicit(&top, memory_order_relaxed);
  	return _top;
}

int push(unsigned int x)
{
  	if (get_top() > SIZE) {
    	return OVERFLOW;
  	} else if (get_top() == SIZE) { // full state of the stack
    	return FULL;
  	} else {
    	atomic_store_explicit(&stack[get_top()], x, memory_order_relaxed);
    	inc_top();
  	}

  	return 0;
}

int pop(void)
{
  	if (get_top()==0) {
    	return UNDERFLOW;
  	} else {
    	dec_top();
    	int _return = atomic_load_explicit(&stack[get_top()], memory_order_relaxed);
    	return _return;
  	}

  	return 0;
}


void *pushthread(void *arg)
{
	int i, tid;
  	unsigned int tmp;
  	tid = *((int *)arg);

  	for(i=0; i<SIZE; i++)
  	{
    	pthread_mutex_lock(&lock);
    	tmp = tid % SIZE;
    	if (push(tmp) == OVERFLOW)
      		assert(0);
    	pthread_mutex_unlock(&lock);
  	}

	return NULL;
}

void *popthread(void *arg)
{
  	int i, _top;

  	for(i=0; i<SIZE; i++)
  	{
    	pthread_mutex_lock(&lock);
    	_top = atomic_load_explicit(&top, memory_order_relaxed);
    	if (_top > 0){
      		if (!(pop() != UNDERFLOW))
        		assert(0);
    	}
    	pthread_mutex_unlock(&lock);
  	}

	return NULL;
}

int arg[NUM_PUSH_THREADS];
int main(int argc, char *argv[])
{
	int i;
	pthread_t t1s[NUM_PUSH_THREADS], t2s[NUM_POP_THREADS];

	atomic_init(&top, 0);
	pthread_mutex_init (&lock, NULL);

	for (int i=0; i<SIZE; i++)
    	atomic_init(&stack[i], 0);

  	for (int i=0; i<NUM_PUSH_THREADS; i++) {
    	arg[i] = i;
    	pthread_create(&t1s[i], NULL, pushthread, &arg[i]);
  	}

  	for (int i=0; i<NUM_POP_THREADS; i++) {
    	pthread_create(&t2s[i], NULL, popthread, NULL);
  	}

  	return 0;
}
