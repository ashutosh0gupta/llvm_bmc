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
atomic_long atom_0_X0_2; 
atomic_long atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  long v19 = (v3_W0 == 2);
  atomic_store_explicit(&atom_0_X0_2, v19, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W2 = v8_W0 ^ v8_W0;
  atomic_store_explicit(&vars[0+v9_W2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  long v20 = (v8_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v20, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_2, 0); 
  atomic_init(&atom_1_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v10 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v11 = (v10 == 2);
  long v12 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v13 = (v12 == 1);
  long v14 = atomic_load_explicit(&atom_0_X0_2, memory_order_seq_cst);
  long v15 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v16_conj = v14 & v15;
  long v17_conj = v13 & v16_conj;
  long v18_conj = v11 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
