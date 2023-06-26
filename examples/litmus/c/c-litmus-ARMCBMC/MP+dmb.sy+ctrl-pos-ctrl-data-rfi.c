/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

// Memory barriers
void dmbld();
void dmbst();
void dmbsy();
void isb();

long vars[4]; 
int atom_1_X0_1; 
int atom_1_X9_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v9_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v12_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v13_W7 = v12_W5 ^ v12_W5;
  int v14_W7 = v13_W7 + 1;
  atomic_store_explicit(&vars[0], v14_W7, memory_order_relaxed);
  int v17_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v3_W0 == 1);
  atom_1_X0_1 = v27;
  int v28 = (v17_W9 == 1);
  atom_1_X9_1 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atom_1_X0_1;
  int v23 = atom_1_X9_1;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v19 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
