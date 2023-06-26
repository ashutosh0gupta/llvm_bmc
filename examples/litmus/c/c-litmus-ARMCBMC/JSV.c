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
int atom_1_X2_1; 
int atom_1_X4_1; 
int atom_1_X6_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v3_X2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v6_X4 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v9_X6 = atomic_load_explicit(&vars[1], memory_order_acquire);
  int v24 = (v3_X2 == 1);
  atom_1_X2_1 = v24;
  int v25 = (v6_X4 == 1);
  atom_1_X4_1 = v25;
  int v26 = (v9_X6 == 2);
  atom_1_X6_2 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X2_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v11 = (v10 == 2);
  int v12 = atom_1_X2_1;
  int v13 = atom_1_X4_1;
  int v14 = atom_1_X6_2;
  int v15 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 2);
  int v19_disj = v16 | v18;
  int v20_conj = v14 & v19_disj;
  int v21_conj = v13 & v20_conj;
  int v22_conj = v12 & v21_conj;
  int v23_conj = v11 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
