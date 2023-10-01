#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

#define N 5

long x;
long idx[N+1];

void *thread_writer(void *unused)
{
	atomic_store_explicit(&x, 42, memory_order_relaxed);
	return NULL;
}

void *thread_reader(void *arg)
{
	int r = *((int *) arg);
	atomic_load_explicit(&x, memory_order_relaxed);
	return NULL;
}

int main(int argc, char *argv[])
{
	pthread_t t[N+1];

	for (int i = 0; i <= N; i++)
                atomic_init(&idx[i], i);
	for (int i = 0; i <= N; i++) {
		if (i == 0) {
			pthread_create(&t[i], NULL, thread_writer, NULL);
		} else {
			pthread_create(&t[i], NULL, thread_reader, &idx[i-1]);
		}
	}

	for (int i = 0; i <= N; i++) {
		pthread_join(t[i], NULL);
	}
	
	assert(atomic_load_explicit(&x, memory_order_relaxed) == 42);

	return 0;
}


