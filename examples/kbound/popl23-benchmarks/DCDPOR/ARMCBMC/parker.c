/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* A recreation of the bug
 * http://bugs.sun.com/view_bug.do?bug_id=6822370
 *
 * based on the description in
 * https://blogs.oracle.com/dave/entry/a_race_in_locksupport_park
 */


#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

void __VERIFIER_assume(int);

#ifndef N
#  warning "N not defined, assuming 8
#  define N 8
#endif

/* Testing */
atomic_int global_cond; // Some global condition variable which the parker will wait for
atomic_int unparker_finished; // Flag indicating that the unparker thread has finished

/* Small low-level mutex implementation */
atomic_int x, y;

void lock(int id){
  if(id){
    atomic_store_explicit(&x, 1, memory_order_relaxed);
    __VERIFIER_assume(atomic_load_explicit(&y, memory_order_relaxed) == 0);
  }else{
    atomic_store_explicit(&y, 1, memory_order_relaxed);
    __VERIFIER_assume(atomic_load_explicit(&x, memory_order_relaxed) == 0);
  }
}

void unlock(int id){
  if(id){
    atomic_store_explicit(&x, 0, memory_order_relaxed);
  }else{
    atomic_store_explicit(&y, 0, memory_order_relaxed);
  }
}

/* Returns 0 on success, nonzero on failure. */
int trylock(int id){
  if(id){
    atomic_store_explicit(&x, 1, memory_order_relaxed);

    if(atomic_load_explicit(&y, memory_order_relaxed) == 0){
      return 0;
    }else{
      atomic_store_explicit(&x, 0, memory_order_relaxed);

      return 1;
    }
  }else{
    atomic_store_explicit(&y, 1, memory_order_relaxed);

    if(atomic_load_explicit(&x, memory_order_relaxed) == 0){
      return 0;
    }else{
      atomic_store_explicit(&y, 0, memory_order_relaxed);

      return 1;
    }
  }
}

/* The parker */
atomic_int  parker_counter;
atomic_int  parker_cond;

void parker_cond_signal(){
  atomic_store_explicit(&parker_cond, 0, memory_order_relaxed);
}

void parker_cond_wait(int id){
  atomic_store_explicit(&parker_cond, 1, memory_order_relaxed);
  unlock(id);
  assert(!atomic_load_explicit(&unparker_finished, memory_order_relaxed)||
         atomic_load_explicit(&parker_cond, memory_order_relaxed) == 0); // Otherwise wait forever
  __VERIFIER_assume(atomic_load_explicit(&parker_cond, memory_order_relaxed) == 0);
  lock(id);
}

void parker_unpark(){
  lock(0);
  int s = atomic_load_explicit(&parker_counter, memory_order_relaxed);
  atomic_store_explicit(&parker_counter, 1, memory_order_relaxed);
  unlock(0);
  if(s < 1){
    parker_cond_signal();
  }
}

void parker_park(){
  if(atomic_load_explicit(&parker_counter, memory_order_relaxed) > 0){
    atomic_store_explicit(&parker_counter, 0, memory_order_relaxed);
    return;
  }
  if(trylock(1) != 0){
    return;
  }
  if(atomic_load_explicit(&parker_counter, memory_order_relaxed) > 0){
    atomic_store_explicit(&parker_counter, 0, memory_order_relaxed);
    unlock(1);
    return;
  }
  parker_cond_wait(1);
  atomic_store_explicit(&parker_counter, 0, memory_order_relaxed);
  unlock(1);
}

/* Testing */

void *parker(void *_arg){
  for(int i = 0; !atomic_load_explicit(&global_cond, memory_order_relaxed); ++i){
    __VERIFIER_assume(i < N);
    parker_park();
  }

  return NULL;
}

void *unparker(void *_arg){
  parker_unpark();
  atomic_store_explicit(&global_cond, 1, memory_order_relaxed);

  parker_unpark();

  // Done
  atomic_store_explicit(&unparker_finished, 1, memory_order_relaxed);

  return NULL;
}

int main(int argc, char *argv[]){
  atomic_init(&parker_counter, 0);
  atomic_init(&parker_cond, 0);
  atomic_init(&global_cond, 0);
  atomic_init(&unparker_finished, 0);
  atomic_init(&x, 0);
  atomic_init(&y, 0);

  pthread_t t1;
  pthread_create(&t1,NULL,parker,NULL);
  unparker(NULL);
  
  return 0;
}