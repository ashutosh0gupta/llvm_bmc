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

void __VERIFIER_assume(int);

#ifndef N
#  warning "N not defined, assuming 8
#  define N 8
#endif

/* Testing */
int global_cond; // Some global condition variable which the parker will wait for
int unparker_finished; // Flag indicating that the unparker thread has finished

/* Small low-level mutex implementation */
int x, y;

void lock(int id){
  if(id){
    x = 1;
    __VERIFIER_assume(y == 0);
  }else{
    y = 1;
    __VERIFIER_assume(x == 0);
  }
}

void unlock(int id){
  if(id){
    x = 0;
  }else{
    y = 0;
  }
}

/* Returns 0 on success, nonzero on failure. */
int trylock(int id){
  if(id){
    x = 1;

    if(y == 0){
      return 0;
    }else{
      x = 0;

      return 1;
    }
  }else{
    y = 1;

    if(x == 0){
      return 0;
    }else{
      y = 0;
      return 1;
    }
  }
}

/* The parker */
int  parker_counter;
int  parker_cond;

void parker_cond_signal(){
  parker_cond = 0;
}

void parker_cond_wait(int id){
  parker_cond = 1;
  unlock(id);
  assert(!unparker_finished|| parker_cond == 0); // Otherwise wait forever
  __VERIFIER_assume(parker_cond == 0);
  lock(id);
}

void parker_unpark(){
  lock(0);
  int s = parker_counter;
  parker_counter = 1;
  unlock(0);
  if(s < 1){
    parker_cond_signal();
  }
}

void parker_park(){
  if(parker_counter > 0){
    parker_counter = 0;
    return;
  }
  if(trylock(1) != 0){
    return;
  }
  if(parker_counter > 0){
    parker_counter = 0;
    unlock(1);
    return;
  }
  parker_cond_wait(1);
  parker_counter = 0;
  unlock(1);
}

/* Testing */

void *parker(void *_arg){
  int i;
  for(i = 0; !global_cond; ++i){
    __VERIFIER_assume(i < N);
    parker_park();
  }

  return NULL;
}

void *unparker(void *_arg){
  parker_unpark();
  global_cond = 1;

  parker_unpark();

  // Done
  unparker_finished = 1;

  return NULL;
}

int main(int argc, char *argv[]){
  parker_counter = 0;
  parker_cond = 0;
  global_cond = 0;
  unparker_finished = 0;
  x = 0;
  y = 0;

  pthread_t t1;
  pthread_create(&t1,NULL,parker,NULL);
  unparker(NULL);
  
  return 0;
}