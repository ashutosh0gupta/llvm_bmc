/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

#include <pthread.h>
#include <stdint.h>
#include <stdatomic.h>

#define T 2
#ifndef N
#  warning "N not defined, assuming 6"
#  define N 6
#endif

long x[1], y[1];   // A workaround

void *opt_lock(void *arg){
  int id = (intptr_t)arg;

  int i;
  for(i = 0; i<N; ++i){
    atomic_store_explicit(&x[0], id, memory_order_relaxed);
    atomic_store_explicit(&y[0], 1, memory_order_relaxed);

    if(atomic_load_explicit(&x[0], memory_order_relaxed) == id){
      atomic_load_explicit(&y[0], memory_order_relaxed);
      break;
    }
  }

  return NULL;
}

int main(int argc, char *argv[]){
  int i;
  pthread_t threads[T+1];

  for(i=0; i<T; i++){
    pthread_create(&threads[i],NULL,opt_lock,(void*)(intptr_t)i);
  }
  return 0;
}