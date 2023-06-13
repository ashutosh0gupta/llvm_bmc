/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from the benchmark with the same name in
 the CAV'18 paper https://link.springer.com/chapter/10.1007/978-3-319-96142-2_22
 */

#include <assert.h>
#include <math.h>
#include <pthread.h>

#ifndef N
#  warning "N not defined, assuming 4"
#  define N 4
#endif

// default values for the parameters
#define PARAM1 N
#define PARAM2 N

#define TASKS   2      // maximum number of tasks processed by a worker
#define PRODS   PARAM1 // number of producers
#define ITERS   1      // number of iterations that producers make before producing a number
#define WORKERS PARAM2 // number of worker threads

pthread_mutex_t mut[WORKERS];
int workreq[WORKERS];
int workdone[WORKERS];
pthread_mutex_t prodmut;
int prodbuff;

void *worker (void *arg)
{
  unsigned id = (unsigned long) arg;
  int i, havework;

  havework = 0;
  for (i = 0; i < TASKS; i++)
  {
    pthread_mutex_lock (mut + id);

    // if I have a task, perform it, decrementing the counter
    if (workreq[id])
    {
      int tmp = workreq[id];
      workreq[id] = tmp - 1;
      havework = 1;
    }

    pthread_mutex_unlock (mut + id);

    // work is done here
    if (havework)
    {
      int tmp = workdone[id];
      workdone[id] = tmp + 1;
      havework = 0;
    }
  }
  return 0;
}

void *producer (void *arg)
{
  unsigned dst, i, tmp;
  unsigned id = (unsigned long) arg;

  assert (id < PRODS);

  // The producer threads collaboratively construct a number in base PRODS that
  // have ITERS*PRODS digits. Each producer adds ITERS digits to the number.
  // The number is stored in prodbuff, it is initially 0, and each producer
  // adds a digit to the end. In the end, tmp stores a slightly different
  // number for each producer
  for (i = 0; i < ITERS; i ++)
  {
    pthread_mutex_lock (&prodmut);
    int mytmp = prodbuff;
    prodbuff = mytmp * PRODS + id; // add a digit
    tmp = prodbuff;
    pthread_mutex_unlock (&prodmut);
  }

  // each number constructed by a producer must be within range
  assert (tmp <= pow (PRODS, ITERS*PRODS));

  // depending on the constructed number, which simulates some sort of thread
  // affinity, we send work to one worker thread dst
  dst = tmp % WORKERS;

  // sending work
  pthread_mutex_lock (mut + dst);
  int mytmp = workreq[dst];
  workreq[dst] = mytmp + 1;
  pthread_mutex_unlock (mut + dst);

  return 0;
}

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
    workreq[i] = 0;
    workdone[i] = 0;
    pthread_create (&t, 0, worker, (void*) (long) i);
  }

  // launch the producer threads, which will build a shared buffer and
  pthread_mutex_init (&prodmut, 0);
  prodbuff = 0;
  for (i = 0; i < PRODS; i++)
  {
    pthread_create (&t, 0, producer, (void*) (long) i);
  }

  pthread_exit (0);
}