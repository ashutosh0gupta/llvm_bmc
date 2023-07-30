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

long vars[2]; 
int atom_0_X0_1; 
int atom_1_X5_0; 
int atom_1_X0_1; 
int atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v15 = (v1_W0 == 1);
  atom_0_X0_1 = v15;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v2_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W4 = ldx(&vars[0]);
  int v4_W5 = stx(&vars[0], 1);
  int v16 = (v4_W5 == 0);
  atom_1_X5_0 = v16;
  int v17 = (v2_W0 == 1);
  atom_1_X0_1 = v17;
  int v18 = (v3_W4 == 0);
  atom_1_X4_0 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X5_0 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X4_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 1);
  int v7 = atom_0_X0_1;
  int v8 = atom_1_X5_0;
  int v9 = atom_1_X0_1;
  int v10 = atom_1_X4_0;
  int v11_conj = v9 & v10;
  int v12_conj = v8 & v11_conj;
  int v13_conj = v7 & v12_conj;
  int v14_conj = v6 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
