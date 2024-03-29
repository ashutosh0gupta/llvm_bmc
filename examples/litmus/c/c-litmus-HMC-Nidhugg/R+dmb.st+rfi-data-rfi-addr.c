/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X2_2; 
int atom_1_X5_1; 
int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
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
  int v12_W7 = atomic_load_explicit(&vars[0+v9_W6], memory_order_relaxed);
  int v27 = (v3_W2 == 2);
  atom_1_X2_2 = v27;
  int v28 = (v8_W5 == 1);
  atom_1_X5_1 = v28;
  int v29 = (v12_W7 == 0);
  atom_1_X7_0 = v29;
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
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atom_1_X2_2;
  int v20 = atom_1_X5_1;
  int v21 = atom_1_X7_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  int v26_conj = v14 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
