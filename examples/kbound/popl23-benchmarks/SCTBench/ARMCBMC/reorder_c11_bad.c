/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
#  define N 3
#endif
#ifndef CHECK
#  define CHECK 1
#endif
#define SET (N-1)

static long a[1], b[1];         // A workaround

static void *setThread(void *param) {
  atomic_store_explicit(&a[0], 1, memory_order_relaxed);
  atomic_store_explicit(&b[0], -1, memory_order_relaxed);

  return NULL;
}

static void *checkThread(void *param) {
  assert(   (atomic_load_explicit(&a[0], memory_order_relaxed) == 0 && atomic_load_explicit(&b[0], memory_order_relaxed) == 0)
         || (atomic_load_explicit(&a[0], memory_order_relaxed) == 1 && atomic_load_explicit(&b[0], memory_order_relaxed) == -1));

  return NULL;
}

int main(int argc, char *argv[]) {
  pthread_t setPool[SET];
  pthread_t checkPool[CHECK];

  unsigned i;
  for (i = 0; i < SET; i++)
    pthread_create(&setPool[i], NULL, &setThread, NULL);
  for (i = 0; i < CHECK; i++)
    pthread_create(&checkPool[i], NULL, &checkThread, NULL);

  for (i = 0; i < SET; i++)
    pthread_join(setPool[i], NULL);
  for (i = 0; i < CHECK; i++)
    pthread_join(checkPool[i], NULL);
}