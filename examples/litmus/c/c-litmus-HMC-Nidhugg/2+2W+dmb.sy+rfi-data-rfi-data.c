/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X2_2; 
int atom_1_X5_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v5_W3 = v4_W3 + 1;
  atomic_store_explicit(&vars[2], v5_W3, memory_order_relaxed);
  int v8_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W6 = v8_W5 ^ v8_W5;
  int v10_W6 = v9_W6 + 1;
  atomic_store_explicit(&vars[0], v10_W6, memory_order_relaxed);
  int v23 = (v3_W2 == 2);
  atom_1_X2_2 = v23;
  int v24 = (v8_W5 == 1);
  atom_1_X5_1 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X2_2 = 0; 
  atom_1_X5_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v14 = (v13 == 2);
  int v15 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atom_1_X2_2;
  int v18 = atom_1_X5_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v14 & v20_conj;
  int v22_conj = v12 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
