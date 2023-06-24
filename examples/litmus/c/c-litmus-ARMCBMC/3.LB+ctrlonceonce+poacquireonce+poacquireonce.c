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
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label69; else goto lbl_label69;
lbl_label69:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v16 = (v3_W0 == 1);
  atom_0_X0_1 = v16;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v7_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v17 = (v7_W0 == 1);
  atom_1_X0_1 = v17;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v10_W0 = atomic_load_explicit(&vars[2], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v18 = (v10_W0 == 1);
  atom_2_X0_1 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v11 = atom_0_X0_1;
  int v12 = atom_1_X0_1;
  int v13 = atom_2_X0_1;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
