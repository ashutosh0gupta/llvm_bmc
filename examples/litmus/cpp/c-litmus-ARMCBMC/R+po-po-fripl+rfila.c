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
atomic_int atom_0_X6_2; 
atomic_int atom_0_X4_0; 
atomic_int atom_1_X3_3; 
atomic_int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v3_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v6_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v26 = (v6_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v26, memory_order_seq_cst);
  int v27 = (v3_W4 == 0);
  atomic_store_explicit(&atom_0_X4_0, v27, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v9_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v12_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v12_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v28, memory_order_seq_cst);
  int v29 = (v9_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v29, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_2, 0); 
  atomic_init(&atom_0_X4_0, 0); 
  atomic_init(&atom_1_X3_3, 0); 
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v14 = (v13 == 3);
  int v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_0_X4_0, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
