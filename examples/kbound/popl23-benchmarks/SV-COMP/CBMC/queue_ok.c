/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread/queue_ok.c */

#include <assert.h>
#include <pthread.h>

#define SIZE	(6)
#define EMPTY	(-1)
#define FULL	(-2)
#define FALSE	(0)
#define TRUE	(1)
#define NUM_ENQUEUE_THREADS 3
#define NUM_DEQUEUE_THREADS 3

volatile int element[SIZE];
volatile int head;
volatile int tail;
volatile int amount;
pthread_mutex_t  lock;
volatile int stored_elements[SIZE];
volatile int enqueue_flag, dequeue_flag;

void init(void)
{
  	head = 0;
  	tail = 0;
  	amount = 0;
  	int i;
  	for (i=0; i<SIZE; i++) {
    	element[i] = 0;
  	}
}

int empty(void)
{
  	int _head, _tail, _amount;
  	_head = head;
  	_tail = tail;
  	_amount = amount;

  	if (_head == _tail && _amount==0) {
    	return EMPTY;
  	} else
    	return 0;
}

int full(void)
{
  	int _amount;
  	_amount = amount;
  	if (_amount == SIZE) {
    	return FULL;
  	} else
    	return 0;
}

int enqueue(int x)
{
  	int _tail, _amount;

	_tail = tail;
  	element[_tail] = x;

  	_amount = amount;
  	amount = _amount+1;

  	_tail = tail;
  	if (_tail == SIZE-1) {
    	tail = 0;
  	} else {
   		_tail = tail;
   		tail = _tail+1;
 	}

 	return 0;
}


int dequeue()
{
  	int x, _head, _amount;

  	_head = head;
  	x = element[_head];

  	_amount = amount;
 	amount = _amount-1;

  	_head = head;
  	if (_head == SIZE-1) {
    	head = 0;
  	} else {
  		_head = head;
    	head = _head+1;
  	}

  	return x;
}

void *enqueuethread(void *arg)
{
	int value, i, _enqueue_flag;
  	int enqueue_number = 0;
  	value = *((int *)arg);

    pthread_mutex_lock(&lock);
  	_enqueue_flag = enqueue_flag;

	if (_enqueue_flag)
  	{
    	for(i=0; i<SIZE; i++)
    	{
      		if (full() != FULL) {
        		value += enqueue_number;
        		enqueue_number++;
        		enqueue(value);
        		stored_elements[i] = value;
        		if (empty()) assert(0);
      		}
    	}
    	enqueue_flag = FALSE;
    	dequeue_flag = TRUE;
  	}

    pthread_mutex_unlock(&lock);

  	return NULL;
}


void *dequeuethread(void *arg)
{
  	int i, _dequeue_flag, _stored_elements_i;

    pthread_mutex_lock(&lock);
  	_dequeue_flag = dequeue_flag;

  	if (_dequeue_flag)
  	{
    	for(i=0; i<SIZE; i++)
    	{
      		if (empty()!=EMPTY) {
        		_stored_elements_i = stored_elements[i];
        		if (!(dequeue() == _stored_elements_i)) {
          			assert(0);
        		}
      		}
    	}

    	dequeue_flag = FALSE;
    	enqueue_flag = TRUE;
  	}

    pthread_mutex_unlock(&lock);

  	return NULL;
}


int arg[NUM_ENQUEUE_THREADS];
int main(int argc, char *argv[])
{
	int i;
	pthread_t t1s[NUM_ENQUEUE_THREADS], t2s[NUM_DEQUEUE_THREADS];

	enqueue_flag = TRUE;
	dequeue_flag = FALSE;
	pthread_mutex_init (&lock, NULL);

	init();

  	if (!(empty()==EMPTY)) {
    	assert(0);
  	}

  	for (i=0; i<SIZE; i++) {
    	stored_elements[i] = 0;
  	}

  	for (i=0; i<NUM_ENQUEUE_THREADS; i++) {
    	arg[i] = i;
    	pthread_create(&t1s[i], NULL, enqueuethread, &arg[i]);
  	}

  	for (i=0; i<NUM_DEQUEUE_THREADS; i++) {
    	pthread_create(&t2s[i], NULL, dequeuethread, NULL);
  	}

  	return 0;
}