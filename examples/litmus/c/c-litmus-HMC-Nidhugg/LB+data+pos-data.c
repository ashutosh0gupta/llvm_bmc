/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_1_X2_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  atom_0_X0_1 = v25;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12_W3 = v11_W2 ^ v11_W2;
  int v13_W3 = v12_W3 + 1;
  atomic_store_explicit(&vars[0], v13_W3, memory_order_relaxed);
  int v26 = (v8_W0 == 1);
  atom_1_X0_1 = v26;
  int v27 = (v11_W2 == 1);
  atom_1_X2_1 = v27;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v17 = (v16 == 1);
  int v18 = atom_0_X0_1;
  int v19 = atom_1_X0_1;
  int v20 = atom_1_X2_1;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v15 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
