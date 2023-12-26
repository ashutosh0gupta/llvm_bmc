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
int atom_1_X2_1; 
int atom_1_X6_0; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W2 = ldx(&vars[2]);
  int v2_W3 = stx(&vars[2], 2);
  int v3_W5 = v2_W3 ^ v2_W3;
  int v4_W6 = atomic_load_explicit(&vars[1+v3_W5], memory_order_relaxed);
  int v13 = (v1_W2 == 1);
  atom_1_X2_1 = v13;
  int v14 = (v4_W6 == 0);
  atom_1_X6_0 = v14;
  int v15 = (v2_W3 == 0);
  atom_1_X3_0 = v15;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 1);
  atom_1_X2_1 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atom_1_X2_1;
  int v8 = atom_1_X6_0;
  int v9 = atom_1_X3_0;
  int v10_conj = v8 & v9;
  int v11_conj = v7 & v10_conj;
  int v12_conj = v6 & v11_conj;
  if (v12_conj == 1) assert(0);
  return 0;
}
