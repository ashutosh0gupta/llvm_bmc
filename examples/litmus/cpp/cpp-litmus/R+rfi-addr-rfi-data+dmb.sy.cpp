/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

// Memory barriers
void dmbsy();
void dmbst();
void dmbld();
void isb();

atomic_int vars[3]; 
atomic_int atom_0_X2_1; 
atomic_int atom_0_X6_1; 
atomic_int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  atomic_store_explicit(&vars[1+v4_W3], 1, memory_order_relaxed);
  int v7_W6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8_W7 = v7_W6 ^ v7_W6;
  int v9_W7 = v8_W7 + 1;
  atomic_store_explicit(&vars[2], v9_W7, memory_order_relaxed);
  int v27 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v27, memory_order_seq_cst);
  int v28 = (v7_W6 == 1);
  atomic_store_explicit(&atom_0_X6_1, v28, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  int v12_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v29 = (v12_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v29, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_0_X6_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_0_X6_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  int v26_conj = v14 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}