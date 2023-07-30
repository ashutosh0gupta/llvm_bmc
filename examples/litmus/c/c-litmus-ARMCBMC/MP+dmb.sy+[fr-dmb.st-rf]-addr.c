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

long vars[3]; 
int atom_1_X0_1; 
int atom_1_X2_1; 
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
  int v2_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v3_W4 = v2_W2 ^ v2_W2;
  int v4_W5 = atomic_load_explicit(&vars[0+v3_W4], memory_order_relaxed);
  int v13 = (v1_W0 == 1);
  atom_1_X0_1 = v13;
  int v14 = (v2_W2 == 1);
  atom_1_X2_1 = v14;
  int v15 = (v4_W5 == 0);
  atom_1_X5_0 = v15;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atom_1_X0_1;
  int v8 = atom_1_X2_1;
  int v9 = atom_1_X5_0;
  int v10_conj = v8 & v9;
  int v11_conj = v7 & v10_conj;
  int v12_conj = v6 & v11_conj;
  if (v12_conj == 1) assert(0);
  return 0;
}
