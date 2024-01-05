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
int atom_0_X6_2; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W4 = v1_W2 ^ v1_W2;
  int v3_W4 = v2_W4 + 1;
  atomic_store_explicit(&vars[2], v3_W4, memory_order_release);
  int v4_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v15 = (v4_W6 == 2);
  atom_0_X6_2 = v15;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  atomic_store_explicit(&vars[2], 3, memory_order_relaxed);
  int v5_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v16 = (v5_W3 == 0);
  atom_1_X3_0 = v16;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_2 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 1);
  int v8 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9 = (v8 == 3);
  int v10 = atom_0_X6_2;
  int v11 = atom_1_X3_0;
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  int v14_conj = v7 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
