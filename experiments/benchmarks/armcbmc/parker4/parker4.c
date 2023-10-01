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
 
#  define N 4

/* Testing */
long global_cond; // Some global condition variable which the parker will wait for
long unparker_finished; // Flag indicating that the unparker thread has finished

/* Small low-level mutex implementation */
long x, y;

int lock(int id){
  if(id){
    atomic_store_explicit(&x, 1, memory_order_relaxed);
    if (atomic_load_explicit(&y, memory_order_relaxed) != 0)
    	return -1;
  }else{
    atomic_store_explicit(&y, 1, memory_order_relaxed);
    if (atomic_load_explicit(&x, memory_order_relaxed) != 0)
    	return -1;
  }
  return 0;
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
long  parker_counter;
long  parker_cond;

void parker_cond_signal(){
  atomic_store_explicit(&parker_cond, 0, memory_order_relaxed);
}

int parker_cond_wait(int id){
  atomic_store_explicit(&parker_cond, 1, memory_order_relaxed);
  unlock(id);
  assert(   !atomic_load_explicit(&unparker_finished, memory_order_relaxed)
         || atomic_load_explicit(&parker_cond, memory_order_relaxed) == 0); // Otherwise wait forever
  if (atomic_load_explicit(&parker_cond, memory_order_relaxed) != 0)
  	return -1;
  if (lock(id) == -1)
  	return -1;
  return 0;
}

int parker_unpark(){
  if (lock(0) == -1)
  	return -1;
  int s = atomic_load_explicit(&parker_counter, memory_order_relaxed);
  atomic_store_explicit(&parker_counter, 1, memory_order_relaxed);
  unlock(0);
  if(s < 1){
    parker_cond_signal();
  }
  return 0;
}

int parker_park(){
  if(atomic_load_explicit(&parker_counter, memory_order_relaxed) > 0){
    atomic_store_explicit(&parker_counter, 0, memory_order_relaxed);
    return 0;
  }
  if(trylock(1) != 0){
    return 0;
  }
  if(atomic_load_explicit(&parker_counter, memory_order_relaxed) > 0){
    atomic_store_explicit(&parker_counter, 0, memory_order_relaxed);
    unlock(1);
    return 0;
  }
  if (parker_cond_wait(1) == -1)
  	return -1;
  atomic_store_explicit(&parker_counter, 0, memory_order_relaxed);
  unlock(1);
  return 0;
}

/* Testing */

void *parker(void *_arg){
  for(int i = 0; !atomic_load_explicit(&global_cond, memory_order_relaxed); ++i){
    if (i < N)
    	if (parker_park() == -1)
    		return NULL;
  }
  
  return NULL;
}

void *unparker(void *_arg){
  if (parker_unpark() == -1)
  	return NULL;
  atomic_store_explicit(&global_cond, 1, memory_order_relaxed);

  if (parker_unpark() == -1)
  	return NULL;

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
