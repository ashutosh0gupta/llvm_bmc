#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

# define N 5

long x;

void *thread_n(void *unused)
{
	atomic_store_explicit(&x, 42, memory_order_relaxed);
	return NULL;
}

int main()
{
	pthread_t t[N];

	for (int i = 0; i < N; i++) {
		pthread_create(&t[i], NULL, thread_n, NULL);
	}
	for (int i = 0; i < N; i++) {
		pthread_join(t[i], NULL);
	}
	assert(atomic_load_explicit(&x, memory_order_relaxed) == 42);

	return 0;
}


