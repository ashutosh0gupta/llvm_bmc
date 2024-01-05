#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

long x;
long y;

int r;

# define N 100

void *thread_1(void *unused)
{
	atomic_store_explicit(&x, 1, memory_order_relaxed);
	atomic_store_explicit(&y, 1, memory_order_release);
	return NULL;
}

void *thread_2(void *unused)
{
	for (int i = 0u; i <= N; i++) {
		if (i == N)
			return NULL;
		if (atomic_load_explicit(&y, memory_order_acquire) != 0)
			break;
	}
	r = atomic_load_explicit(&x, memory_order_relaxed);

	return NULL;
}

int main()
{
	pthread_t t1, t2;

	pthread_create(&t1, NULL, thread_1, NULL);
	pthread_create(&t2, NULL, thread_2, NULL);

	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	assert(r != 2);

	return 0;
}



