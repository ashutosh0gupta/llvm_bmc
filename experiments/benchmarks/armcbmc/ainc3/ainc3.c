#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

#define N 3

long x;

void *thread_n(void *unused)
{
	atomic_fetch_add_explicit(&x, 1, memory_order_relaxed);
	return NULL;
}


int main()
{
	pthread_t t[N];
	atomic_init(&x, 0);
	
	for (int i = 0; i < N; i++)
		pthread_create(&t[i], NULL, thread_n, NULL);
	for (int i = 0; i < N; i++)
		pthread_join(t[i], NULL);	
	assert(atomic_load_explicit(&x, memory_order_relaxed) == N);
	return 0;
}

