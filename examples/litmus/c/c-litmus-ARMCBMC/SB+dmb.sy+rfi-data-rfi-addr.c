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

long vars[3]; 
int atom_0_X2_0; 
int atom_1_X2_1; 
int atom_1_X5_1; 
int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v32 = (v3_W2 == 0);
  atom_0_X2_0 = v32;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  int v8_W3 = v7_W3 + 1;
  atomic_store_explicit(&vars[2], v8_W3, memory_order_relaxed);
  int v11_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12_W6 = v11_W5 ^ v11_W5;
  int v15_W7 = atomic_load_explicit(&vars[0+v12_W6], memory_order_relaxed);
  int v33 = (v6_W2 == 1);
  atom_1_X2_1 = v33;
  int v34 = (v11_W5 == 1);
  atom_1_X5_1 = v34;
  int v35 = (v15_W7 == 0);
  atom_1_X7_0 = v35;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_0 = 0; 
  atom_1_X2_1 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v19 = (v18 == 1);
  int v20 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atom_0_X2_0;
  int v23 = atom_1_X2_1;
  int v24 = atom_1_X5_1;
  int v25 = atom_1_X7_0;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v19 & v29_conj;
  int v31_conj = v17 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
