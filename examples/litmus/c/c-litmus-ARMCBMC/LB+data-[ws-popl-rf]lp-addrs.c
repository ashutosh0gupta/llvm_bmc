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
int atom_0_X4_1; 
int atom_2_X0_1; 
int atom_2_X4_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W2 = v1_W0 ^ v1_W0;
  int v3_W2 = v2_W2 + 1;
  atomic_store_explicit(&vars[1], v3_W2, memory_order_relaxed);
  int v4_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W6 = v4_W4 ^ v4_W4;
  atomic_store_explicit(&vars[3+v5_W6], 1, memory_order_relaxed);
  int v24 = (v1_W0 == 1);
  atom_0_X0_1 = v24;
  int v25 = (v4_W4 == 1);
  atom_0_X4_1 = v25;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v6_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v7_W2 = v6_W0 ^ v6_W0;
  int v8_W2 = v7_W2 + 1;
  atomic_store_explicit(&vars[4], v8_W2, memory_order_relaxed);
  int v9_W4 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  int v10_W6 = v9_W4 ^ v9_W4;
  atomic_store_explicit(&vars[0+v10_W6], 1, memory_order_relaxed);
  int v26 = (v6_W0 == 1);
  atom_2_X0_1 = v26;
  int v27 = (v9_W4 == 1);
  atom_2_X4_1 = v27;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_release);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_0_X4_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_2_X4_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v11 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v14 = (v13 == 2);
  int v15 = atom_0_X0_1;
  int v16 = atom_0_X4_1;
  int v17 = atom_2_X0_1;
  int v18 = atom_2_X4_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v14 & v21_conj;
  int v23_conj = v12 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
