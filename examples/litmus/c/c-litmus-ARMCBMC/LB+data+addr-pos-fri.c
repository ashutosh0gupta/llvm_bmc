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

int vars[2]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_1_X3_0; 
int atom_1_X5_0; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W2 = v1_W0 ^ v1_W0;
  int v3_W2 = v2_W2 + 1;
  atomic_store_explicit(&vars[1], v3_W2, memory_order_relaxed);
  int v21 = (v1_W0 == 1);
  atom_0_X0_1 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v4_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v5_W2 = v4_W0 ^ v4_W0;
  int v6_W3 = atomic_load_explicit(&vars[0+v5_W2], memory_order_relaxed);
  int v7_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v22 = (v4_W0 == 1);
  atom_1_X0_1 = v22;
  int v23 = (v6_W3 == 0);
  atom_1_X3_0 = v23;
  int v24 = (v7_W5 == 0);
  atom_1_X5_0 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X3_0 = 0; 
  atom_1_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 1);
  int v10 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atom_0_X0_1;
  int v13 = atom_1_X0_1;
  int v14 = atom_1_X3_0;
  int v15 = atom_1_X5_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  int v19_conj = v11 & v18_conj;
  int v20_conj = v9 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
