/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from the benchmark with the same name in
 the OOPSLA'15 paper http://plrg.eecs.uci.edu/satcheck/
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdbool.h> // For bool

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

typedef union {
  long lock;        // A workaround
} lock_t;

lock_t mylock;
long var;           // A workaround

static inline bool write_trylock(lock_t *rw) {
  int oldvalue=0;
  return atomic_compare_exchange_strong_explicit(&rw->lock,
                                                 &oldvalue,
                                                 1,
                                                 memory_order_relaxed,
                                                 memory_order_relaxed);
}


static inline void write_unlock(lock_t *rw)
{
  atomic_store_explicit(&rw->lock, 0, memory_order_relaxed);
}


static void fooa() {
  bool flag=write_trylock(&mylock);
  if (flag) {
    // critical section
    atomic_store_explicit(&var, 1, memory_order_relaxed);
    assert(atomic_load_explicit(&var, memory_order_relaxed) == 1);
    write_unlock(&mylock);
  }
}

static void foob() {
  bool flag=write_trylock(&mylock);
  if (flag) {
    // critical section
    atomic_store_explicit(&var, 2, memory_order_relaxed);
    assert(atomic_load_explicit(&var, memory_order_relaxed) == 2);
    write_unlock(&mylock);
  }
}

void * a(void *obj)
{
  // parameterized code
  int i;
  for(i = 0; i < N; i++) {
    fooa();
  }

  return NULL;
}

void * b(void *obj)
{
  // parameterized code
  int i;
  for(i = 0; i < N; i++) {
    foob();
  }

  return NULL;
}

int main(int argc, char **argv)
{
  pthread_t t1, t2;
  atomic_init(&mylock.lock, 0);
  atomic_init(&var, 0);

  pthread_create(&t1, 0, a, NULL);
  pthread_create(&t2, 0, b, NULL);

  pthread_join(t1, 0);
  pthread_join(t2, 0);

  return 0;
}