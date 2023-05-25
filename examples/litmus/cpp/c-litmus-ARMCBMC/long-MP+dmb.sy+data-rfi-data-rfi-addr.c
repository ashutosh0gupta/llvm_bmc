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

atomic_long vars[4]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X4_1; 
atomic_long atom_1_X7_1; 
atomic_long atom_1_X9_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
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
  long v9_W5 = v8_W4 ^ v8_W4;
  long v10_W5 = v9_W5 + 1;
  atomic_store_explicit(&vars[3], v10_W5, memory_order_relaxed);
  long v13_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v14_W8 = v13_W7 ^ v13_W7;
  long v17_W9 = atomic_load_explicit(&vars[0+v14_W8], memory_order_relaxed);
  long v37 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v37, memory_order_seq_cst);
  long v38 = (v8_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v38, memory_order_seq_cst);
  long v39 = (v13_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v39, memory_order_seq_cst);
  long v40 = (v17_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v40, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v18 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v23 = (v22 == 1);
  long v24 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v25 = (v24 == 1);
  long v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  long v30_conj = v28 & v29;
  long v31_conj = v27 & v30_conj;
  long v32_conj = v26 & v31_conj;
  long v33_conj = v25 & v32_conj;
  long v34_conj = v23 & v33_conj;
  long v35_conj = v21 & v34_conj;
  long v36_conj = v19 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
