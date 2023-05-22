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
atomic_int atom_0_X6_2; 
atomic_int atom_1_X5_2; 
atomic_int atom_1_X4_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W4 = v3_W2 ^ v3_W2;
  int v5_W4 = v4_W4 + 1;
  atomic_store_explicit(&vars[2], v5_W4, memory_order_release);
  int v8_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v26 = (v8_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v26, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v11_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v14_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v14_W5 == 2);
  atomic_store_explicit(&atom_1_X5_2, v27, memory_order_seq_cst);
  int v28 = (v11_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v28, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_2, 0); 
  atomic_init(&atom_1_X5_2, 0); 
  atomic_init(&atom_1_X4_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X5_2, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
