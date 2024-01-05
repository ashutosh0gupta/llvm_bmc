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

long vars[4];
int atom_2_X2_0; 
int atom_3_X1_0; 
int atom_1_X0_1; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v14 = (v1_W0 == 1);
  atom_1_X0_1 = v14;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v2_W0 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v3_W2 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v12 = (v3_W2 == 0);
  atom_2_X2_0 = v12;
  int v15 = (v2_W0 == 1);
  atom_2_X0_1 = v15;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  dmbsy();
  int v4_W1 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v13 = (v4_W1 == 0);
  atom_3_X1_0 = v13;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_2_X2_0 = 0; 
  atom_3_X1_0 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v5 = atom_2_X2_0;
  int v6 = atom_3_X1_0;
  int v7 = atom_1_X0_1;
  int v8 = atom_2_X0_1;
  int v9_conj = v7 & v8;
  int v10_conj = v6 & v9_conj;
  int v11_conj = v5 & v10_conj;
  if (v11_conj == 1) assert(0);
  return 0;
}
