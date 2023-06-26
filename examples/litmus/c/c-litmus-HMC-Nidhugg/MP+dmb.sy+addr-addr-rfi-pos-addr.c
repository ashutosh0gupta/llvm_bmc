/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_1_X0_1; 
int atom_1_X8_1; 
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
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  int v8_W5 = v7_W3 ^ v7_W3;
  atomic_store_explicit(&vars[3+v8_W5], 1, memory_order_relaxed);
  int v11_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v14_W9 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v15_W10 = v14_W9 ^ v14_W9;
  int v18_W11 = atomic_load_explicit(&vars[0+v15_W10], memory_order_relaxed);
  int v35 = (v3_W0 == 1);
  atom_1_X0_1 = v35;
  int v36 = (v11_W8 == 1);
  atom_1_X8_1 = v36;
  int v37 = (v14_W9 == 1);
  atom_1_X9_1 = v37;
  int v38 = (v18_W11 == 0);
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
  atom_1_X8_1 = 0; 
  atom_1_X9_1 = 0; 
  atom_1_X11_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v24 = (v23 == 1);
  int v25 = atom_1_X0_1;
  int v26 = atom_1_X8_1;
  int v27 = atom_1_X9_1;
  int v28 = atom_1_X11_0;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v22 & v32_conj;
  int v34_conj = v20 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
