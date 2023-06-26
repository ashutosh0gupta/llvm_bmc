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
int atom_1_X4_1; 
int atom_1_X6_0; 
int atom_1_X8_1; 
int atom_1_X10_0; 

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
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[2], v5_W2, memory_order_relaxed);
  int v8_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W5 = v8_W4 ^ v8_W4;
  int v12_W6 = atomic_load_explicit(&vars[3+v9_W5], memory_order_relaxed);
  int v15_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v16_W9 = v15_W8 ^ v15_W8;
  int v19_W10 = atomic_load_explicit(&vars[0+v16_W9], memory_order_relaxed);
  int v41 = (v3_W0 == 1);
  atom_1_X0_1 = v41;
  int v42 = (v8_W4 == 1);
  atom_1_X4_1 = v42;
  int v43 = (v12_W6 == 0);
  atom_1_X6_0 = v43;
  int v44 = (v15_W8 == 1);
  atom_1_X8_1 = v44;
  int v45 = (v19_W10 == 0);
  atom_1_X10_0 = v45;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X10_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v25 = (v24 == 1);
  int v26 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v27 = (v26 == 1);
  int v28 = atom_1_X0_1;
  int v29 = atom_1_X4_1;
  int v30 = atom_1_X6_0;
  int v31 = atom_1_X8_1;
  int v32 = atom_1_X10_0;
  int v33_conj = v31 & v32;
  int v34_conj = v30 & v33_conj;
  int v35_conj = v29 & v34_conj;
  int v36_conj = v28 & v35_conj;
  int v37_conj = v27 & v36_conj;
  int v38_conj = v25 & v37_conj;
  int v39_conj = v23 & v38_conj;
  int v40_conj = v21 & v39_conj;
  if (v40_conj == 1) assert(0);
  return 0;
}
