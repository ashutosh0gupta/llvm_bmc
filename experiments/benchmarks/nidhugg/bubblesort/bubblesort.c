
#ifndef N
#  define N 3
#endif

// shared variables
atomic_int array[N];

void * onethread(void *arg)
{
  for (int i=0; i < N-1; i++) {
    int _array_i = atomic_load_explicit(&array[i], memory_order_relaxed);
    int _array_i_1 = atomic_load_explicit(&array[i+1], memory_order_relaxed);
    if (_array_i > _array_i_1) {
      atomic_store_explicit(&array[i], _array_i_1, memory_order_relaxed);
      atomic_store_explicit(&array[i+1], _array_i, memory_order_relaxed);

    }
  }

  return NULL;
}


