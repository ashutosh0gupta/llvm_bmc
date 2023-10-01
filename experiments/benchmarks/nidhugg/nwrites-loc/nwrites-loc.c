#ifndef N
# define N 8
#endif

atomic_int x;

void *thread_n(void *unused)
{
	atomic_store_explicit(&x, 42, memory_order_relaxed);
	return NULL;
}
