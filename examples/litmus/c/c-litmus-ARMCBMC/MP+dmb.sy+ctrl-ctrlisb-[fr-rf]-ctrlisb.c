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
int atom_1_X4_0; 
int atom_1_X6_1; 
int atom_1_X7_0; 

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
  if (v1_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v2_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v2_W2) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  int v3_W4 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v4_W6 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v4_W6) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  isb();
  int v5_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v1_W0 == 1);
  atom_1_X0_1 = v22;
  int v23 = (v3_W4 == 0);
  atom_1_X4_0 = v23;
  int v24 = (v4_W6 == 1);
  atom_1_X6_1 = v24;
  int v25 = (v5_W7 == 0);
  atom_1_X7_0 = v25;
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
  atom_1_X4_0 = 0; 
  atom_1_X6_1 = 0; 
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v6 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v7 = (v6 == 1);
  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 1);
  int v10 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atom_1_X0_1;
  int v13 = atom_1_X4_0;
  int v14 = atom_1_X6_1;
  int v15 = atom_1_X7_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  int v19_conj = v11 & v18_conj;
  int v20_conj = v9 & v19_conj;
  int v21_conj = v7 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
