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
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W3 = v2_W2 ^ v2_W2;
  int v4_W4 = atomic_load_explicit(&vars[2+v3_W3], memory_order_relaxed);
  int v5_W6 = v4_W4 ^ v4_W4;
  int v6_W6 = v5_W6 + 1;
  atomic_store_explicit(&vars[3], v6_W6, memory_order_relaxed);
  int v7_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v8_W9 = v7_W8 ^ v7_W8;
  int v9_W10 = atomic_load_explicit(&vars[0+v8_W9], memory_order_relaxed);
  int v26 = (v1_W0 == 1);
  atom_1_X0_1 = v26;
  int v27 = (v2_W2 == 1);
  atom_1_X2_1 = v27;
  int v28 = (v7_W8 == 1);
  atom_1_X8_1 = v28;
  int v29 = (v9_W10 == 0);
  atom_1_X10_0 = v29;
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

  int v10 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atom_1_X0_1;
  int v17 = atom_1_X2_1;
  int v18 = atom_1_X8_1;
  int v19 = atom_1_X10_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  int v23_conj = v15 & v22_conj;
  int v24_conj = v13 & v23_conj;
  int v25_conj = v11 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
