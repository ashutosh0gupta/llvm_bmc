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
// ARM-CBMC specific functions to support exclusive accesses
void ldx(int *);
void ldax(int *);
void stx(int *, int);
void stlx(int *, int);

int vars[4]; 
int atom_0_X0_1; 
int atom_1_X8_0; 
int atom_1_X5_0; 
int atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W2 = v1_W0 ^ v1_W0;
  int v3_W2 = v2_W2 + 1;
  atomic_store_explicit(&vars[1], v3_W2, memory_order_relaxed);
  int v34 = (v1_W0 == 1);
  atom_0_X0_1 = v34;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v4_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v5_W2 = v4_W0 ^ v4_W0;
  int v6_W2 = v5_W2 + 1;
  int v7_W4 = ldx(&vars[2]);
  int v8_W5 = stx(&vars[2], v6_W2);
  int v9_W7 = ldx(&vars[3]);
  int v10_W8 = stx(&vars[3], v6_W2);
  int v11_W9 = v7_W4 + 1;
  int v12_W9 = v8_W5 + v11_W9;
  int v13_W9 = v9_W7 + v12_W9;
  int v14_W9 = v10_W8 + v13_W9;
  atomic_store_explicit(&vars[0], v14_W9, memory_order_relaxed);
  int v35 = (v10_W8 == 0);
  atom_1_X8_0 = v35;
  int v36 = (v8_W5 == 0);
  atom_1_X5_0 = v36;
  int v37 = (v4_W0 == 1);
  atom_1_X0_1 = v37;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X8_0 = 0; 
  atom_1_X5_0 = 0; 
  atom_1_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atom_0_X0_1;
  int v24 = atom_1_X8_0;
  int v25 = atom_1_X5_0;
  int v26 = atom_1_X0_1;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  int v32_conj = v18 & v31_conj;
  int v33_conj = v16 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
