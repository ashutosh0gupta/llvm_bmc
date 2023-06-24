/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X0_1; 
int atom_1_X5_1; 
int atom_1_X8_1; 
int atom_1_X9_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  int v7_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v8_W6 = v7_W5 ^ v7_W5;
  int v9_W6 = v8_W6 + 1;
  atomic_store_explicit(&vars[0], v9_W6, memory_order_relaxed);
  int v12_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v32 = (v3_W0 == 1);
  atom_1_X0_1 = v32;
  int v33 = (v7_W5 == 1);
  atom_1_X5_1 = v33;
  int v34 = (v12_W8 == 1);
  atom_1_X8_1 = v34;
  int v35 = (v15_W9 == 1);
  atom_1_X9_1 = v35;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v19 = (v18 == 1);
  int v20 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atom_1_X0_1;
  int v23 = atom_1_X5_1;
  int v24 = atom_1_X8_1;
  int v25 = atom_1_X9_1;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v19 & v29_conj;
  int v31_conj = v17 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
