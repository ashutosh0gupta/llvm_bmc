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
int atom_1_X0_1; 
int atom_1_X2_1; 
int atom_1_X5_1; 
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
  int v8_W3 = v7_W3 + 1;
  atomic_store_explicit(&vars[2], v8_W3, memory_order_relaxed);
  int v11_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12_W6 = v11_W5 ^ v11_W5;
  int v13_W6 = v12_W6 + 1;
  atomic_store_explicit(&vars[0], v13_W6, memory_order_relaxed);
  int v16_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v33 = (v3_W0 == 1);
  atom_1_X0_1 = v33;
  int v34 = (v6_W2 == 1);
  atom_1_X2_1 = v34;
  int v35 = (v11_W5 == 1);
  atom_1_X5_1 = v35;
  int v36 = (v16_W8 == 1);
  atom_1_X8_1 = v36;
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
  atom_1_X8_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atom_1_X0_1;
  int v24 = atom_1_X2_1;
  int v25 = atom_1_X5_1;
  int v26 = atom_1_X8_1;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  int v32_conj = v18 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
