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

long vars[2]; 
int atom_1_X0_1; 
int atom_1_X2_2; 
int atom_1_X4_0; 
int atom_1_X6_0; 
int atom_1_X8_1; 

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
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W3 = v2_W2 ^ v2_W2;
  int v4_W4 = atomic_load_explicit(&vars[0+v3_W3], memory_order_relaxed);
  int v5_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v6_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v1_W0 == 1);
  atom_1_X0_1 = v22;
  int v23 = (v2_W2 == 2);
  atom_1_X2_2 = v23;
  int v24 = (v4_W4 == 0);
  atom_1_X4_0 = v24;
  int v25 = (v5_W6 == 0);
  atom_1_X6_0 = v25;
  int v26 = (v6_W8 == 1);
  atom_1_X8_1 = v26;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_2 = 0; 
  atom_1_X4_0 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X8_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 2);
  int v11 = atom_1_X0_1;
  int v12 = atom_1_X2_2;
  int v13 = atom_1_X4_0;
  int v14 = atom_1_X6_0;
  int v15 = atom_1_X8_1;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  int v19_conj = v11 & v18_conj;
  int v20_conj = v10 & v19_conj;
  int v21_conj = v8 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
