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

int vars[7]; 
int atom_0_X0_1; 
int atom_0_X3_1; 
int atom_1_X0_1; 
int atom_2_X1_0; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  atomic_store_explicit(&vars[2], v1_W0, memory_order_relaxed);
  int v2_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], v2_W3, memory_order_relaxed);
  int v21 = (v1_W0 == 1);
  atom_0_X0_1 = v21;
  int v22 = (v2_W3 == 1);
  atom_0_X3_1 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v23 = (v3_W0 == 1);
  atom_1_X0_1 = v23;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  dmbsy();
  int v4_W1 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  int v24 = (v4_W1 == 0);
  atom_2_X1_0 = v24;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t4(void *arg){
label_5:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);
  return NULL;
}

void *t5(void *arg){
label_6:;
  atomic_store_explicit(&vars[6], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 

  atomic_init(&vars[6], 0);
  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_0_X3_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X1_0 = 0; 

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

  int v5 = atom_0_X0_1;
  int v6 = atom_0_X3_1;
  int v7 = atom_1_X0_1;
  int v8 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_2_X1_0;
  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[6], memory_order_relaxed);
  int v14 = (v13 == 2);
  int v15_conj = v12 & v14;
  int v16_conj = v10 & v15_conj;
  int v17_conj = v9 & v16_conj;
  int v18_conj = v7 & v17_conj;
  int v19_conj = v6 & v18_conj;
  int v20_conj = v5 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
