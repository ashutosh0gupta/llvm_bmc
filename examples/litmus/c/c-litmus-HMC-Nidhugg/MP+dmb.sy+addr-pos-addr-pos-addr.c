/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_1_X0_1; 
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
  int v10_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11_W6 = v10_W5 ^ v10_W5;
  int v14_W7 = atomic_load_explicit(&vars[3+v11_W6], memory_order_relaxed);
  int v17_W9 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v18_W10 = v17_W9 ^ v17_W9;
  int v21_W11 = atomic_load_explicit(&vars[0+v18_W10], memory_order_relaxed);
  int v31 = (v3_W0 == 1);
  atom_1_X0_1 = v31;
  int v32 = (v21_W11 == 0);
  atom_1_X11_0 = v32;
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
  atom_1_X11_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v22 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v25 = (v24 == 1);
  int v26 = atom_1_X0_1;
  int v27 = atom_1_X11_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v23 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}