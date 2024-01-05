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

long vars[4];
int atom_1_X0_1; 
int atom_1_X3_2; 
int atom_1_X9_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v2_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v2_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v3_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W6 = v3_W4 ^ v3_W4;
  int v5_W7 = atomic_load_explicit(&vars[3+v4_W6], memory_order_relaxed);
  if (v5_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v6_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v1_W0 == 1);
  atom_1_X0_1 = v18;
  int v19 = (v2_W3 == 2);
  atom_1_X3_2 = v19;
  int v20 = (v6_W9 == 0);
  atom_1_X9_0 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X3_2 = 0; 
  atom_1_X9_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 1);
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 2);
  int v11 = atom_1_X0_1;
  int v12 = atom_1_X3_2;
  int v13 = atom_1_X9_0;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  int v16_conj = v10 & v15_conj;
  int v17_conj = v8 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
