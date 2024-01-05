#include <stdatomic.h>
#include <pthread.h>
#include <assert.h>

/* Lamport's fast mutex algorithm 2
 * (https://users.soe.ucsc.edu/~scott/courses/Fall11/221/Papers/Sync/lamport-tocs87.pdf)
 */


#define N 4
#define BND 3

long b[N+1], x, y;
long v;

/*
int lock(int thread)
{
	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			return -1;

		atomic_store_explicit(&b[thread], 1, memory_order_relaxed);
		atomic_store_explicit(&x, thread, memory_order_relaxed);
		
		if (atomic_load_explicit(&y, memory_order_relaxed) != 0) {
			atomic_store_explicit(&b[thread], 0, memory_order_relaxed);
			if (atomic_load_explicit(&y, memory_order_relaxed) != 0)
				return -1;
			continue;
		}
		atomic_store_explicit(&y, thread, memory_order_relaxed);
		if (atomic_load_explicit(&x, memory_order_relaxed) != thread) {
			atomic_store_explicit(&b[thread], 0, memory_order_relaxed);
			for (int j = 1; j <= N; j++)
				if(atomic_load_explicit(&b[j], memory_order_relaxed) != 0)
					return -1;
			if (atomic_load_explicit(&y, memory_order_relaxed) != thread) {
				if (atomic_load_explicit(&y, memory_order_relaxed) != 0)
					return -1;
				continue;
			}
		}
		break;
	}
	return 1;
}

*/

int lock(int thread)
{
	return 0;
}

void unlock(int thread)
{
	atomic_store_explicit(&y, 0, memory_order_relaxed);
	atomic_store_explicit(&b[thread], 0, memory_order_relaxed);
}

void *thread(void *arg)
{
	int thread = *((int *) arg);
	if (lock(thread) == -1)
		return NULL;
	/* Critical section start */
	//atomic_store_explicit(&v, thread, memory_order_relaxed);
	assert(atomic_load_explicit(&v, memory_order_relaxed) == thread);
	unlock(thread);
	return NULL;
}

int idx[N];
int main()
{
	pthread_t t[N];
	for (int i = 0; i < N; i++) {
	       idx[i] = i;
		pthread_create(&t[i], NULL, thread, &idx[i]);
	}

	for (int i = 0; i < N; i++)
		pthread_join(t[i], NULL);

	return 0;
}
