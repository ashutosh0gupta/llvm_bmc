/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X6_3; 
int atom_1_X3_4; 
int atom_1_X2_3; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v6_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v6_W6 == 3);
  atom_0_X6_3 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 3, memory_order_release);
  int v9_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v12_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v12_W3 == 4);
  atom_1_X3_4 = v22;
  int v23 = (v9_W2 == 3);
  atom_1_X2_3 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_3 = 0; 
  atom_1_X3_4 = 0; 
  atom_1_X2_3 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v14 = (v13 == 4);
  int v15 = atom_0_X6_3;
  int v16 = atom_1_X3_4;
  int v17 = atom_1_X2_3;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
