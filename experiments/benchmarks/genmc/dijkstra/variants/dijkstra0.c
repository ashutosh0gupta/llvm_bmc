/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from:
 * Dijkstra's critical section algorithm, implemented with fences.
 *
 * URL:
 *   https://www.eecs.yorku.ca/course_archive/2007-08/W/6117/DijMutexNotes.pdf
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../dijkstra.c"

int arg[N];
int main(int argc, char **argv)
{
  	pthread_t ts[N];
    int i;
	for (i=0; i<N; i++) {
	  	atomic_init(&interested[i], 0);
	  	atomic_init(&passed[i], 0);
	}
	atomic_init(&k, 0);
	atomic_init(&x, 0);
	for (i=0; i<N; i++) {
	  	arg[i] = i;
	  	pthread_create(&ts[i], NULL, t, &arg[i]);
	}
  	for (i=0; i<N; i++) {
  		pthread_join(ts[i], NULL);
  	}
  	return 0;
}
