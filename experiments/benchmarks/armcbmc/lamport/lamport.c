#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdatomic.h>
#include <pthread.h>
#include <assert.h>


int main()
{
	pthread_t t[N+1];
	for (intptr_t i = 1; i <= N; i++)
		pthread_create(t+i, 0, thread, (void*)i);

	for (intptr_t i = 1; i <= N; i++)
		pthread_join(t[i], NULL);

	return 0;
}


/* Lamport's fast mutex algorithm 2
 * (https://users.soe.ucsc.edu/~scott/courses/Fall11/221/Papers/Sync/lamport-tocs87.pdf)
 */


#  define N 3
#define BND 3

void __VERIFIER_assume(intptr_t);
#define await(cond) __VERIFIER_assume(cond)

atomic_intptr_t b[N+1], x, y;

static void lock(intptr_t thread)
{
	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			pthread_exit(NULL);

		b[thread] = true;
		x = thread;
		if (y != 0) {
			b[thread] = false;
			await(y == 0);
			continue;
		}
		y = thread;
		if (x != thread) {
			b[thread] = false;
			for (intptr_t j = 1; j <= N; j++)
				await(b[j] == false);
			if (y != thread) {
				await(y == 0);
				continue;
			}
		}
		break;
	}
}

static void unlock(intptr_t thread)
{
	y = 0;
	b[thread] = false;
}

static void *thread(void *arg)
{
	intptr_t thread = (intptr_t)arg;
	lock(thread);
	unlock(thread);
	return NULL;
}
