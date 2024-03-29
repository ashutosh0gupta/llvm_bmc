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
int atom_1_X4_1; 
int atom_1_X6_0; 
int atom_1_X8_1; 
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
  int v2_W2 = v1_W0 ^ v1_W0;
  int v3_W2 = v2_W2 + 1;
  atomic_store_explicit(&vars[2], v3_W2, memory_order_relaxed);
  int v4_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W5 = v4_W4 ^ v4_W4;
  int v6_W6 = atomic_load_explicit(&vars[3+v5_W5], memory_order_relaxed);
  int v7_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v7_W8) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v8_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v1_W0 == 1);
  atom_1_X0_1 = v30;
  int v31 = (v4_W4 == 1);
  atom_1_X4_1 = v31;
  int v32 = (v6_W6 == 0);
  atom_1_X6_0 = v32;
  int v33 = (v7_W8 == 1);
  atom_1_X8_1 = v33;
  int v34 = (v8_W9 == 0);
  atom_1_X9_0 = v34;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X9_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v9 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atom_1_X0_1;
  int v18 = atom_1_X4_1;
  int v19 = atom_1_X6_0;
  int v20 = atom_1_X8_1;
  int v21 = atom_1_X9_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v16 & v25_conj;
  int v27_conj = v14 & v26_conj;
  int v28_conj = v12 & v27_conj;
  int v29_conj = v10 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
