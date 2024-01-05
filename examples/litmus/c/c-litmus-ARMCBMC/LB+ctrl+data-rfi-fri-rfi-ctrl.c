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
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_1_X4_1; 
int atom_1_X6_2; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v1_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v17 = (v1_W0 == 1);
  atom_0_X0_1 = v17;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v2_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W2 = v2_W0 ^ v2_W0;
  int v4_W2 = v3_W2 + 1;
  atomic_store_explicit(&vars[2], v4_W2, memory_order_relaxed);
  int v5_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  int v6_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v6_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v18 = (v2_W0 == 1);
  atom_1_X0_1 = v18;
  int v19 = (v5_W4 == 1);
  atom_1_X4_1 = v19;
  int v20 = (v6_W6 == 2);
  atom_1_X6_2 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atom_0_X0_1;
  int v10 = atom_1_X0_1;
  int v11 = atom_1_X4_1;
  int v12 = atom_1_X6_2;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  int v16_conj = v8 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
