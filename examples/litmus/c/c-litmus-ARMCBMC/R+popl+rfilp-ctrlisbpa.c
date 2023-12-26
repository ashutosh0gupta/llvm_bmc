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

int vars[2]; 
int atom_0_X4_2; 
int atom_1_X2_2; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v1_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v1_W4 == 2);
  atom_0_X4_2 = v15;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v2_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v16 = (v2_W2 == 2);
  atom_1_X2_2 = v16;
  int v17 = (v3_W3 == 0);
  atom_1_X3_0 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X4_2 = 0; 
  atom_1_X2_2 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v5 = (v4 == 1);
  int v6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7 = (v6 == 2);
  int v8 = atom_0_X4_2;
  int v9 = atom_1_X2_2;
  int v10 = atom_1_X3_0;
  int v11_conj = v9 & v10;
  int v12_conj = v8 & v11_conj;
  int v13_conj = v7 & v12_conj;
  int v14_conj = v5 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
