/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_2_X2_0; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v21 = (v3_W0 == 1);
  atom_0_X0_1 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v22 = (v6_W0 == 1);
  atom_1_X0_1 = v22;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  int v12_W2 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v20 = (v12_W2 == 0);
  atom_2_X2_0 = v20;
  int v23 = (v9_W0 == 1);
  atom_2_X0_1 = v23;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_2_X2_0 = 0; 
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v13 = atom_2_X2_0;
  int v14 = atom_0_X0_1;
  int v15 = atom_1_X0_1;
  int v16 = atom_2_X0_1;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
