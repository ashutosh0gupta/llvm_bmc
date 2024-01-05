/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Example in Figure 2 in the PLDI 2015 paper:
   https://dl.acm.org/citation.cfm?id=2737975
*/

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../exponential_bug.c"

int main(int argc, char *argv[])
{
	pthread_t t1, t2, t3;

	atomic_init(&x, 0);
	atomic_init(&y, 0);

    pthread_mutex_init (&lock, NULL);

	pthread_create(&t1, NULL, thr1, NULL);
	pthread_create(&t2, NULL, thr2, NULL);
	pthread_create(&t3, NULL, thr3, NULL);

	return 0;
}
