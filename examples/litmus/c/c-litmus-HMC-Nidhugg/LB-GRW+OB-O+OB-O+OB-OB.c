/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[5]; 
int atom_4_X0_1; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_3_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v26 = (v3_W0 == 1);
  atom_0_X0_1 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v27 = (v6_W0 == 1);
  atom_1_X0_1 = v27;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v28 = (v9_W0 == 1);
  atom_2_X0_1 = v28;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v29 = (v12_W0 == 1);
  atom_3_X0_1 = v29;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v15_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v15_W0 == 1);
  atom_4_X0_1 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_4_X0_1 = 0; 
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_3_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);

  int v16 = atom_4_X0_1;
  int v17 = atom_0_X0_1;
  int v18 = atom_1_X0_1;
  int v19 = atom_2_X0_1;
  int v20 = atom_3_X0_1;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
