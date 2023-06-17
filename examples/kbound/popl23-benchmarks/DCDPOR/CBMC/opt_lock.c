/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

#include <pthread.h>
#include <stdint.h>

#define T 2
#ifndef N
#  warning "N not defined, assuming 6"
#  define N 6
#endif

int x[1], y[1];

void *opt_lock(void *arg){
  int id = (intptr_t)arg;

  int i;
  for(i = 0; i<N; ++i){
    x[0] = id;
    y[0] = 1;

    if(x[0] == id){
      y[0];
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