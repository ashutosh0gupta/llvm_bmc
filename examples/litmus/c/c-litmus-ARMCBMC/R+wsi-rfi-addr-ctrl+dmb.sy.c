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
int atom_0_X3_2; 
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W4 = v3_W3 ^ v3_W3;
  int v7_W5 = atomic_load_explicit(&vars[1+v4_W4], memory_order_relaxed);
  if (v7_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v20 = (v3_W3 == 2);
  atom_0_X3_2 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  int v10_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v10_W2 == 0);
  atom_1_X2_0 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_2 = 0; 
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v14 = (v13 == 2);
  int v15 = atom_0_X3_2;
  int v16 = atom_1_X2_0;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v12 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
