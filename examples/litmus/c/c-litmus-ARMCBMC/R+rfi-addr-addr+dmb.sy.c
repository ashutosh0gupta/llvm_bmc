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
int atom_0_X2_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W3 = v1_W2 ^ v1_W2;
  int v3_W4 = atomic_load_explicit(&vars[1+v2_W3], memory_order_relaxed);
  int v4_W6 = v3_W4 ^ v3_W4;
  atomic_store_explicit(&vars[2+v4_W6], 1, memory_order_relaxed);
  int v15 = (v1_W2 == 1);
  atom_0_X2_1 = v15;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  int v5_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v5_W2 == 0);
  atom_1_X2_0 = v16;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 1);
  int v8 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_0_X2_1;
  int v11 = atom_1_X2_0;
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  int v14_conj = v7 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
