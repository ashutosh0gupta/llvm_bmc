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
void ldx(int *);
void ldax(int *);
void stx(int *, int);
void stlx(int *, int);

long vars[2]; 
int atom_0_X4_2; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v1_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v1_W4 == 2);
  atom_0_X4_2 = v12;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  int v2_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v13 = (v2_W3 == 0);
  atom_1_X3_0 = v13;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X4_2 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4 = (v3 == 1);
  int v5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6 = (v5 == 3);
  int v7 = atom_0_X4_2;
  int v8 = atom_1_X3_0;
  int v9_conj = v7 & v8;
  int v10_conj = v6 & v9_conj;
  int v11_conj = v4 & v10_conj;
  if (v11_conj == 1) assert(0);
  return 0;
}
