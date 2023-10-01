#include <stdlib.h>
#include <pthread.h>
#include <assert.h>
#include <stdatomic.h>

#include "../pgsql.c"

int arg[N];
int main(int argc, char **argv)
{
  	pthread_t ts[N];
    int i;
	for (i=1; i<N; i++) {
	  	atomic_init(&latch[i], 0);
	  	atomic_init(&flag[i], 0);
	}
	atomic_init(&latch[0], 1);
	atomic_init(&flag[0], 1);
	for (i=0; i<N; i++) {
	  	arg[i] = i;
	  	pthread_create(&ts[i], NULL, t, &arg[i]);
	}
  	for (i=0; i<N; i++) {
  		pthread_join(ts[i], NULL);
  	}
  	return 0;
}
