/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X7_2; 
int atom_1_X3_3; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7_W6 = v6_W4 ^ v6_W4;
  int v8_W6 = v7_W6 + 1;
  atomic_store_explicit(&vars[0], v8_W6, memory_order_release);
  int v11_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v26 = (v11_W7 == 2);
  atom_0_X7_2 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v14_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v17_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v17_W3 == 3);
  atom_1_X3_3 = v27;
  int v28 = (v14_W2 == 2);
  atom_1_X2_2 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X7_2 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v18 == 3);
  int v20 = atom_0_X7_2;
  int v21 = atom_1_X3_3;
  int v22 = atom_1_X2_2;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
