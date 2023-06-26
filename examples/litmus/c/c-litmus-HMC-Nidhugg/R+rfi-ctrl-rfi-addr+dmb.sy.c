/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X2_1; 
int atom_0_X5_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v6_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W6 = v6_W5 ^ v6_W5;
  atomic_store_explicit(&vars[2+v7_W6], 1, memory_order_relaxed);
  int v25 = (v3_W2 == 1);
  atom_0_X2_1 = v25;
  int v26 = (v6_W5 == 1);
  atom_0_X5_1 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  int v10_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v10_W2 == 0);
  atom_1_X2_0 = v27;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_1 = 0; 
  atom_0_X5_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atom_0_X2_1;
  int v18 = atom_0_X5_1;
  int v19 = atom_1_X2_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  int v23_conj = v14 & v22_conj;
  int v24_conj = v12 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}