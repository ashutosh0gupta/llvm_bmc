/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* This is program circular_buffer_ok.c from SCTBench
 *   https://github.com/mc-imperial/sctbench
 * It has been modified to be parametric on N from the command line
 * and to compile without warnings.
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "./circular_buffer.c"

int main(int argc, char *argv[]) {

  pthread_t id1, id2;

  pthread_mutex_init(&m, 0);

  initLog(10);
  atomic_init(&send, TRUE);
  atomic_init(&receive,FALSE);

  pthread_create(&id1, NULL, t1, NULL);
  pthread_create(&id2, NULL, t2, NULL);

  pthread_join(id1, NULL);
  pthread_join(id2, NULL);

  return 0;
}
