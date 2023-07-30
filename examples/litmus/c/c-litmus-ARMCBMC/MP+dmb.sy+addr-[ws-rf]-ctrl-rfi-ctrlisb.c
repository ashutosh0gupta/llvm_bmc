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

long vars[4]; 
int atom_1_X0_1; 
int atom_1_X5_2; 
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
  atomic_store_explicit(&vars[2+v2_W2], 1, memory_order_relaxed);
  int v3_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v3_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v4_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v4_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  int v5_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v1_W0 == 1);
  atom_1_X0_1 = v25;
  int v26 = (v3_W5 == 2);
  atom_1_X5_2 = v26;
  int v27 = (v4_W8 == 1);
  atom_1_X8_1 = v27;
  int v28 = (v5_W9 == 0);
  atom_1_X9_0 = v28;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
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
  atom_1_X5_2 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X9_0 = 0; 

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
  int v12 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v13 = (v12 == 2);
  int v14 = atom_1_X0_1;
  int v15 = atom_1_X5_2;
  int v16 = atom_1_X8_1;
  int v17 = atom_1_X9_0;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  int v21_conj = v13 & v20_conj;
  int v22_conj = v11 & v21_conj;
  int v23_conj = v9 & v22_conj;
  int v24_conj = v7 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
