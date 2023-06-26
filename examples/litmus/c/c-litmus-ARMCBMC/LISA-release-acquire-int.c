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
int atom_1_X4_0; 
int atom_1_X3_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v6_W3 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v9_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v15 = (v3_W0 == 1);
  atom_1_X0_1 = v15;
  int v16 = (v9_W4 == 0);
  atom_1_X4_0 = v16;
  int v17 = (v6_W3 == 1);
  atom_1_X3_1 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X4_0 = 0; 
  atom_1_X3_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atom_1_X0_1;
  int v11 = atom_1_X4_0;
  int v12 = atom_1_X3_1;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
