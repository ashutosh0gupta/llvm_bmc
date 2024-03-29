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

long vars[2];
int atom_0_X3_0; 
int atom_0_X2_0; 
int atom_1_X3_0; 
int atom_1_X2_1; 
int atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[0]);
  int v2_W3 = stx(&vars[0], 1);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v21 = (v2_W3 == 0);
  atom_0_X3_0 = v21;
  int v22 = (v1_W2 == 0);
  atom_0_X2_0 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W2 = ldx(&vars[1]);
  int v4_W3 = stx(&vars[1], 2);
  int v5_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v4_W3 == 0);
  atom_1_X3_0 = v23;
  int v24 = (v3_W2 == 1);
  atom_1_X2_1 = v24;
  int v25 = (v5_W4 == 0);
  atom_1_X4_0 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_0 = 0; 
  atom_0_X2_0 = 0; 
  atom_1_X3_0 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X4_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 1);
  int v8 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_0_X3_0;
  int v11 = atom_0_X2_0;
  int v12 = atom_1_X3_0;
  int v13 = atom_1_X2_1;
  int v14 = atom_1_X4_0;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  int v17_conj = v11 & v16_conj;
  int v18_conj = v10 & v17_conj;
  int v19_conj = v9 & v18_conj;
  int v20_conj = v7 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
