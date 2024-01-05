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
int atom_0_X2_0; 
int atom_1_X3_2; 
int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v17 = (v1_W2 == 0);
  atom_0_X2_0 = v17;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v2_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W4 = v2_W3 ^ v2_W3;
  int v4_W5 = atomic_load_explicit(&vars[2+v3_W4], memory_order_relaxed);
  if (v4_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v5_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v2_W3 == 2);
  atom_1_X3_2 = v18;
  int v19 = (v5_W7 == 0);
  atom_1_X7_0 = v19;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_0 = 0; 
  atom_1_X3_2 = 0; 
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 1);
  int v8 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_0_X2_0;
  int v11 = atom_1_X3_2;
  int v12 = atom_1_X7_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  int v16_conj = v7 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
