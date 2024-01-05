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
int atom_1_X5_0; 
int atom_1_X0_1; 
int atom_1_X4_1; 
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
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v2_W4 = ldx(&vars[2]);
  int v3_W5 = stx(&vars[2], v2_W4);
  int v4_W6 = v2_W4 ^ v2_W4;
  int v5_W7 = atomic_load_explicit(&vars[0+v4_W6], memory_order_relaxed);
  int v16 = (v3_W5 == 0);
  atom_1_X5_0 = v16;
  int v17 = (v1_W0 == 1);
  atom_1_X0_1 = v17;
  int v18 = (v2_W4 == 1);
  atom_1_X4_1 = v18;
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
  atom_1_X5_0 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7 = (v6 == 1);
  int v8 = atom_1_X5_0;
  int v9 = atom_1_X0_1;
  int v10 = atom_1_X4_1;
  int v11 = atom_1_X7_0;
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  int v14_conj = v8 & v13_conj;
  int v15_conj = v7 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
