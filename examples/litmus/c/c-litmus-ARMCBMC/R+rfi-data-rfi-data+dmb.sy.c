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
int atom_0_X2_1; 
int atom_0_X5_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W3 = v1_W2 ^ v1_W2;
  int v3_W3 = v2_W3 + 1;
  atomic_store_explicit(&vars[1], v3_W3, memory_order_relaxed);
  int v4_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v5_W6 = v4_W5 ^ v4_W5;
  int v6_W6 = v5_W6 + 1;
  atomic_store_explicit(&vars[2], v6_W6, memory_order_relaxed);
  int v22 = (v1_W2 == 1);
  atom_0_X2_1 = v22;
  int v23 = (v4_W5 == 1);
  atom_0_X5_1 = v23;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  int v7_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v7_W2 == 0);
  atom_1_X2_0 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_1 = 0; 
  atom_0_X5_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 1);
  int v10 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v13 = (v12 == 2);
  int v14 = atom_0_X2_1;
  int v15 = atom_0_X5_1;
  int v16 = atom_1_X2_0;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v11 & v19_conj;
  int v21_conj = v9 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
