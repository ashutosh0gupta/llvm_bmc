/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from the benchmark with the same name in
 the CAV'18 paper https://link.springer.com/chapter/10.1007/978-3-319-96142-2_22
 */

#include <assert.h>
#include <math.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../multiprodcon.c"

int main ()
{
  pthread_t t;
  int i;

  // we should have at least 2 workers
  assert (WORKERS >= 2);

  // launch the worker threads; thread i will work when workreq[i] >= 1, and
  // will increment workdon[i] when it finishes a task
  for (i = 0; i < WORKERS; i++)
  {
    pthread_mutex_init (mut + i, 0);
    atomic_init(&workreq[i], 0);
    atomic_init(&workdone[i], 0);
    pthread_create (&t, 0, worker, (void*) (long) i);
  }

  // launch the producer threads, which will build a shared buffer and
  pthread_mutex_init (&prodmut, 0);
  atomic_init(&prodbuff, 0);
  for (i = 0; i < PRODS; i++)
  {
    pthread_create (&t, 0, producer, (void*) (long) i);
  }

  pthread_exit (0);
}
