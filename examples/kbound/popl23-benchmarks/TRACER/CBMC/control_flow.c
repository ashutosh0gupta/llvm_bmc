/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Get inspiration from the Control-flow benchmark in Fig 8 in the journal JACM 2017
   https://dl.acm.org/citation.cfm?id=3073408
*/

#include <assert.h>
#include <pthread.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
int x, y, z;

void *p(void *arg)
{
	int loc_x;
	loc_x =  x;
	return NULL;
}

void *q(void *arg)
{
	y = 1;
	return NULL;
}

void *r(void *arg)
{
	if (y == 0)
		z = 1;
	return NULL;
}

void *s(void *arg)
{
	if (z == 1)
		if (y == 0)
			x = 1;
	return NULL;
}

int main(int argc, char *argv[])
{
	int i;
	pthread_t ps[N], qs[N], rs, ss;

	x = 0;
	y = 0;
	z = 0;

	for (i = 0; i < N; i++){
		pthread_create(&ps[i], NULL, p, NULL);
		pthread_create(&qs[i], NULL, q, NULL);
	}

	pthread_create(&rs, NULL, r, NULL);
	pthread_create(&ss, NULL, s, NULL);

	return 0;
}