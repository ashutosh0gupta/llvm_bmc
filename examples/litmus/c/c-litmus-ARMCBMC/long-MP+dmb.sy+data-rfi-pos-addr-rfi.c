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
atomic_long atom_1_X4_1; 
atomic_long atom_1_X5_1; 
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
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[2], v5_W2, memory_order_relaxed);
  long v8_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v11_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v12_W6 = v11_W5 ^ v11_W5;
  atomic_store_explicit(&vars[0+v12_W6], 1, memory_order_relaxed);
  long v15_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v32 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v32, memory_order_seq_cst);
  long v33 = (v8_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v33, memory_order_seq_cst);
  long v34 = (v11_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v34, memory_order_seq_cst);
  long v35 = (v15_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v35, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  long v26_conj = v24 & v25;
  long v27_conj = v23 & v26_conj;
  long v28_conj = v22 & v27_conj;
  long v29_conj = v21 & v28_conj;
  long v30_conj = v19 & v29_conj;
  long v31_conj = v17 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
