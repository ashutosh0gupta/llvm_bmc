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
int atom_3_X0_1; 
int atom_3_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W2 = v1_W0 ^ v1_W0;
  int v3_W3 = atomic_load_explicit(&vars[1+v2_W2], memory_order_relaxed);
  int v14 = (v1_W0 == 1);
  atom_1_X0_1 = v14;
  int v15 = (v3_W3 == 0);
  atom_1_X3_0 = v15;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v4_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v5_W2 = v4_W0 ^ v4_W0;
  int v6_W3 = atomic_load_explicit(&vars[0+v5_W2], memory_order_relaxed);
  int v16 = (v4_W0 == 1);
  atom_3_X0_1 = v16;
  int v17 = (v6_W3 == 0);
  atom_3_X3_0 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X3_0 = 0; 
  atom_3_X0_1 = 0; 
  atom_3_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v7 = atom_1_X0_1;
  int v8 = atom_1_X3_0;
  int v9 = atom_3_X0_1;
  int v10 = atom_3_X3_0;
  int v11_conj = v9 & v10;
  int v12_conj = v8 & v11_conj;
  int v13_conj = v7 & v12_conj;
  if (v13_conj == 1) assert(0);
  return 0;
}
