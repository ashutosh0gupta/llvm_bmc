/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Get inspiration from the BubbleSort example in Tables 1 and 2 in the PLDI 2015 paper:
 https://dl.acm.org/citation.cfm?id=2737975
 */

/* This benchmark is buggy in the sense that it is missing synchronization */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
#  define N 3
#endif

// shared variables
long array[N];		// A workaround

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

int main(int argc, char **argv)
{
  pthread_t threads[N];

  for (int i=0; i<N; i++) {
    atomic_init(&array[i], N-i);
  }

  for (int i = 0; i < N; i++) {
    pthread_create(&threads[i], 0, onethread, NULL);
  }

  for (int i = 0; i < N; i++) {
    pthread_join(threads[i], 0);
  }

  for (int i = 0; i<N-1; i++) {
    int _array_m_1 = atomic_load_explicit(&array[i+1], memory_order_relaxed);
    int _array_m = atomic_load_explicit(&array[i], memory_order_relaxed);
    assert(_array_m <= _array_m_1);
  }

  return 0;
}
