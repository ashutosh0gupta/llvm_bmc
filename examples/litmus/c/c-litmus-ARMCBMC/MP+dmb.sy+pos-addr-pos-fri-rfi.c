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

long vars[2]; 
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X4_0; 
int atom_1_X6_0; 
int atom_1_X8_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = atomic_load_explicit(&vars[0+v7_W3], memory_order_relaxed);
  int v13_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v16_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v32 = (v3_W0 == 1);
  atom_1_X0_1 = v32;
  int v33 = (v6_W2 == 1);
  atom_1_X2_1 = v33;
  int v34 = (v10_W4 == 0);
  atom_1_X4_0 = v34;
  int v35 = (v13_W6 == 0);
  atom_1_X6_0 = v35;
  int v36 = (v16_W8 == 1);
  atom_1_X8_1 = v36;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X4_0 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X8_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atom_1_X0_1;
  int v22 = atom_1_X2_1;
  int v23 = atom_1_X4_0;
  int v24 = atom_1_X6_0;
  int v25 = atom_1_X8_1;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v20 & v29_conj;
  int v31_conj = v18 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
