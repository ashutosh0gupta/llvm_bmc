#include <stdlib.h>
#include <threads.h>
#include <stdbool.h>
#include <stdatomic.h>
#include <assert.h>

#define SIZE 128
#define MAX  4

atomic_int table[SIZE];
int idx[N];

static void thread_n(void *arg)
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
}

int user_main(int argc, char **argv)
{
	thrd_t t[N];

	for (int i = 0; i < SIZE; i++)
		atomic_init(&table[i], 0);
	for (int i = 0; i < N; i++) {
		idx[i] = i;
		thrd_create(&t[i], (thrd_start_t)&thread_n, &idx[i]);
	}

	return 0;
}
