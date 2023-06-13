/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Example in Figure 2 in the PLDI 2015 paper:
   https://dl.acm.org/citation.cfm?id=2737975
*/

#include <assert.h>
#include <pthread.h>

#ifndef N
#  warning "N was not defined"
#  define N 3
#endif

// shared variables
int x, y;
pthread_mutex_t lock;

void *thr1(void *arg)
{
  	pthread_mutex_lock(&lock);
	x = 1;
	for (int i=0; i<N; i++) {
		y = 1;
	}
	pthread_mutex_unlock(&lock);

  	pthread_mutex_lock(&lock);
	x = 1;
	for (int i=0; i<N; i++) {
		y = 1;
	}
	pthread_mutex_unlock(&lock);

	return NULL;
}

void *thr2(void *arg)
{
	int _y;

  	pthread_mutex_lock(&lock);
	x = 0;
	pthread_mutex_unlock(&lock);

	if (x > 0) {
		_y = y;
		y = _y+1;
		x = 2;
	}

  	pthread_mutex_lock(&lock);
	x = 0;
	pthread_mutex_unlock(&lock);

	if (x > 0) {
		_y = y;
		y = _y+1;
		x = 2;
	}

	return NULL;
}

void *thr3(void *arg)
{
	if (x > 1) {
		if (y == 3) {
			assert(0);
			return NULL;
		} else {
			y = 2;
		}
	}

	if (x > 1) {
		if (y == 3) {
			assert(0);
			return NULL;
		} else {
			y = 2;
		}
	}

	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t t1, t2, t3;

	x = 0;
	y = 0;

    pthread_mutex_init (&lock, NULL);

	pthread_create(&t1, NULL, thr1, NULL);
	pthread_create(&t2, NULL, thr2, NULL);
	pthread_create(&t3, NULL, thr3, NULL);

	return 0;
}
