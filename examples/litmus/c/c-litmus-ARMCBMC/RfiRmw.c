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
int atom_1_X4_0; 
int atom_1_X2_2; 
int atom_1_X8_0; 
int atom_2_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v1_W2 = ldx(&vars[0]);
  int v2_W4 = stx(&vars[0], 3);
  int v3_W9 = v1_W2 & 128;
  int v4_W8 = atomic_load_explicit(&vars[1+v3_W9], memory_order_relaxed);
  int v16 = (v2_W4 == 0);
  atom_1_X4_0 = v16;
  int v17 = (v1_W2 == 2);
  atom_1_X2_2 = v17;
  int v18 = (v4_W8 == 0);
  atom_1_X8_0 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  dmbsy();
  int v5_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v5_W2 == 0);
  atom_2_X2_0 = v19;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X4_0 = 0; 
  atom_1_X2_2 = 0; 
  atom_1_X8_0 = 0; 
  atom_2_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 3);
  int v8 = atom_1_X4_0;
  int v9 = atom_1_X2_2;
  int v10_conj = v8 & v9;
  int v11 = atom_1_X8_0;
  int v12 = atom_2_X2_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10_conj & v13_conj;
  int v15_conj = v7 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
