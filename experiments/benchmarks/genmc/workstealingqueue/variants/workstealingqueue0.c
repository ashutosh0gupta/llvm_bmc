/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/blob/main/c/pthread-complex/workstealqueue_mutex-1.c */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdio.h>  // For _Bool

#include "../workstealingqueue.c"

Obj items[nItems];

int main(void) {
  int i;
  pthread_t handles[nStealers];

  pthread_mutex_init(&lock, NULL);
  Init_WorkStealQueue(INITQSIZE);

  for (i = 0; i < nItems; i++) {
    Init_ObjType(&items[i]);
  }

  for (i = 0; i < nStealers; i++) {
    pthread_create(&handles[i], NULL, Stealer, 0);
  }

  for (i = 0; i < nItems / 2; i++) {
    Push(&items[2 * i]);
    Push(&items[2 * i + 1]);
    Obj *r;
    if (Pop(&r)) {
      Operation(r);
    }
  }

  for (i = 0; i < nItems / 2; i++) {
    Obj *r;
    if (Pop(&r)) {
      Operation(r);
    }
  }

  for (i = 0; i < nStealers; i++) {
    pthread_join(handles[i], NULL);
  }

  for (i = 0; i < nItems; i++) {
    Check(&items[i]);
  }

  return 0;
}
