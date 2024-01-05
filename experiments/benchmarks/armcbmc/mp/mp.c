atomic_int x;
atomic_int y;

int r;

#ifndef N
# define N 10
#endif

void *thread_1(void *unused)
{
	atomic_store_explicit(&x, 1, memory_order_relaxed);
	atomic_store_explicit(&y, 1, memory_order_release);
	return NULL;
}

void *thread_2(void *unused)
{
	for (int i = 0u; i <= N; i++) {
		if (i == N)
			pthread_exit(NULL);
		if (atomic_load_explicit(&y, memory_order_acquire) != 0)
			break;
	}
	r = atomic_load_explicit(&x, memory_order_relaxed);

	return NULL;
}
