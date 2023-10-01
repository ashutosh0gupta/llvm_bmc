#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../linuxrwlocks.c"

int main()
{
	pthread_t tr, tw, trw;
	/* pthread_t W[MAXWRITERS], R[MAXREADERS], RW[MAXRDWR]; */

	atomic_init(&mylock.lock, RW_LOCK_BIAS);
	pthread_create(&tr, NULL, threadR, NULL);
	pthread_create(&tw, NULL, threadW, NULL);
	pthread_create(&trw, NULL, threadRW, NULL);

	pthread_join(tr, NULL);
	pthread_join(tw, NULL);
	pthread_join(trw, NULL);

	/* for (int i = 0; i < readers; i++) */
	/* 	pthread_create(&R[i], NULL, threadR, NULL); */
	/* for (int i = 0; i < writers; i++) */
	/* 	pthread_create(&W[i], NULL, threadW, NULL); */
	/* for (int i = 0; i < rdwr; i++) */
	/* 	pthread_create(&RW[i], NULL, threadRW, NULL); */

	/* for (int i = 0; i < readers; i++) */
	/* 	pthread_join(R[i], NULL); */
	/* for (int i = 0; i < writers; i++) */
	/* 	pthread_join(W[i], NULL); */
	/* for (int i = 0; i < rdwr; i++) */
	/* 	pthread_join(RW[i], NULL); */

	return 0;
}
