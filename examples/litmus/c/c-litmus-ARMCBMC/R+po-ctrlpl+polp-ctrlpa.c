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

int vars[4]; 
int atom_0_X6_2; 
int atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v1_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v2_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v14 = (v2_W6 == 2);
  atom_0_X6_2 = v14;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  int v3_W2 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v3_W2) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v4_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v15 = (v4_W4 == 0);
  atom_1_X4_0 = v15;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_2 = 0; 
  atom_1_X4_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 1);
  int v7 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v8 = (v7 == 2);
  int v9 = atom_0_X6_2;
  int v10 = atom_1_X4_0;
  int v11_conj = v9 & v10;
  int v12_conj = v8 & v11_conj;
  int v13_conj = v6 & v12_conj;
  if (v13_conj == 1) assert(0);
  return 0;
}
