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

long vars[4];
int atom_1_X0_3; 
int atom_1_X4_0; 
int atom_1_X6_0; 
int atom_1_X2_4; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbld();
  int v3_W4 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v4_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v20 = (v1_W0 == 3);
  atom_1_X0_3 = v20;
  int v21 = (v3_W4 == 0);
  atom_1_X4_0 = v21;
  int v22 = (v4_W6 == 0);
  atom_1_X6_0 = v22;
  int v23 = (v2_W2 == 4);
  atom_1_X2_4 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[0], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[3], 0);
  atom_1_X0_3 = 0; 
  atom_1_X4_0 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X2_4 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atom_1_X0_3;
  int v6 = atom_1_X4_0;
  int v7 = atom_1_X0_3;
  int v8 = atom_1_X6_0;
  int v9 = atom_1_X2_4;
  int v10 = atom_1_X4_0;
  int v11 = atom_1_X2_4;
  int v12 = atom_1_X6_0;
  int v13_conj = v11 & v12;
  int v14_disj = v10 | v13_conj;
  int v15_conj = v9 & v14_disj;
  int v16_disj = v8 | v15_conj;
  int v17_conj = v7 & v16_disj;
  int v18_disj = v6 | v17_conj;
  int v19_conj = v5 & v18_disj;
  if (v19_conj == 1) assert(0);
  return 0;
}
