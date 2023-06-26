/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X0_1; 
int atom_1_X3_2; 
int atom_1_X6_2; 
int atom_1_X7_0; 

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
  int v7_W4 = v6_W3 ^ v6_W3;
  int v8_W4 = v7_W4 + 1;
  atomic_store_explicit(&vars[2], v8_W4, memory_order_relaxed);
  int v11_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v11_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_thread_fence(memory_order_seq_cst);
  int v14_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v3_W0 == 1);
  atom_1_X0_1 = v31;
  int v32 = (v6_W3 == 2);
  atom_1_X3_2 = v32;
  int v33 = (v11_W6 == 2);
  atom_1_X6_2 = v33;
  int v34 = (v14_W7 == 0);
  atom_1_X7_0 = v34;
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
  atom_1_X3_2 = 0; 
  atom_1_X6_2 = 0; 
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v20 = (v19 == 2);
  int v21 = atom_1_X0_1;
  int v22 = atom_1_X3_2;
  int v23 = atom_1_X6_2;
  int v24 = atom_1_X7_0;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v18 & v28_conj;
  int v30_conj = v16 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
