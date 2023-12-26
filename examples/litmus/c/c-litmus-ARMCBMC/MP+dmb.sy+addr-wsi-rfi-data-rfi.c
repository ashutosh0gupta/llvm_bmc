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

int vars[3]; 
int atom_1_X0_1; 
int atom_1_X6_2; 
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
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W2 = v1_W0 ^ v1_W0;
  atomic_store_explicit(&vars[2+v2_W2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  int v3_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W7 = v3_W6 ^ v3_W6;
  int v5_W7 = v4_W7 + 1;
  atomic_store_explicit(&vars[0], v5_W7, memory_order_relaxed);
  int v6_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v1_W0 == 1);
  atom_1_X0_1 = v21;
  int v22 = (v3_W6 == 2);
  atom_1_X6_2 = v22;
  int v23 = (v6_W9 == 1);
  atom_1_X9_1 = v23;
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
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atom_1_X0_1;
  int v14 = atom_1_X6_2;
  int v15 = atom_1_X9_1;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  int v19_conj = v10 & v18_conj;
  int v20_conj = v8 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
