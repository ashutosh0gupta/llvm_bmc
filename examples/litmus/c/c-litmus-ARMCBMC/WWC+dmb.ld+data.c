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
int atom_1_X0_2; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbld();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v11 = (v1_W0 == 2);
  atom_1_X0_2 = v11;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v2_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W2 = v2_W0 ^ v2_W0;
  int v4_W2 = v3_W2 + 1;
  atomic_store_explicit(&vars[0], v4_W2, memory_order_relaxed);
  int v12 = (v2_W0 == 1);
  atom_2_X0_1 = v12;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_2 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atom_1_X0_2;
  int v8 = atom_2_X0_1;
  int v9_conj = v7 & v8;
  int v10_conj = v6 & v9_conj;
  if (v10_conj == 1) assert(0);
  return 0;
}
