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

atomic_long vars[2]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X4_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[0], v5_W2, memory_order_relaxed);
  long v8_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v18 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v18, memory_order_seq_cst);
  long v19 = (v8_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v19, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v9 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v10 = (v9 == 2);
  long v11 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v12 = (v11 == 1);
  long v13 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v14 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v15_conj = v13 & v14;
  long v16_conj = v12 & v15_conj;
  long v17_conj = v10 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
