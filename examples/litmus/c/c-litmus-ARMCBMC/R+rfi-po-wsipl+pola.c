vars[0]
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
int atom_0_X6_3; 
int atom_0_X2_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v2_W6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v2_W6 == 3);
  atom_0_X6_3 = v15;
  int v16 = (v1_W2 == 1);
  atom_0_X2_1 = v16;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 3, memory_order_release);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v17 = (v3_W2 == 0);
  atom_1_X2_0 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_3 = 0; 
  atom_0_X2_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v5 = (v4 == 1);
  int v6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7 = (v6 == 3);
  int v8 = atom_0_X6_3;
  int v9 = atom_0_X2_1;
  int v10 = atom_1_X2_0;
  int v11_conj = v9 & v10;
  int v12_conj = v8 & v11_conj;
  int v13_conj = v7 & v12_conj;
  int v14_conj = v5 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
