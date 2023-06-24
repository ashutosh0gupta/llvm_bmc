/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X0_1; 
int atom_1_X3_0; 
int atom_1_X6_2; 
int atom_1_X7_0; 
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
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v10_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v10_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v35 = (v3_W0 == 1);
  atom_1_X0_1 = v35;
  int v36 = (v7_W3 == 0);
  atom_1_X3_0 = v36;
  int v37 = (v10_W6 == 2);
  atom_1_X6_2 = v37;
  int v38 = (v13_W7 == 0);
  atom_1_X7_0 = v38;
  int v39 = (v16_W9 == 0);
  atom_1_X9_0 = v39;
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
  atom_1_X3_0 = 0; 
  atom_1_X6_2 = 0; 
  atom_1_X7_0 = 0; 
  atom_1_X9_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v22 = (v21 == 2);
  int v23 = atom_1_X0_1;
  int v24 = atom_1_X3_0;
  int v25 = atom_1_X6_2;
  int v26 = atom_1_X7_0;
  int v27 = atom_1_X9_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v23 & v30_conj;
  int v32_conj = v22 & v31_conj;
  int v33_conj = v20 & v32_conj;
  int v34_conj = v18 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
