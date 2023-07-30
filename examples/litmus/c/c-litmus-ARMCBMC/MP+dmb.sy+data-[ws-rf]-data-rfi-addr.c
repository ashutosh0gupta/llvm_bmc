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

long vars[4]; 
int atom_1_X0_1; 
int atom_1_X4_2; 
int atom_1_X7_1; 
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
  int v3_W2 = v2_W2 + 1;
  atomic_store_explicit(&vars[2], v3_W2, memory_order_relaxed);
  int v4_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W5 = v4_W4 ^ v4_W4;
  int v6_W5 = v5_W5 + 1;
  atomic_store_explicit(&vars[3], v6_W5, memory_order_relaxed);
  int v7_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v8_W8 = v7_W7 ^ v7_W7;
  int v9_W9 = atomic_load_explicit(&vars[0+v8_W8], memory_order_relaxed);
  int v29 = (v1_W0 == 1);
  atom_1_X0_1 = v29;
  int v30 = (v4_W4 == 2);
  atom_1_X4_2 = v30;
  int v31 = (v7_W7 == 1);
  atom_1_X7_1 = v31;
  int v32 = (v9_W9 == 0);
  atom_1_X9_0 = v32;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
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
  atom_1_X4_2 = 0; 
  atom_1_X7_1 = 0; 
  atom_1_X9_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v17 = (v16 == 2);
  int v18 = atom_1_X0_1;
  int v19 = atom_1_X4_2;
  int v20 = atom_1_X7_1;
  int v21 = atom_1_X9_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v15 & v25_conj;
  int v27_conj = v13 & v26_conj;
  int v28_conj = v11 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
