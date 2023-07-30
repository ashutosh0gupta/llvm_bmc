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
int atom_0_X2_2; 
int atom_1_X2_3; 
int atom_2_X0_3; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[0]);
  int v2_W4 = stx(&vars[0], 3);
  int v15 = (v1_W2 == 2);
  atom_0_X2_2 = v15;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[1], v3_W2, memory_order_relaxed);
  int v16 = (v3_W2 == 3);
  atom_1_X2_3 = v16;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v4_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v5_W2 = v4_W0 & 64;
  int v6_W2 = v5_W2 + 1;
  atomic_store_explicit(&vars[0], v6_W2, memory_order_relaxed);
  int v17 = (v4_W0 == 3);
  atom_2_X0_3 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_2 = 0; 
  atom_1_X2_3 = 0; 
  atom_2_X0_3 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v7 = atom_0_X2_2;
  int v8 = atom_1_X2_3;
  int v9 = atom_2_X0_3;
  int v10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v11 = (v10 == 3);
  int v12_conj = v9 & v11;
  int v13_conj = v8 & v12_conj;
  int v14_conj = v7 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
