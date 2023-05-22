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

atomic_int vars[3]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X4_1; 
atomic_int atom_1_X5_1; 
atomic_int atom_1_X7_0; 
atomic_int atom_1_X9_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[2], v5_W2, memory_order_relaxed);
  int v8_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12_W6 = v11_W5 ^ v11_W5;
  int v15_W7 = atomic_load_explicit(&vars[0+v12_W6], memory_order_relaxed);
  int v18_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v37 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v37, memory_order_seq_cst);
  int v38 = (v8_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v38, memory_order_seq_cst);
  int v39 = (v11_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v39, memory_order_seq_cst);
  int v40 = (v15_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v40, memory_order_seq_cst);
  int v41 = (v18_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v41, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v24 = (v23 == 1);
  int v25 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v29 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v24 & v33_conj;
  int v35_conj = v22 & v34_conj;
  int v36_conj = v20 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
