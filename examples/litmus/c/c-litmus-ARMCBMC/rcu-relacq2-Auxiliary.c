vars[3]
vars[0]
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

long vars[6]; 
int atom_0_X0_1; 
int atom_0_X5_0; 
int atom_0_X7_1; 
int atom_0_X3_1; 
int atom_1_X2_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  atomic_store_explicit(&vars[4], v1_W0, memory_order_relaxed);
  int v2_W3 = atomic_load_explicit(&vars[3], memory_order_acquire);
  int v3_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v18 = (v1_W0 == 1);
  atom_0_X0_1 = v18;
  int v19 = (v3_W5 == 0);
  atom_0_X5_0 = v19;
  int v20 = (v4_W7 == 1);
  atom_0_X7_1 = v20;
  int v21 = (v2_W3 == 1);
  atom_0_X3_1 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  dmbsy();
  int v5_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v22 = (v5_W2 == 1);
  atom_1_X2_1 = v22;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_release);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_0_X5_0 = 0; 
  atom_0_X7_1 = 0; 
  atom_0_X3_1 = 0; 
  atom_1_X2_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v6 = atom_0_X0_1;
  int v7 = atom_0_X5_0;
  int v8 = atom_0_X7_1;
  int v9 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v10 = (v9 == 2);
  int v11 = atom_0_X3_1;
  int v12 = atom_1_X2_1;
  int v13_disj = v11 | v12;
  int v14_conj = v10 & v13_disj;
  int v15_conj = v8 & v14_conj;
  int v16_conj = v7 & v15_conj;
  int v17_conj = v6 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
