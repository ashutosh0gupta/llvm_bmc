/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_1_X0_1; 
int atom_1_X3_2; 
int atom_1_X9_0; 

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
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10_W6 = v9_W4 ^ v9_W4;
  int v13_W7 = atomic_load_explicit(&vars[3+v10_W6], memory_order_relaxed);
  if (v13_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_thread_fence(memory_order_seq_cst);
  int v16_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v3_W0 == 1);
  atom_1_X0_1 = v28;
  int v29 = (v6_W3 == 2);
  atom_1_X3_2 = v29;
  int v30 = (v16_W9 == 0);
  atom_1_X9_0 = v30;
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
  atom_1_X3_2 = 0; 
  atom_1_X9_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v19 == 2);
  int v21 = atom_1_X0_1;
  int v22 = atom_1_X3_2;
  int v23 = atom_1_X9_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v18 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
