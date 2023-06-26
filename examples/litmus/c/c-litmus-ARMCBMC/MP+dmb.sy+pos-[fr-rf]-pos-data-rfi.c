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
int atom_1_X3_2; 
int atom_1_X4_2; 
int atom_1_X7_1; 

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
  int v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v13_W5 = v12_W4 ^ v12_W4;
  int v14_W5 = v13_W5 + 1;
  atomic_store_explicit(&vars[0], v14_W5, memory_order_relaxed);
  int v17_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v33 = (v3_W0 == 1);
  atom_1_X0_1 = v33;
  int v34 = (v6_W2 == 1);
  atom_1_X2_1 = v34;
  int v35 = (v9_W3 == 2);
  atom_1_X3_2 = v35;
  int v36 = (v12_W4 == 2);
  atom_1_X4_2 = v36;
  int v37 = (v17_W7 == 1);
  atom_1_X7_1 = v37;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X3_2 = 0; 
  atom_1_X4_2 = 0; 
  atom_1_X7_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v18 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v21 = (v20 == 2);
  int v22 = atom_1_X0_1;
  int v23 = atom_1_X2_1;
  int v24 = atom_1_X3_2;
  int v25 = atom_1_X4_2;
  int v26 = atom_1_X7_1;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v21 & v30_conj;
  int v32_conj = v19 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
