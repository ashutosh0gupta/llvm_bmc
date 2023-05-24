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
atomic_long atom_1_X2_1; 
atomic_long atom_1_X3_2; 
atomic_long atom_1_X4_2; 
atomic_long atom_1_X7_1; 

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
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v12_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v13_W5 = v12_W4 ^ v12_W4;
  long v14_W5 = v13_W5 + 1;
  atomic_store_explicit(&vars[0], v14_W5, memory_order_relaxed);
  long v17_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v33 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v33, memory_order_seq_cst);
  long v34 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v34, memory_order_seq_cst);
  long v35 = (v9_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v35, memory_order_seq_cst);
  long v36 = (v12_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v36, memory_order_seq_cst);
  long v37 = (v17_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v37, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X4_2, 0); 
  atomic_init(&atom_1_X7_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v18 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v19 = (v18 == 2);
  long v20 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v21 = (v20 == 2);
  long v22 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  long v27_conj = v25 & v26;
  long v28_conj = v24 & v27_conj;
  long v29_conj = v23 & v28_conj;
  long v30_conj = v22 & v29_conj;
  long v31_conj = v21 & v30_conj;
  long v32_conj = v19 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
