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

atomic_long vars[3]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X6_2; 
atomic_long atom_1_X9_1; 

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
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  long v7_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v8_W7 = v7_W6 ^ v7_W6;
  long v9_W7 = v8_W7 + 1;
  atomic_store_explicit(&vars[0], v9_W7, memory_order_relaxed);
  long v12_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v27 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v27, memory_order_seq_cst);
  long v28 = (v7_W6 == 2);
  atomic_store_explicit(&atom_1_X6_2, v28, memory_order_seq_cst);
  long v29 = (v12_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v29, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X6_2, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 2);
  long v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v16 = (v15 == 1);
  long v17 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v18 = (v17 == 2);
  long v19 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X6_2, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  long v22_conj = v20 & v21;
  long v23_conj = v19 & v22_conj;
  long v24_conj = v18 & v23_conj;
  long v25_conj = v16 & v24_conj;
  long v26_conj = v14 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
