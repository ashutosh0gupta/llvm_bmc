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
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X6_0; 
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
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W3 = v2_W2 ^ v2_W2;
  int v4_W4 = atomic_load_explicit(&vars[2+v3_W3], memory_order_relaxed);
  if (v4_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v5_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v1_W0 == 1);
  atom_1_X0_1 = v23;
  int v24 = (v2_W2 == 1);
  atom_1_X2_1 = v24;
  int v25 = (v5_W6 == 0);
  atom_1_X6_0 = v25;
  int v26 = (v6_W8 == 1);
  atom_1_X8_1 = v26;
  int v27 = (v7_W9 == 1);
  atom_1_X9_1 = v27;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X9_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atom_1_X0_1;
  int v13 = atom_1_X2_1;
  int v14 = atom_1_X6_0;
  int v15 = atom_1_X8_1;
  int v16 = atom_1_X9_1;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v12 & v19_conj;
  int v21_conj = v11 & v20_conj;
  int v22_conj = v9 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
