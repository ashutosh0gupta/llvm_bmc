
#ifndef N
#define N 3
#endif

// shared variables
atomic_int i, j;  // A workaround

void *t1(void *arg)
{
	int _i, _j;
	for (int k=0; k<N; k++) {
		_i = atomic_load_explicit(&i, memory_order_relaxed);
		_j = atomic_load_explicit(&j, memory_order_relaxed);
		atomic_store_explicit(&i, _i+_j, memory_order_relaxed);
	}
	return NULL;
}

void *t2(void *arg)
{
	int _i, _j;
	for (int k=0; k<N; k++) {
		_i = atomic_load_explicit(&i, memory_order_relaxed);
		_j = atomic_load_explicit(&j, memory_order_relaxed);
		atomic_store_explicit(&j, _i+_j, memory_order_relaxed);
	}
	return NULL;
}

static int fib(int n) {
	int cur = 1, prev = 0;
	while(n--) {
		int next = prev+cur;
		prev = cur;
		cur = next;
	}
	return prev;
}


