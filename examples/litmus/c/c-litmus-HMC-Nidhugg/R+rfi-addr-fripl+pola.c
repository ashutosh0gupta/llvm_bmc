/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X7_2; 
int atom_0_X2_1; 
int atom_0_X4_0; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = atomic_load_explicit(&vars[1+v4_W3], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v10_W7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v27 = (v10_W7 == 2);
  atom_0_X7_2 = v27;
  int v28 = (v3_W2 == 1);
  atom_0_X2_1 = v28;
  int v29 = (v7_W4 == 0);
  atom_0_X4_0 = v29;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v13_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v30 = (v13_W2 == 0);
  atom_1_X2_0 = v30;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X7_2 = 0; 
  atom_0_X2_1 = 0; 
  atom_0_X4_0 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v17 = (v16 == 2);
  int v18 = atom_0_X7_2;
  int v19 = atom_0_X2_1;
  int v20 = atom_0_X4_0;
  int v21 = atom_1_X2_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v15 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
