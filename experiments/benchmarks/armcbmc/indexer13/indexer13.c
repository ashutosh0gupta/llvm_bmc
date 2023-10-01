#include <assert.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdatomic.h>

#define N 13

#define SIZE 128
#define MAX  4

long table[SIZE];

void *thread_n(void *arg)
{
	int tid = *((int *) arg);
	int zero = 0;
	int w, h;

	for (int i = 0; i < MAX; i++) {
		w = i * 11 + tid;

		h = (w * 7) % SIZE;

		if (h < 0)
			assert(0);

		while (!atomic_compare_exchange_strong_explicit(&table[h], &zero, w,
								memory_order_relaxed,
								memory_order_relaxed)) {
			h = (h+1) % SIZE;
			zero = 0;
		}
	}
	return NULL;
}

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

