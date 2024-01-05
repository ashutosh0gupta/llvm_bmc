#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

#include "../nwrites.c"

int main()
{
	pthread_t t[N];

	for (int i = 0; i < N; i++)
                atomic_init(&idx[i], i);
	for (int i = 0; i < N; i++) {
		if (pthread_create(&t[i], NULL, thread_n, &idx[i]))
			abort();
	}
	for (int i = 0; i < N; i++) {
		if (pthread_join(t[i], NULL))
			abort();
	}
	for (int i = 0; i < N; i++) {
		assert(atomic_load_explicit(&x[i], memory_order_relaxed) == 42);
	}
	return 0;
}
