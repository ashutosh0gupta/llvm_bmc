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
int atom_0_X2_1; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = atomic_load_explicit(&vars[1+v4_W3], memory_order_relaxed);
  int v10_W6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11_W7 = v10_W6 ^ v10_W6;
  atomic_store_explicit(&vars[2+v11_W7], 1, memory_order_relaxed);
  int v24 = (v3_W2 == 1);
  atom_0_X2_1 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  int v14_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v14_W2 == 0);
  atom_1_X2_0 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X2_1 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19 = atom_0_X2_1;
  int v20 = atom_1_X2_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v16 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
