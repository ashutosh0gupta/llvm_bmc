/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[3]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_1_X2_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  int v26 = (v3_W0 == 1);
  atom_0_X0_1 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v11_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v14_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v14_W3) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v27 = (v8_W0 == 1);
  atom_1_X0_1 = v27;
  int v28 = (v11_W2 == 1);
  atom_1_X2_1 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atom_0_X0_1;
  int v20 = atom_1_X0_1;
  int v21 = atom_1_X2_1;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
