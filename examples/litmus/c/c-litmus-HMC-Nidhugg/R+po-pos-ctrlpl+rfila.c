/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X6_2; 
int atom_1_X3_3; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v9_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v9_W6 == 2);
  atom_0_X6_2 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v12_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v15_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v15_W3 == 3);
  atom_1_X3_3 = v25;
  int v26 = (v12_W2 == 2);
  atom_1_X2_2 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_2 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v17 = (v16 == 3);
  int v18 = atom_0_X6_2;
  int v19 = atom_1_X3_3;
  int v20 = atom_1_X2_2;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
