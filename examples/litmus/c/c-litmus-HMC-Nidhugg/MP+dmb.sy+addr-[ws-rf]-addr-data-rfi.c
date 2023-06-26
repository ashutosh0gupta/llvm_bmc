/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_1_X0_1; 
int atom_1_X5_2; 
int atom_1_X11_1; 

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
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  int v7_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v8_W6 = v7_W5 ^ v7_W5;
  int v11_W7 = atomic_load_explicit(&vars[3+v8_W6], memory_order_relaxed);
  int v12_W9 = v11_W7 ^ v11_W7;
  int v13_W9 = v12_W9 + 1;
  atomic_store_explicit(&vars[0], v13_W9, memory_order_relaxed);
  int v16_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v3_W0 == 1);
  atom_1_X0_1 = v31;
  int v32 = (v7_W5 == 2);
  atom_1_X5_2 = v32;
  int v33 = (v16_W11 == 1);
  atom_1_X11_1 = v33;
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

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X5_2 = 0; 
  atom_1_X11_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v22 = (v21 == 2);
  int v23 = atom_1_X0_1;
  int v24 = atom_1_X5_2;
  int v25 = atom_1_X11_1;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v20 & v28_conj;
  int v30_conj = v18 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
