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
int atom_0_X3_3; 
int atom_1_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v3_W3 == 3);
  atom_0_X3_3 = v19;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 3, memory_order_release);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v6_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W6 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v20 = (v9_W6 == 0);
  atom_1_X6_0 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_3 = 0; 
  atom_1_X6_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v11 = (v10 == 3);
  int v12 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v13 = (v12 == 1);
  int v14 = atom_0_X3_3;
  int v15 = atom_1_X6_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v11 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
