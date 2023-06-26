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
int atom_0_X5_1; 
int atom_2_X4_3; 
int atom_1_X2_4; 
int atom_1_X4_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v3_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  int v20 = (v3_W5 == 1);
  atom_0_X5_1 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v9_W4 = atomic_load_explicit(&vars[1], memory_order_acquire);
  int v22 = (v6_W2 == 4);
  atom_1_X2_4 = v22;
  int v23 = (v9_W4 == 1);
  atom_1_X4_1 = v23;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v12_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v12_W4 == 3);
  atom_2_X4_3 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X5_1 = 0; 
  atom_2_X4_3 = 0; 
  atom_1_X2_4 = 0; 
  atom_1_X4_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v13 = atom_0_X5_1;
  int v14 = atom_2_X4_3;
  int v15 = atom_1_X2_4;
  int v16 = atom_1_X4_1;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
