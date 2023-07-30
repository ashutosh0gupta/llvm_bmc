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

long vars[2]; 
int atom_0_X3_2; 
int atom_0_X5_0; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v1_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W4 = v1_W3 ^ v1_W3;
  int v3_W5 = atomic_load_explicit(&vars[1+v2_W4], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v16 = (v1_W3 == 2);
  atom_0_X3_2 = v16;
  int v17 = (v3_W5 == 0);
  atom_0_X5_0 = v17;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  dmbsy();
  int v4_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v4_W2 == 0);
  atom_1_X2_0 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_2 = 0; 
  atom_0_X5_0 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atom_0_X3_2;
  int v10 = atom_0_X5_0;
  int v11 = atom_1_X2_0;
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  int v14_conj = v8 & v13_conj;
  int v15_conj = v6 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
