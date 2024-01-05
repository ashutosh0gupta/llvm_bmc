#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

#include "../parker.c"

int main()
{
	pthread_t t1, t2;

	if (pthread_create(&t1, NULL, thread_parker, NULL))
		abort();
	if (pthread_create(&t2, NULL, thread_unparker, NULL))
		abort();

	return 0;
}
