/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  int v29 = (v3_W0 == 1);
  atom_0_X0_1 = v29;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12_W3 = v11_W2 ^ v11_W2;
  int v15_W4 = atomic_load_explicit(&vars[0+v12_W3], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v30 = (v8_W0 == 1);
  atom_1_X0_1 = v30;
  int v31 = (v11_W2 == 1);
  atom_1_X2_1 = v31;
  int v32 = (v15_W4 == 0);
  atom_1_X4_0 = v32;
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
  atom_1_X4_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v19 = (v18 == 1);
  int v20 = atom_0_X0_1;
  int v21 = atom_1_X0_1;
  int v22 = atom_1_X2_1;
  int v23 = atom_1_X4_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
