/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X5_2; 
int atom_0_X2_2; 
int atom_1_X5_2; 
int atom_1_X4_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v5_W3 = v4_W3 + 1;
  atomic_store_explicit(&vars[1], v5_W3, memory_order_release);
  int v8_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v28 = (v8_W5 == 2);
  atom_0_X5_2 = v28;
  int v29 = (v3_W2 == 2);
  atom_0_X2_2 = v29;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v11_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v14_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v14_W5 == 2);
  atom_1_X5_2 = v30;
  int v31 = (v11_W4 == 1);
  atom_1_X4_1 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X5_2 = 0; 
  atom_0_X2_2 = 0; 
  atom_1_X5_2 = 0; 
  atom_1_X4_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atom_0_X5_2;
  int v20 = atom_0_X2_2;
  int v21 = atom_1_X5_2;
  int v22 = atom_1_X4_1;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  int v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
