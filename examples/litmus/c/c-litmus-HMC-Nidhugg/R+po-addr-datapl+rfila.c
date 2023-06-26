/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X8_2; 
int atom_1_X3_3; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W4 = v3_W2 ^ v3_W2;
  int v7_W5 = atomic_load_explicit(&vars[2+v4_W4], memory_order_relaxed);
  int v8_W7 = v7_W5 ^ v7_W5;
  int v9_W7 = v8_W7 + 1;
  atomic_store_explicit(&vars[0], v9_W7, memory_order_release);
  int v12_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v12_W8 == 2);
  atom_0_X8_2 = v27;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v18_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v18_W3 == 3);
  atom_1_X3_3 = v28;
  int v29 = (v15_W2 == 2);
  atom_1_X2_2 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X8_2 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v19 == 3);
  int v21 = atom_0_X8_2;
  int v22 = atom_1_X3_3;
  int v23 = atom_1_X2_2;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
