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

#define RW_LOCK_BIAS            0x00100000
#define WRITE_LOCK_CMP          RW_LOCK_BIAS

typedef union {
  long lock;            // A workaround
} rwlock_t;

rwlock_t mylock;
long var;               // A workaround


static inline int write_trylock(rwlock_t *rw)
{
  int priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_relaxed);

  if (priorvalue == RW_LOCK_BIAS)
    return 1;

  atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_relaxed);
  return 0;
}


static inline void write_unlock(rwlock_t *rw)
{
  atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_relaxed);
}


void * a(void *obj) {
  // parameterized code
  int i;
  for(i = 0; i < N; i++) {
    if (write_trylock(&mylock)) {
      // critical section
      atomic_store_explicit(&var, 1, memory_order_relaxed);
      assert(atomic_load_explicit(&var, memory_order_relaxed) == 1);
      write_unlock(&mylock);
    }
  }
  return NULL;
}

void * b(void *obj) {
  // parameterized code
  for(int i = 0; i < N; i++) {
    if (write_trylock(&mylock)) {
      // critical section
      atomic_store_explicit(&var, 2, memory_order_relaxed);
      assert(atomic_load_explicit(&var, memory_order_relaxed) == 2);
      write_unlock(&mylock);
    }
  }
  return NULL;
}


int main(int argc, char **argv)
{
  pthread_t t1, t2;
  atomic_init(&mylock.lock, RW_LOCK_BIAS);
  atomic_init(&var, 0);

  pthread_create(&t1, 0, &a, NULL);
  pthread_create(&t2, 0, &b, NULL);

  pthread_join(t1, 0);
  pthread_join(t2, 0);

  return 0;
}