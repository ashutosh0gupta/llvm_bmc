/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Get inspiration from the BubbleSort example in Tables 1 and 2 in the PLDI 2015 paper:
 https://dl.acm.org/citation.cfm?id=2737975
 */

/* This benchmark is buggy in the sense that it is missing synchronization */

#include <assert.h>
#include <pthread.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

// shared variables
int array[N];

void * onethread(void *arg)
{
  int i;
  for (i=0; i < N-1; i++) {
    int _array_i = array[i];
    int _array_i_1 = array[i+1];
    if (_array_i > _array_i_1) {
      array[i] = _array_i_1;
      array[i+1] = _array_i;
    }
  }

  return NULL;
}

int main(int argc, char **argv)
{
  pthread_t threads[N];

  int i;
  for (i=0; i<N; i++) {
    array[i] = N-i;
  }

  for (i = 0; i < N; i++) {
    pthread_create(&threads[i], 0, onethread, NULL);
  }

  for (i = 0; i < N; i++) {
    pthread_join(threads[i], 0);
  }

  for (i = 0; i<N-1; i++) {
    int _array_m_1 = array[i+1];
    int _array_m = array[i];
    assert(_array_m <= _array_m_1);
  }

  return 0;
}