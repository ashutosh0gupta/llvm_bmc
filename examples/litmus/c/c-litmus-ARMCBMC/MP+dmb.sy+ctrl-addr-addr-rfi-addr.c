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

long vars[5]; 
int atom_1_X0_1; 
int atom_1_X10_1; 
int atom_1_X12_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
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
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = atomic_load_explicit(&vars[3+v7_W4], memory_order_relaxed);
  int v11_W7 = v10_W5 ^ v10_W5;
  atomic_store_explicit(&vars[4+v11_W7], 1, memory_order_relaxed);
  int v14_W10 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v15_W11 = v14_W10 ^ v14_W10;
  int v18_W12 = atomic_load_explicit(&vars[0+v15_W11], memory_order_relaxed);
  int v33 = (v3_W0 == 1);
  atom_1_X0_1 = v33;
  int v34 = (v14_W10 == 1);
  atom_1_X10_1 = v34;
  int v35 = (v18_W12 == 0);
  atom_1_X12_0 = v35;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X10_1 = 0; 
  atom_1_X12_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v24 = (v23 == 1);
  int v25 = atom_1_X0_1;
  int v26 = atom_1_X10_1;
  int v27 = atom_1_X12_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v22 & v30_conj;
  int v32_conj = v20 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
