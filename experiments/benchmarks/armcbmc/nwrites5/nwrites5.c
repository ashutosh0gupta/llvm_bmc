#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

# define N 5

long x[N];
long idx[N];

void *thread_n(void *arg)
{
	int i = *((int *) arg);
	atomic_store_explicit(&x[i], 42, memory_order_relaxed);
	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t t[N];

	for (int i = 0; i < N; i++)
                atomic_init(&idx[i], i);
	for (int i = 0; i < N; i++) {
		pthread_create(&t[i], NULL, thread_n, &idx[i]);
	}
	for (int i = 0; i < N; i++) {
		pthread_join(t[i], NULL);
	}
	for (int i = 0; i < N; i++) {
		assert(atomic_load_explicit(&x[i], memory_order_relaxed) == 42);
	}
		
	return 0;
}

