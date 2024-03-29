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
int atom_1_X10_0; 
int atom_1_X12_0; 

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
  int v3_W3 = atomic_load_explicit(&vars[2+v2_W2], memory_order_relaxed);
  if (v3_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v4_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v5_W7 = v4_W5 ^ v4_W5;
  int v6_W8 = atomic_load_explicit(&vars[4+v5_W7], memory_order_relaxed);
  if (v6_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v7_W10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8_W12 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v1_W0 == 1);
  atom_1_X0_1 = v20;
  int v21 = (v7_W10 == 0);
  atom_1_X10_0 = v21;
  int v22 = (v8_W12 == 0);
  atom_1_X12_0 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X10_0 = 0; 
  atom_1_X12_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atom_1_X0_1;
  int v14 = atom_1_X10_0;
  int v15 = atom_1_X12_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  int v19_conj = v10 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
