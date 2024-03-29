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
int atom_0_X2_1; 
int atom_1_X5_0; 
int atom_1_X0_1; 
int atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[0]);
  int v2_W3 = stx(&vars[0], 2);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v18 = (v2_W3 == 0);
  atom_0_X3_0 = v18;
  int v19 = (v1_W2 == 1);
  atom_0_X2_1 = v19;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W4 = ldx(&vars[0]);
  int v5_W5 = stx(&vars[0], 1);
  int v20 = (v5_W5 == 0);
  atom_1_X5_0 = v20;
  int v21 = (v3_W0 == 1);
  atom_1_X0_1 = v21;
  int v22 = (v4_W4 == 0);
  atom_1_X4_0 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_0 = 0; 
  atom_0_X2_1 = 0; 
  atom_1_X5_0 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X4_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 2);
  int v8 = atom_0_X3_0;
  int v9 = atom_0_X2_1;
  int v10 = atom_1_X5_0;
  int v11 = atom_1_X0_1;
  int v12 = atom_1_X4_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  int v16_conj = v8 & v15_conj;
  int v17_conj = v7 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
