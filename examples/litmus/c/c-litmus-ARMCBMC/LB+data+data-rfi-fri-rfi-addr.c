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
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_1_X4_1; 
int atom_1_X6_2; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  int v28 = (v3_W0 == 1);
  atom_0_X0_1 = v28;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9_W2 = v8_W0 ^ v8_W0;
  int v10_W2 = v9_W2 + 1;
  atomic_store_explicit(&vars[2], v10_W2, memory_order_relaxed);
  int v13_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  int v16_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v17_W7 = v16_W6 ^ v16_W6;
  atomic_store_explicit(&vars[0+v17_W7], 1, memory_order_relaxed);
  int v29 = (v8_W0 == 1);
  atom_1_X0_1 = v29;
  int v30 = (v13_W4 == 1);
  atom_1_X4_1 = v30;
  int v31 = (v16_W6 == 2);
  atom_1_X6_2 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v19 = (v18 == 2);
  int v20 = atom_0_X0_1;
  int v21 = atom_1_X0_1;
  int v22 = atom_1_X4_1;
  int v23 = atom_1_X6_2;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
