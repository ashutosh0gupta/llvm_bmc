vars[0]
vars[2]
vars[1]
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
int atom_1_X2_1; 
int atom_1_X4_1; 
int atom_1_X6_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v1_X2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v2_X4 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v3_X6 = atomic_load_explicit(&vars[1], memory_order_acquire);
  int v18 = (v1_X2 == 1);
  atom_1_X2_1 = v18;
  int v19 = (v2_X4 == 1);
  atom_1_X4_1 = v19;
  int v20 = (v3_X6 == 2);
  atom_1_X6_2 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X2_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v5 = (v4 == 2);
  int v6 = atom_1_X2_1;
  int v7 = atom_1_X4_1;
  int v8 = atom_1_X6_2;
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13_disj = v10 | v12;
  int v14_conj = v8 & v13_disj;
  int v15_conj = v7 & v14_conj;
  int v16_conj = v6 & v15_conj;
  int v17_conj = v5 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
