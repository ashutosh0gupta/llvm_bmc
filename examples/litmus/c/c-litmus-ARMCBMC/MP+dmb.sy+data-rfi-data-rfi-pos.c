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

int vars[3]; 
int atom_1_X0_1; 
int atom_1_X4_1; 
int atom_1_X7_1; 
int atom_1_X8_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W2 = v1_W0 ^ v1_W0;
  int v3_W2 = v2_W2 + 1;
  atomic_store_explicit(&vars[2], v3_W2, memory_order_relaxed);
  int v4_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W5 = v4_W4 ^ v4_W4;
  int v6_W5 = v5_W5 + 1;
  atomic_store_explicit(&vars[0], v6_W5, memory_order_relaxed);
  int v7_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v1_W0 == 1);
  atom_1_X0_1 = v25;
  int v26 = (v4_W4 == 1);
  atom_1_X4_1 = v26;
  int v27 = (v7_W7 == 1);
  atom_1_X7_1 = v27;
  int v28 = (v8_W8 == 1);
  atom_1_X8_1 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X7_1 = 0; 
  atom_1_X8_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v10 = (v9 == 2);
  int v11 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atom_1_X0_1;
  int v16 = atom_1_X4_1;
  int v17 = atom_1_X7_1;
  int v18 = atom_1_X8_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v14 & v21_conj;
  int v23_conj = v12 & v22_conj;
  int v24_conj = v10 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
