/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from the benchmark with the same name in
 the CAV'18 paper https://link.springer.com/chapter/10.1007/978-3-319-96142-2_22
 */

#include <assert.h>
#include <pthread.h>

/*
 This benchmark simulates a system that
 continuously and non-deterministically
 pokes a thread pool of workers to identify
 workers that are free to be assigned tasks.

 The main function spawns a set of work
 threads that can be busy or not.
 This is simulated by a thread wa that acts
 as a representative of a work thread and
 signals via a channel *a* that it is free
 to work.

 Then, it will for K iterations poke the
 thread pool non-determistically to gather
 the number of free threads.

 Thus, the maximum number of free threads
 is automatically bounded by K.

 For a fixed K (e.g. K 1) and an
 increasing N, we obtain an exponential
 number of SSBs in nidhugg.

 For a fixed N > 1 (e.g. N 2) and
 an increasing K, we obtain almost
 the same number of maximal configurations
 as SSBs in nidhugg.
 */

#ifndef N
#  warning "N not defined, assuming 4"
#  define N 4
#endif

#define PARAM1 N
#define PARAM2 N
#define K 4  // nunmber of iterations

pthread_mutex_t ma[N];
int a[N];
pthread_mutex_t mi;
int i;
int d;

// chooses a number i
void *choice(void *arg)
{
  int x;
  for (x = 1; x < N; x++)
  {
    pthread_mutex_lock(&mi);
    i = x;
    pthread_mutex_unlock(&mi);
  }
  return 0;
}

// writer thread to a
void *wa(void *arg)
{
  unsigned id = (unsigned long) arg;
  pthread_mutex_lock(&ma[id]);
  // Does some work and signals that it is done
  a[id] = 1;
  pthread_mutex_unlock(&ma[id]);

  return 0;
}

// reader thread to a
void *ra(void *arg)
{
  // get the tid to poke
  int idx = 0;
  pthread_mutex_lock(&mi);
  idx = i;
  pthread_mutex_unlock(&mi);

  // poke it!
  pthread_mutex_lock(&ma[idx]);
  // if the thread is done, increment d
  // note that although we will create
  // multiple ra's, they will never be
  // concurrent. thus there is no data race on d.
  if (a[idx] == 1)
  {
    int tmp = d;
    d = tmp + 1;
    a[idx] = 0;
  }
  pthread_mutex_unlock(&ma[idx]);

  return 0;
}

int main()
{
  pthread_t idk;
  pthread_t idr;
  pthread_t idw[N];

  pthread_mutex_init(&mi, NULL);

  i = 0;
  d = 0;

  // spawn the write threads
  int x;
  for (x = 0; x < N; x++)
  {
    // initialize the array index
    a[x] = 0;
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

  assert (d >= 0);
  assert (d <= N);

  // join the writer threads
  for (x = 0; x < N; x++)
    pthread_join(idw[x],NULL);

  // assert that d equals to the number of threads that finished before the
  // poking thread checked
  for (x = 0; x < N; x++)
    if (a[x]) {
      int tmp = d;
      d = tmp + 1;
    }
  assert (d == N);

  return 0;
}