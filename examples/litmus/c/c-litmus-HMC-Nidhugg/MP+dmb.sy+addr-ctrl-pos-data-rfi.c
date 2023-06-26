/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_1_X0_1; 
int atom_1_X10_1; 

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
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v13_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v14_W8 = v13_W7 ^ v13_W7;
  int v15_W8 = v14_W8 + 1;
  atomic_store_explicit(&vars[0], v15_W8, memory_order_relaxed);
  int v18_W10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v3_W0 == 1);
  atom_1_X0_1 = v28;
  int v29 = (v18_W10 == 1);
  atom_1_X10_1 = v29;
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
  atom_1_X10_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atom_1_X0_1;
  int v24 = atom_1_X10_1;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v20 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
