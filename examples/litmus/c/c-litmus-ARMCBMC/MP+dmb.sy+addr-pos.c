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
int atom_1_X3_0; 
int atom_1_X5_0; 

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
  int v3_W3 = atomic_load_explicit(&vars[0+v2_W2], memory_order_relaxed);
  int v4_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v1_W0 == 1);
  atom_1_X0_1 = v16;
  int v17 = (v3_W3 == 0);
  atom_1_X3_0 = v17;
  int v18 = (v4_W5 == 0);
  atom_1_X5_0 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X3_0 = 0; 
  atom_1_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 1);
  int v7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8 = (v7 == 1);
  int v9 = atom_1_X0_1;
  int v10 = atom_1_X3_0;
  int v11 = atom_1_X5_0;
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  int v14_conj = v8 & v13_conj;
  int v15_conj = v6 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
