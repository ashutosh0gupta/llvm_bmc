/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>

#include <pthread.h>
#include <stdatomic.h>
// Memory barriers
void dmbld();
void dmbst();
void dmbsy();
void isb();

atomic_int vars[1]; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 

  atomic_init(&vars[0], 0);

  pthread_create(&thr0, NULL, t0, NULL);

  pthread_join(thr0, NULL);

  int v1 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v2 = (v1 == 2);
  if (v2 == 1) assert(0);
  return 0;
}
