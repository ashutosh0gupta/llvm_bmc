
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
#  define N 1
#endif

#define PARAM1 N
#define PARAM2 N
#define K 1  // nunmber of iterations

pthread_mutex_t ma[N];
atomic_int a[N];
pthread_mutex_t mi;
atomic_int i;
atomic_int d;

// chooses a number i
void *choice(void *arg)
{
  int x;
  for (x = 1; x < N; x++)
  {
    pthread_mutex_lock(&mi);
    atomic_store_explicit(&i, x, memory_order_relaxed);
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
  atomic_store_explicit(&a[id], 1, memory_order_relaxed);
  pthread_mutex_unlock(&ma[id]);

  return 0;
}

// reader thread to a
void *ra(void *arg)
{
  // get the tid to poke
  int idx = 0;
  pthread_mutex_lock(&mi);
  idx = atomic_load_explicit(&i, memory_order_relaxed);
  pthread_mutex_unlock(&mi);

  // poke it!
  pthread_mutex_lock(&ma[idx]);
  // if the thread is done, increment d
  // note that although we will create
  // multiple ra's, they will never be
  // concurrent. thus there is no data race on d.
  if (atomic_load_explicit(&a[idx], memory_order_relaxed) == 1)
  {
    int tmp = atomic_load_explicit(&d, memory_order_relaxed);
    atomic_store_explicit(&d, tmp + 1, memory_order_relaxed);
    atomic_store_explicit(&a[idx], 0, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ma[idx]);

  return 0;
}

