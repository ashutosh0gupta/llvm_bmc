/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X2_1; 
int atom_0_X3_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7_W4 = v6_W3 ^ v6_W3;
  int v10_W5 = atomic_load_explicit(&vars[1+v7_W4], memory_order_relaxed);
  int v11_W7 = v10_W5 ^ v10_W5;
  atomic_store_explicit(&vars[2+v11_W7], 1, memory_order_relaxed);
  int v26 = (v3_W2 == 1);
  atom_0_X2_1 = v26;
  int v27 = (v6_W3 == 1);
  atom_0_X3_1 = v27;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  int v14_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v14_W2 == 0);
  atom_1_X2_0 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_1 = 0; 
  atom_0_X3_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atom_0_X2_1;
  int v20 = atom_0_X3_1;
  int v21 = atom_1_X2_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
