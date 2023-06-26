/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[1+v4_W2], 1, memory_order_relaxed);
  int v20 = (v3_W0 == 1);
  atom_0_X0_1 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v7_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8_W2 = v7_W0 ^ v7_W0;
  int v9_W2 = v8_W2 + 1;
  atomic_store_explicit(&vars[2], v9_W2, memory_order_relaxed);
  int v21 = (v7_W0 == 1);
  atom_1_X0_1 = v21;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v12_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v13_W2 = v12_W0 ^ v12_W0;
  int v14_W2 = v13_W2 + 1;
  atomic_store_explicit(&vars[0], v14_W2, memory_order_relaxed);
  int v22 = (v12_W0 == 1);
  atom_2_X0_1 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = atom_0_X0_1;
  int v16 = atom_1_X0_1;
  int v17 = atom_2_X0_1;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
