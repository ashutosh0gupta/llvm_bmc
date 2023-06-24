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

long vars[4]; 
int atom_1_X0_1; 
int atom_1_X11_1; 

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
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  int v10_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11_W6 = v10_W5 ^ v10_W5;
  int v14_W7 = atomic_load_explicit(&vars[3+v11_W6], memory_order_relaxed);
  int v15_W9 = v14_W7 ^ v14_W7;
  int v16_W9 = v15_W9 + 1;
  atomic_store_explicit(&vars[0], v16_W9, memory_order_relaxed);
  int v19_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v29 = (v3_W0 == 1);
  atom_1_X0_1 = v29;
  int v30 = (v19_W11 == 1);
  atom_1_X11_1 = v30;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X11_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v20 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v20 == 2);
  int v22 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atom_1_X0_1;
  int v25 = atom_1_X11_1;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v21 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
