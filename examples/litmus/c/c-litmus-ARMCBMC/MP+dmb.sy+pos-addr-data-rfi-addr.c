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
int atom_1_X2_1; 
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
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = atomic_load_explicit(&vars[2+v7_W3], memory_order_relaxed);
  int v11_W6 = v10_W4 ^ v10_W4;
  int v12_W6 = v11_W6 + 1;
  atomic_store_explicit(&vars[3], v12_W6, memory_order_relaxed);
  int v15_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v16_W9 = v15_W8 ^ v15_W8;
  int v19_W10 = atomic_load_explicit(&vars[0+v16_W9], memory_order_relaxed);
  int v36 = (v3_W0 == 1);
  atom_1_X0_1 = v36;
  int v37 = (v6_W2 == 1);
  atom_1_X2_1 = v37;
  int v38 = (v15_W8 == 1);
  atom_1_X8_1 = v38;
  int v39 = (v19_W10 == 0);
  atom_1_X10_0 = v39;
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
  atom_1_X2_1 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X10_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v20 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v25 = (v24 == 1);
  int v26 = atom_1_X0_1;
  int v27 = atom_1_X2_1;
  int v28 = atom_1_X8_1;
  int v29 = atom_1_X10_0;
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v23 & v33_conj;
  int v35_conj = v21 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
