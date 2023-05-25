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

atomic_int vars[2]; 
atomic_int atom_1_X2_2; 
atomic_int atom_1_X3_2; 
atomic_int atom_1_X5_0; 
atomic_int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W4 = v6_W3 ^ v6_W3;
  int v10_W5 = atomic_load_explicit(&vars[0+v7_W4], memory_order_relaxed);
  int v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v27, memory_order_seq_cst);
  int v28 = (v6_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v28, memory_order_seq_cst);
  int v29 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v29, memory_order_seq_cst);
  int v30 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v30, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v15 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
