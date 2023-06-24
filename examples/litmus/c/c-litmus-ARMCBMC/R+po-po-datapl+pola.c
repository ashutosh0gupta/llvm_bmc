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
int atom_0_X8_2; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v3_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W6 = v3_W4 ^ v3_W4;
  int v5_W6 = v4_W6 + 1;
  atomic_store_explicit(&vars[3], v5_W6, memory_order_release);
  int v8_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v24 = (v8_W8 == 2);
  atom_0_X8_2 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[3], 2, memory_order_release);
  int v11_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v25 = (v11_W2 == 0);
  atom_1_X2_0 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X8_2 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v13 = (v12 == 2);
  int v14 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v17 = (v16 == 1);
  int v18 = atom_0_X8_2;
  int v19 = atom_1_X2_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v15 & v21_conj;
  int v23_conj = v13 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
