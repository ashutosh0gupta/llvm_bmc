/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from the benchmark with the same name in
 the CAV'18 paper https://link.springer.com/chapter/10.1007/978-3-319-96142-2_22
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../poke.c"

int main()
{
  pthread_t idk;
  pthread_t idr;
  pthread_t idw[N];

  pthread_mutex_init(&mi, NULL);

  atomic_init(&i, 0);
  atomic_init(&d, 0);

  // spawn the write threads
  int x;
  for (x = 0; x < N; x++)
  {
    // initialize the array index
    atomic_init(&a[x], 0);
    // initialize the mutex
    pthread_mutex_init(&ma[x], NULL);
    // spawn the writer a[x]
    pthread_create(&idw[x], NULL, wa, (void*) (long) x);
  }

  // lets find out in K iterations
  // how many elements have been initialized
  // by poking one thread non-deterministically
  // per iteration.
  for (x = 0; x < K; x++)
  {
    // spawn the counter
    pthread_create(&idk, NULL, choice, NULL);
    // spawn the poke thread
    pthread_create(&idr, NULL, ra, NULL);
    // join the threads
    pthread_join(idk, NULL);
    pthread_join(idr, NULL);
  }

  assert (atomic_load_explicit(&d, memory_order_relaxed) >= 0);
  assert (atomic_load_explicit(&d, memory_order_relaxed) <= N);

  // join the writer threads
  for (x = 0; x < N; x++)
    pthread_join(idw[x],NULL);

  // assert that d equals to the number of threads that finished before the
  // poking thread checked
  for (x = 0; x < N; x++)
    if (atomic_load_explicit(&a[x], memory_order_relaxed)) {
      int tmp = atomic_load_explicit(&d, memory_order_relaxed);
      atomic_store_explicit(&d, tmp + 1, memory_order_relaxed);
    }
  assert (atomic_load_explicit(&d, memory_order_relaxed) == N);

  return 0;
}
