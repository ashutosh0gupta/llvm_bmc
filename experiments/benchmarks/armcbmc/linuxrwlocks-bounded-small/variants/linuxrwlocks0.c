#include <stdio.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../linuxrwlocks.c"

int main()
{
	pthread_t t1, t2, t3;

	atomic_init(&mylock.lock, RW_LOCK_BIAS);

	pthread_create(&t1, NULL, b, NULL);
	pthread_create(&t2, NULL, c, NULL);
	pthread_create(&t3, NULL, c, NULL);

	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	pthread_join(t3, NULL);

	return 0;
}
