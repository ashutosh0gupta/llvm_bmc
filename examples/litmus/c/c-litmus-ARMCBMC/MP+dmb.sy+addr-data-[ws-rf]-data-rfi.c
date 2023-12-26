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
int atom_1_X7_2; 
int atom_1_X10_1; 

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
  int v3_W3 = atomic_load_explicit(&vars[2+v2_W2], memory_order_relaxed);
  int v4_W5 = v3_W3 ^ v3_W3;
  int v5_W5 = v4_W5 + 1;
  atomic_store_explicit(&vars[3], v5_W5, memory_order_relaxed);
  int v6_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v7_W8 = v6_W7 ^ v6_W7;
  int v8_W8 = v7_W8 + 1;
  atomic_store_explicit(&vars[0], v8_W8, memory_order_relaxed);
  int v9_W10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v1_W0 == 1);
  atom_1_X0_1 = v24;
  int v25 = (v6_W7 == 2);
  atom_1_X7_2 = v25;
  int v26 = (v9_W10 == 1);
  atom_1_X10_1 = v26;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
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
  atom_1_X7_2 = 0; 
  atom_1_X10_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v11 = (v10 == 2);
  int v12 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v13 = (v12 == 2);
  int v14 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atom_1_X0_1;
  int v17 = atom_1_X7_2;
  int v18 = atom_1_X10_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v13 & v21_conj;
  int v23_conj = v11 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
