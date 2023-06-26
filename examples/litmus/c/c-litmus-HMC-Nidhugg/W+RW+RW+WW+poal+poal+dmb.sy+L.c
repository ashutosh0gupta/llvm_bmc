/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_1_X0_2; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v16 = (v3_W0 == 2);
  atom_1_X0_2 = v16;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v6_W0 = atomic_load_explicit(&vars[1], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v17 = (v6_W0 == 1);
  atom_2_X0_1 = v17;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_2 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10 = (v9 == 2);
  int v11 = atom_1_X0_2;
  int v12 = atom_2_X0_1;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v8 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
