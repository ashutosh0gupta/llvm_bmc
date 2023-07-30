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
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_2_X4_1; 
int atom_3_X0_1; 

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
  int v6_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v26 = (v6_W0 == 1);
  atom_1_X0_1 = v26;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v7_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v8_W2 = v7_W0 ^ v7_W0;
  int v9_W2 = v8_W2 + 1;
  atomic_store_explicit(&vars[4], v9_W2, memory_order_relaxed);
  int v10_W4 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  int v11_W6 = v10_W4 ^ v10_W4;
  atomic_store_explicit(&vars[0+v11_W6], 1, memory_order_relaxed);
  int v27 = (v7_W0 == 1);
  atom_2_X0_1 = v27;
  int v28 = (v10_W4 == 1);
  atom_2_X4_1 = v28;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_release);
  int v29 = (v12_W0 == 1);
  atom_3_X0_1 = v29;
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
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_2_X4_1 = 0; 
  atom_3_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v13 = atom_0_X0_1;
  int v14 = atom_0_X4_1;
  int v15 = atom_1_X0_1;
  int v16 = atom_2_X0_1;
  int v17 = atom_2_X4_1;
  int v18 = atom_3_X0_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v14 & v21_conj;
  int v23_conj = v13 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
