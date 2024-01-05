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
int atom_1_X3_3; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W5 = v2_W4 ^ v2_W4;
  int v4_W5 = v3_W5 + 1;
  atomic_store_explicit(&vars[0], v4_W5, memory_order_release);
  int v5_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v5_W6 == 2);
  atom_0_X6_2 = v16;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v6_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v7_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v17 = (v7_W3 == 3);
  atom_1_X3_3 = v17;
  int v18 = (v6_W2 == 2);
  atom_1_X2_2 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_2 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 3);
  int v10 = atom_0_X6_2;
  int v11 = atom_1_X3_3;
  int v12 = atom_1_X2_2;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
