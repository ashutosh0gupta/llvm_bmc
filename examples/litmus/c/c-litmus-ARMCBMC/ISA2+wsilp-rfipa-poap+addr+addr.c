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
int atom_0_X3_2; 
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_2_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v1_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v17 = (v1_W3 == 2);
  atom_0_X3_2 = v17;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v2_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W2 = v2_W0 ^ v2_W0;
  atomic_store_explicit(&vars[2+v3_W2], 1, memory_order_relaxed);
  int v18 = (v2_W0 == 1);
  atom_1_X0_1 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v4_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W2 = v4_W0 ^ v4_W0;
  int v6_W3 = atomic_load_explicit(&vars[0+v5_W2], memory_order_relaxed);
  int v19 = (v4_W0 == 1);
  atom_2_X0_1 = v19;
  int v20 = (v6_W3 == 0);
  atom_2_X3_0 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_2 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_2_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atom_0_X3_2;
  int v10 = atom_1_X0_1;
  int v11 = atom_2_X0_1;
  int v12 = atom_2_X3_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  int v16_conj = v8 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
