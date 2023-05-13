/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

// Memory barriers
void dmbsy();
void dmbst();
void dmbld();
void isb();

atomic_int vars[1]; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 

  atomic_init(&vars[0], 0);

  pthread_create(&thr0, t0, NULL);

  pthread_join(thr0, NULL);

  int v1 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v2 = (v1 == 1);
  if (v2 == 1) assert(0);
  return 0;
}
