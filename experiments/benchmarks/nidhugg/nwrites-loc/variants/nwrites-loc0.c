#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

#include "../nwrites-loc.c"

int main()
{
	pthread_t t[N];

	for (int i = 0; i < N; i++) {
		if (pthread_create(&t[i], NULL, thread_n, NULL))
			abort();
	}
	for (int i = 0; i < N; i++) {
		if (pthread_join(t[i], NULL))
			abort();
	}
	assert(atomic_load_explicit(&x, memory_order_relaxed) == 42);

	return 0;
}
