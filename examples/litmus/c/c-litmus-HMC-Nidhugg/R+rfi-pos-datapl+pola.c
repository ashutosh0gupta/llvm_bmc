/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X6_2; 
int atom_0_X2_1; 
int atom_0_X3_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7_W4 = v6_W3 ^ v6_W3;
  int v8_W4 = v7_W4 + 1;
  atomic_store_explicit(&vars[1], v8_W4, memory_order_release);
  int v11_W6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v28 = (v11_W6 == 2);
  atom_0_X6_2 = v28;
  int v29 = (v3_W2 == 1);
  atom_0_X2_1 = v29;
  int v30 = (v6_W3 == 1);
  atom_0_X3_1 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v14_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v31 = (v14_W2 == 0);
  atom_1_X2_0 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_2 = 0; 
  atom_0_X2_1 = 0; 
  atom_0_X3_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atom_0_X6_2;
  int v20 = atom_0_X2_1;
  int v21 = atom_0_X3_1;
  int v22 = atom_1_X2_0;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  int v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
