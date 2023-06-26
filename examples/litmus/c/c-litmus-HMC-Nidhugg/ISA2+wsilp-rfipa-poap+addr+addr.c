/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X3_2; 
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_2_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W3 == 2);
  atom_0_X3_2 = v25;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W2 = v6_W0 ^ v6_W0;
  atomic_store_explicit(&vars[2+v7_W2], 1, memory_order_relaxed);
  int v26 = (v6_W0 == 1);
  atom_1_X0_1 = v26;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v10_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11_W2 = v10_W0 ^ v10_W0;
  int v14_W3 = atomic_load_explicit(&vars[0+v11_W2], memory_order_relaxed);
  int v27 = (v10_W0 == 1);
  atom_2_X0_1 = v27;
  int v28 = (v14_W3 == 0);
  atom_2_X3_0 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_2 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_2_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atom_0_X3_2;
  int v18 = atom_1_X0_1;
  int v19 = atom_2_X0_1;
  int v20 = atom_2_X3_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
