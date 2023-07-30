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

long vars[3]; 
int atom_1_X0_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v12 = (v1_W0 == 2);
  atom_1_X0_2 = v12;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v3 = (v2 == 2);
  int v4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v5 = (v4 == 2);
  int v6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7 = (v6 == 2);
  int v8 = atom_1_X0_2;
  int v9_conj = v7 & v8;
  int v10_conj = v5 & v9_conj;
  int v11_conj = v3 & v10_conj;
  if (v11_conj == 1) assert(0);
  return 0;
}
