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
int atom_0_X2_1; 
int atom_1_X0_1; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v10 = (v1_W2 == 1);
  atom_0_X2_1 = v10;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v2_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W2 = v2_W0 ^ v2_W0;
  int v4_W3 = atomic_load_explicit(&vars[0+v3_W2], memory_order_relaxed);
  int v11 = (v2_W0 == 1);
  atom_1_X0_1 = v11;
  int v12 = (v4_W3 == 0);
  atom_1_X3_0 = v12;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atom_0_X2_1;
  int v6 = atom_1_X0_1;
  int v7 = atom_1_X3_0;
  int v8_conj = v6 & v7;
  int v9_conj = v5 & v8_conj;
  if (v9_conj == 1) assert(0);
  return 0;
}
