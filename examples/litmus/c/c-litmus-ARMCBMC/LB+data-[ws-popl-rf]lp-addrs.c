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

long vars[6]; 
int atom_0_X0_1; 
int atom_0_X4_1; 
int atom_2_X0_1; 
int atom_2_X4_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  int v8_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W6 = v8_W4 ^ v8_W4;
  atomic_store_explicit(&vars[3+v9_W6], 1, memory_order_relaxed);
  int v32 = (v3_W0 == 1);
  atom_0_X0_1 = v32;
  int v33 = (v8_W4 == 1);
  atom_0_X4_1 = v33;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v13_W2 = v12_W0 ^ v12_W0;
  int v14_W2 = v13_W2 + 1;
  atomic_store_explicit(&vars[4], v14_W2, memory_order_relaxed);
  int v17_W4 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  int v18_W6 = v17_W4 ^ v17_W4;
  atomic_store_explicit(&vars[0+v18_W6], 1, memory_order_relaxed);
  int v34 = (v12_W0 == 1);
  atom_2_X0_1 = v34;
  int v35 = (v17_W4 == 1);
  atom_2_X4_1 = v35;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_release);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_0_X4_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_2_X4_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v19 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v22 = (v21 == 2);
  int v23 = atom_0_X0_1;
  int v24 = atom_0_X4_1;
  int v25 = atom_2_X0_1;
  int v26 = atom_2_X4_1;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
