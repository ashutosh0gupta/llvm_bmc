/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X5_1; 
int atom_1_X7_0; 
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
  int v7_W3 = v6_W2 ^ v6_W2;
  int v8_W3 = v7_W3 + 1;
  atomic_store_explicit(&vars[2], v8_W3, memory_order_relaxed);
  int v11_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12_W6 = v11_W5 ^ v11_W5;
  int v15_W7 = atomic_load_explicit(&vars[0+v12_W6], memory_order_relaxed);
  int v18_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v37 = (v3_W0 == 1);
  atom_1_X0_1 = v37;
  int v38 = (v6_W2 == 1);
  atom_1_X2_1 = v38;
  int v39 = (v11_W5 == 1);
  atom_1_X5_1 = v39;
  int v40 = (v15_W7 == 0);
  atom_1_X7_0 = v40;
  int v41 = (v18_W9 == 1);
  atom_1_X9_1 = v41;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
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
  atom_1_X5_1 = 0; 
  atom_1_X7_0 = 0; 
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v24 = (v23 == 1);
  int v25 = atom_1_X0_1;
  int v26 = atom_1_X2_1;
  int v27 = atom_1_X5_1;
  int v28 = atom_1_X7_0;
  int v29 = atom_1_X9_1;
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v24 & v33_conj;
  int v35_conj = v22 & v34_conj;
  int v36_conj = v20 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
