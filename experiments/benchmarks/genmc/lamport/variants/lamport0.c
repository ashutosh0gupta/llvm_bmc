#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdatomic.h>
#include <pthread.h>
#include <assert.h>

#include "../lamport.c"

int main()
{
	pthread_t t[N+1];
	for (intptr_t i = 1; i <= N; i++)
		pthread_create(t+i, 0, thread, &i);

	for (intptr_t i = 1; i <= N; i++)
		pthread_join(t[i], NULL);

#ifdef NIDHUGG
	printf("full exec\n");
#endif

	return 0;
}
