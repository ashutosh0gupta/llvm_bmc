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
int ldx(int *);
int ldax(int *);
int stx(int *, int);
int stlx(int *, int);

long vars[3];
int atom_1_X0_1; 
int atom_1_X6_2; 
int atom_1_X7_2; 
int atom_1_X9_0; 

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
  int v2_W2 = v1_W0 ^ v1_W0;
  atomic_store_explicit(&vars[2+v2_W2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  int v3_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W7 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W8 = v4_W7 ^ v4_W7;
  int v6_W9 = atomic_load_explicit(&vars[0+v5_W8], memory_order_relaxed);
  int v23 = (v1_W0 == 1);
  atom_1_X0_1 = v23;
  int v24 = (v3_W6 == 2);
  atom_1_X6_2 = v24;
  int v25 = (v4_W7 == 2);
  atom_1_X7_2 = v25;
  int v26 = (v6_W9 == 0);
  atom_1_X9_0 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X6_2 = 0; 
  atom_1_X7_2 = 0; 
  atom_1_X9_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 1);
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atom_1_X0_1;
  int v14 = atom_1_X6_2;
  int v15 = atom_1_X7_2;
  int v16 = atom_1_X9_0;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v12 & v19_conj;
  int v21_conj = v10 & v20_conj;
  int v22_conj = v8 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
