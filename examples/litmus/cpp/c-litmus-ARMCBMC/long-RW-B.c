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

atomic_long vars[1]; 
atomic_long atom_0_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v5 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v5, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 

  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);

  pthread_join(thr0, NULL);

  long v4 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  if (v4 == 1) assert(0);
  return 0;
}
