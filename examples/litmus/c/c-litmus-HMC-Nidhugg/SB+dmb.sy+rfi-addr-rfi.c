/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X2_0; 
int atom_1_X2_1; 
int atom_1_X6_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v22 = (v3_W2 == 0);
  atom_0_X2_0 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  atomic_store_explicit(&vars[0+v7_W3], 1, memory_order_relaxed);
  int v10_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v6_W2 == 1);
  atom_1_X2_1 = v23;
  int v24 = (v10_W6 == 1);
  atom_1_X6_1 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_0 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X6_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atom_0_X2_0;
  int v16 = atom_1_X2_1;
  int v17 = atom_1_X6_1;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  int v21_conj = v12 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
