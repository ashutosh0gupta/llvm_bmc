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
int atom_1_X6_0; 
int atom_1_X8_1; 
int atom_1_X10_0; 

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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10_W5 = v9_W4 ^ v9_W4;
  int v13_W6 = atomic_load_explicit(&vars[3+v10_W5], memory_order_relaxed);
  int v16_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v17_W9 = v16_W8 ^ v16_W8;
  int v20_W10 = atomic_load_explicit(&vars[0+v17_W9], memory_order_relaxed);
  int v37 = (v3_W0 == 1);
  atom_1_X0_1 = v37;
  int v38 = (v13_W6 == 0);
  atom_1_X6_0 = v38;
  int v39 = (v16_W8 == 1);
  atom_1_X8_1 = v39;
  int v40 = (v20_W10 == 0);
  atom_1_X10_0 = v40;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X8_1 = 0; 
  atom_1_X10_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v21 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v23 == 1);
  int v25 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v26 = (v25 == 1);
  int v27 = atom_1_X0_1;
  int v28 = atom_1_X6_0;
  int v29 = atom_1_X8_1;
  int v30 = atom_1_X10_0;
  int v31_conj = v29 & v30;
  int v32_conj = v28 & v31_conj;
  int v33_conj = v27 & v32_conj;
  int v34_conj = v26 & v33_conj;
  int v35_conj = v24 & v34_conj;
  int v36_conj = v22 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
