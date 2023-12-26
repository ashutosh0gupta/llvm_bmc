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
int atom_2_X0_1; 
int atom_3_X0_1; 
int atom_4_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v15 = (v1_W0 == 1);
  atom_1_X0_1 = v15;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v2_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v16 = (v2_W0 == 1);
  atom_2_X0_1 = v16;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v3_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v17 = (v3_W0 == 1);
  atom_3_X0_1 = v17;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v4_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v18 = (v4_W0 == 1);
  atom_4_X0_1 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_3_X0_1 = 0; 
  atom_4_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);

  int v5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6 = (v5 == 3);
  int v7 = atom_1_X0_1;
  int v8 = atom_2_X0_1;
  int v9 = atom_3_X0_1;
  int v10 = atom_4_X0_1;
  int v11_conj = v9 & v10;
  int v12_conj = v8 & v11_conj;
  int v13_conj = v7 & v12_conj;
  int v14_conj = v6 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
