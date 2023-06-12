/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

#include <pthread.h>
#include <assert.h>

#ifndef N
#  define N 3
#endif
#ifndef CHECK
#  define CHECK 1
#endif
#define SET (N-1)

static int a[1], b[1];

static void *setThread(void *param) {
  a[0] = 1;
  b[0] = -1;

  return NULL;
}

static void *checkThread(void *param) {
  assert(   (a[0] == 0 && b[0] == 0)
         || (a[0] == 1 && b[0] == -1));

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
