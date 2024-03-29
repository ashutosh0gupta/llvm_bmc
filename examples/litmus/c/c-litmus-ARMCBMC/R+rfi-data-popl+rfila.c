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
int atom_0_X6_2; 
int atom_0_X2_3; 
int atom_1_X3_3; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W3 = v1_W2 ^ v1_W2;
  int v3_W3 = v2_W3 + 1;
  atomic_store_explicit(&vars[1], v3_W3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v4_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v4_W6 == 2);
  atom_0_X6_2 = v20;
  int v21 = (v1_W2 == 3);
  atom_0_X2_3 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v5_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v6_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v6_W3 == 3);
  atom_1_X3_3 = v22;
  int v23 = (v5_W2 == 2);
  atom_1_X2_2 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_2 = 0; 
  atom_0_X2_3 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 3);
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atom_0_X6_2;
  int v12 = atom_0_X2_3;
  int v13 = atom_1_X3_3;
  int v14 = atom_1_X2_2;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  int v17_conj = v11 & v16_conj;
  int v18_conj = v10 & v17_conj;
  int v19_conj = v8 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
