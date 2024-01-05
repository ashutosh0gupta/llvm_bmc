

#ifndef N
#  define N 5
#endif

// shared variables
atomic_int array[N];      // A workaround
atomic_int array_index;   // A workaround

void *thread(void *arg) {
  atomic_store_explicit(&array[atomic_load(&array_index)], 1, memory_order_relaxed);

  return NULL;
}


