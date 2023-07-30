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

long vars[3]; 
int atom_1_X0_1; 
int atom_1_X4_1; 
int atom_1_X8_1; 
int atom_1_X9_1; 

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
  if (v1_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v2_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v3_W5 = v2_W4 ^ v2_W4;
  atomic_store_explicit(&vars[0+v3_W5], 1, memory_order_relaxed);
  int v4_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v5_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v1_W0 == 1);
  atom_1_X0_1 = v22;
  int v23 = (v2_W4 == 1);
  atom_1_X4_1 = v23;
  int v24 = (v4_W8 == 1);
  atom_1_X8_1 = v24;
  int v25 = (v5_W9 == 1);
  atom_1_X9_1 = v25;
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
  atom_1_X8_1 = 0; 
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 2);
  int v8 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9 = (v8 == 1);
  int v10 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atom_1_X0_1;
  int v13 = atom_1_X4_1;
  int v14 = atom_1_X8_1;
  int v15 = atom_1_X9_1;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  int v19_conj = v11 & v18_conj;
  int v20_conj = v9 & v19_conj;
  int v21_conj = v7 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
