#ifndef N
# define N 8
#endif

atomic_int x[N];
atomic_int idx[N];

void *thread_n(void *arg)
{
	int i = *((int *) arg);
	atomic_store_explicit(&x[i], 42, memory_order_relaxed);
	return NULL;
}
