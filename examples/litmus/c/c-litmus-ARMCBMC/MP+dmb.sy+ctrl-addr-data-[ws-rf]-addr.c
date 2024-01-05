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

long vars[5];
int atom_1_X0_1; 
int atom_1_X9_2; 
int atom_1_X11_0; 

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
  int v3_W4 = v2_W2 ^ v2_W2;
  int v4_W5 = atomic_load_explicit(&vars[3+v3_W4], memory_order_relaxed);
  int v5_W7 = v4_W5 ^ v4_W5;
  int v6_W7 = v5_W7 + 1;
  atomic_store_explicit(&vars[4], v6_W7, memory_order_relaxed);
  int v7_W9 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v8_W10 = v7_W9 ^ v7_W9;
  int v9_W11 = atomic_load_explicit(&vars[0+v8_W10], memory_order_relaxed);
  int v24 = (v1_W0 == 1);
  atom_1_X0_1 = v24;
  int v25 = (v7_W9 == 2);
  atom_1_X9_2 = v25;
  int v26 = (v9_W11 == 0);
  atom_1_X11_0 = v26;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X9_2 = 0; 
  atom_1_X11_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v11 = (v10 == 2);
  int v12 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atom_1_X0_1;
  int v17 = atom_1_X9_2;
  int v18 = atom_1_X11_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v13 & v21_conj;
  int v23_conj = v11 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
