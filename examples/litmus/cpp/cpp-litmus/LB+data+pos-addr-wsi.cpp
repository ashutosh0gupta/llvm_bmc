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
atomic_int atom_0_X0_2; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X2_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  int v24 = (v3_W0 == 2);
  atomic_store_explicit(&atom_0_X0_2, v24, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12_W3 = v11_W2 ^ v11_W2;
  atomic_store_explicit(&vars[0+v12_W3], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v25 = (v8_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v25, memory_order_seq_cst);
  int v26 = (v11_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v26, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_2, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v14 = (v13 == 2);
  int v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&atom_0_X0_2, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  int v23_conj = v14 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
