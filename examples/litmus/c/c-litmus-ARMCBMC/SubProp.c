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

int vars[4]; 
int atom_1_X5_1; 
int atom_2_X4_2; 
int atom_2_X5_1; 
int atom_2_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 0, memory_order_release);
  atomic_store_explicit(&vars[2], 0, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 0, memory_order_release);
  int v1_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v2_W7 = v1_W5 ^ v1_W5;
  atomic_store_explicit(&vars[3+v2_W7], 0, memory_order_relaxed);
  int v18 = (v1_W5 == 1);
  atom_1_X5_1 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v3_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W7 = v3_W4 ^ v3_W4;
  int v5_W5 = atomic_load_explicit(&vars[3+v4_W7], memory_order_relaxed);
  int v6_W8 = v5_W5 ^ v5_W5;
  int v7_W6 = atomic_load_explicit(&vars[0+v6_W8], memory_order_relaxed);
  int v19 = (v3_W4 == 2);
  atom_2_X4_2 = v19;
  int v20 = (v5_W5 == 1);
  atom_2_X5_1 = v20;
  int v21 = (v7_W6 == 0);
  atom_2_X6_0 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X5_1 = 0; 
  atom_2_X4_2 = 0; 
  atom_2_X5_1 = 0; 
  atom_2_X6_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v8 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_1_X5_1;
  int v11 = atom_2_X4_2;
  int v12 = atom_2_X5_1;
  int v13 = atom_2_X6_0;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  int v16_conj = v10 & v15_conj;
  int v17_conj = v9 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
