/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X5_2; 
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
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v9_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10_W6 = v9_W5 ^ v9_W5;
  atomic_store_explicit(&vars[0+v10_W6], 1, memory_order_relaxed);
  int v13_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v3_W0 == 1);
  atom_1_X0_1 = v30;
  int v31 = (v6_W2 == 1);
  atom_1_X2_1 = v31;
  int v32 = (v9_W5 == 2);
  atom_1_X5_2 = v32;
  int v33 = (v13_W9 == 1);
  atom_1_X9_1 = v33;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X5_2 = 0; 
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15 = (v14 == 2);
  int v16 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v19 = (v18 == 2);
  int v20 = atom_1_X0_1;
  int v21 = atom_1_X2_1;
  int v22 = atom_1_X5_2;
  int v23 = atom_1_X9_1;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  int v29_conj = v15 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
