/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_1_X0_1; 
int atom_1_X5_1; 
int atom_1_X9_1; 
int atom_1_X11_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
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
  atomic_store_explicit(&vars[3+v8_W6], 1, memory_order_relaxed);
  int v11_W9 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v12_W10 = v11_W9 ^ v11_W9;
  int v15_W11 = atomic_load_explicit(&vars[0+v12_W10], memory_order_relaxed);
  int v35 = (v3_W0 == 1);
  atom_1_X0_1 = v35;
  int v36 = (v7_W5 == 1);
  atom_1_X5_1 = v36;
  int v37 = (v11_W9 == 1);
  atom_1_X9_1 = v37;
  int v38 = (v15_W11 == 0);
  atom_1_X11_0 = v38;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X9_1 = 0; 
  atom_1_X11_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v18 == 1);
  int v20 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atom_1_X0_1;
  int v25 = atom_1_X5_1;
  int v26 = atom_1_X9_1;
  int v27 = atom_1_X11_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v23 & v30_conj;
  int v32_conj = v21 & v31_conj;
  int v33_conj = v19 & v32_conj;
  int v34_conj = v17 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
