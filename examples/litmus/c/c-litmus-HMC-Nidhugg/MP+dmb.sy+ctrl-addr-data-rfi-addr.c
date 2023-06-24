/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[5]; 
int atom_1_X0_1; 
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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = atomic_load_explicit(&vars[3+v7_W4], memory_order_relaxed);
  int v11_W7 = v10_W5 ^ v10_W5;
  int v12_W7 = v11_W7 + 1;
  atomic_store_explicit(&vars[4], v12_W7, memory_order_relaxed);
  int v15_W9 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v16_W10 = v15_W9 ^ v15_W9;
  int v19_W11 = atomic_load_explicit(&vars[0+v16_W10], memory_order_relaxed);
  int v34 = (v3_W0 == 1);
  atom_1_X0_1 = v34;
  int v35 = (v15_W9 == 1);
  atom_1_X9_1 = v35;
  int v36 = (v19_W11 == 0);
  atom_1_X11_0 = v36;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X9_1 = 0; 
  atom_1_X11_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v20 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v25 = (v24 == 1);
  int v26 = atom_1_X0_1;
  int v27 = atom_1_X9_1;
  int v28 = atom_1_X11_0;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v23 & v31_conj;
  int v33_conj = v21 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
