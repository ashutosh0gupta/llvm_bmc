/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[4]; 
int atom_0_X9_2; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W4 = v3_W2 ^ v3_W2;
  int v7_W5 = atomic_load_explicit(&vars[2+v4_W4], memory_order_relaxed);
  int v8_W7 = v7_W5 ^ v7_W5;
  int v9_W7 = v8_W7 + 1;
  atomic_store_explicit(&vars[3], v9_W7, memory_order_release);
  int v12_W9 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v25 = (v12_W9 == 2);
  atom_0_X9_2 = v25;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[3], 2, memory_order_release);
  int v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v26 = (v15_W2 == 0);
  atom_1_X2_0 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X9_2 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v18 == 1);
  int v20 = atom_0_X9_2;
  int v21 = atom_1_X2_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v17 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
