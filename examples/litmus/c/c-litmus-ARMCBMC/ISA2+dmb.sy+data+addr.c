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
int atom_2_X0_1; 
int atom_2_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[2], v5_W2, memory_order_relaxed);
  int v18 = (v3_W0 == 1);
  atom_1_X0_1 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v8_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W2 = v8_W0 ^ v8_W0;
  int v12_W3 = atomic_load_explicit(&vars[0+v9_W2], memory_order_relaxed);
  int v19 = (v8_W0 == 1);
  atom_2_X0_1 = v19;
  int v20 = (v12_W3 == 0);
  atom_2_X3_0 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_2_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v13 = atom_1_X0_1;
  int v14 = atom_2_X0_1;
  int v15 = atom_2_X3_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
