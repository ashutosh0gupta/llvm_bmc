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

long vars[3];
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X5_1; 
int atom_1_X6_1; 
int atom_1_X8_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W3 = v2_W2 ^ v2_W2;
  int v4_W3 = v3_W3 + 1;
  atomic_store_explicit(&vars[2], v4_W3, memory_order_relaxed);
  int v5_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v6_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7_W7 = v6_W6 ^ v6_W6;
  int v8_W8 = atomic_load_explicit(&vars[0+v7_W7], memory_order_relaxed);
  int v27 = (v1_W0 == 1);
  atom_1_X0_1 = v27;
  int v28 = (v2_W2 == 1);
  atom_1_X2_1 = v28;
  int v29 = (v5_W5 == 1);
  atom_1_X5_1 = v29;
  int v30 = (v6_W6 == 1);
  atom_1_X6_1 = v30;
  int v31 = (v8_W8 == 0);
  atom_1_X8_0 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X6_1 = 0; 
  atom_1_X8_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atom_1_X0_1;
  int v16 = atom_1_X2_1;
  int v17 = atom_1_X5_1;
  int v18 = atom_1_X6_1;
  int v19 = atom_1_X8_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  int v23_conj = v15 & v22_conj;
  int v24_conj = v14 & v23_conj;
  int v25_conj = v12 & v24_conj;
  int v26_conj = v10 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
