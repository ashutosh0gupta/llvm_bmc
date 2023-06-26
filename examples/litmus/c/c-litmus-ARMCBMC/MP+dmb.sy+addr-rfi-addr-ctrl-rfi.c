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
int atom_1_X0_1; 
int atom_1_X5_1; 
int atom_1_X11_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  int v7_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v8_W6 = v7_W5 ^ v7_W5;
  int v11_W7 = atomic_load_explicit(&vars[3+v8_W6], memory_order_relaxed);
  if (v11_W7) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v14_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v29 = (v3_W0 == 1);
  atom_1_X0_1 = v29;
  int v30 = (v7_W5 == 1);
  atom_1_X5_1 = v30;
  int v31 = (v14_W11 == 1);
  atom_1_X11_1 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X11_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atom_1_X0_1;
  int v22 = atom_1_X5_1;
  int v23 = atom_1_X11_1;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v18 & v26_conj;
  int v28_conj = v16 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
