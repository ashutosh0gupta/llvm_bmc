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
int atom_0_X7_2; 
int atom_0_X2_3; 
int atom_1_X3_3; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = atomic_load_explicit(&vars[1+v4_W3], memory_order_relaxed);
  int v8_W6 = v7_W4 ^ v7_W4;
  int v9_W6 = v8_W6 + 1;
  atomic_store_explicit(&vars[0], v9_W6, memory_order_release);
  int v12_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v29 = (v12_W7 == 2);
  atom_0_X7_2 = v29;
  int v30 = (v3_W2 == 3);
  atom_0_X2_3 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v18_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v18_W3 == 3);
  atom_1_X3_3 = v31;
  int v32 = (v15_W2 == 2);
  atom_1_X2_2 = v32;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X7_2 = 0; 
  atom_0_X2_3 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v20 = (v19 == 3);
  int v21 = atom_0_X7_2;
  int v22 = atom_0_X2_3;
  int v23 = atom_1_X3_3;
  int v24 = atom_1_X2_2;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
