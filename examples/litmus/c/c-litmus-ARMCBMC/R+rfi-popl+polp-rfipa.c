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
int atom_0_X5_2; 
int atom_0_X2_2; 
int atom_1_X5_2; 
int atom_1_X4_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v2_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v2_W5 == 2);
  atom_0_X5_2 = v18;
  int v19 = (v1_W2 == 2);
  atom_0_X2_2 = v19;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v4_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v4_W5 == 2);
  atom_1_X5_2 = v20;
  int v21 = (v3_W4 == 1);
  atom_1_X4_1 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X5_2 = 0; 
  atom_0_X2_2 = 0; 
  atom_1_X5_2 = 0; 
  atom_1_X4_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atom_0_X5_2;
  int v10 = atom_0_X2_2;
  int v11 = atom_1_X5_2;
  int v12 = atom_1_X4_1;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  int v16_conj = v8 & v15_conj;
  int v17_conj = v6 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
