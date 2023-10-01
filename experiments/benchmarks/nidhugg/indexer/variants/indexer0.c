#include <assert.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdatomic.h>

#include "../indexer.c"

int idx[N];

int main()
{
	pthread_t t[N];

	for (int i = 0; i < N; i++) {
		idx[i] = i;
		pthread_create(&t[i], NULL, thread_n, &idx[i]);
	}
	for (int i = 0; i < N; i++) {
		pthread_join(t[i], NULL);
	}
	assert(atomic_load_explicit(&table[0], memory_order_relaxed) <= (MAX * 11 + N));
	return 0;
}
