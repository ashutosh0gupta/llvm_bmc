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
atomic_int atom_0_X3_2; 
atomic_int atom_0_X5_0; 
atomic_int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W4 = v3_W3 ^ v3_W3;
  int v7_W5 = atomic_load_explicit(&vars[1+v4_W4], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v22 = (v3_W3 == 2);
  atomic_store_explicit(&atom_0_X3_2, v22, memory_order_seq_cst);
  int v23 = (v7_W5 == 0);
  atomic_store_explicit(&atom_0_X5_0, v23, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  dmbsy();
  int v10_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v10_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v24, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X3_2, 0); 
  atomic_init(&atom_0_X5_0, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v14 = (v13 == 2);
  int v15 = atomic_load_explicit(&atom_0_X3_2, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_0_X5_0, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  int v21_conj = v12 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
