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

int vars[5]; 
int atom_1_X0_1; 
int atom_3_X0_1; 
int atom_5_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v18 = (v1_W0 == 1);
  atom_1_X0_1 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v2_W0 = atomic_load_explicit(&vars[2], memory_order_acquire);
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v19 = (v2_W0 == 1);
  atom_3_X0_1 = v19;
  return NULL;
}

void *t4(void *arg){
label_5:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[4], 1, memory_order_release);
  return NULL;
}

void *t5(void *arg){
label_6:;
  int v3_W0 = atomic_load_explicit(&vars[4], memory_order_acquire);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v20 = (v3_W0 == 1);
  atom_5_X0_1 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_3_X0_1 = 0; 
  atom_5_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);

  int v4 = atom_1_X0_1;
  int v5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atom_3_X0_1;
  int v8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_5_X0_1;
  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13_conj = v10 & v12;
  int v14_conj = v9 & v13_conj;
  int v15_conj = v7 & v14_conj;
  int v16_conj = v6 & v15_conj;
  int v17_conj = v4 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
