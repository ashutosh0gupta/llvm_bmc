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
int atom_1_X2_1; 
int atom_1_X3_0; 
int atom_1_X5_1; 
int atom_1_X8_1; 

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
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v13_W6 = v12_W5 ^ v12_W5;
  int v14_W6 = v13_W6 + 1;
  atomic_store_explicit(&vars[0], v14_W6, memory_order_relaxed);
  int v17_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v36 = (v3_W0 == 1);
  atom_1_X0_1 = v36;
  int v37 = (v6_W2 == 1);
  atom_1_X2_1 = v37;
  int v38 = (v9_W3 == 0);
  atom_1_X3_0 = v38;
  int v39 = (v12_W5 == 1);
  atom_1_X5_1 = v39;
  int v40 = (v17_W8 == 1);
  atom_1_X8_1 = v40;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
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
  atom_1_X2_1 = 0; 
  atom_1_X3_0 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X8_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v18 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atom_1_X0_1;
  int v25 = atom_1_X2_1;
  int v26 = atom_1_X3_0;
  int v27 = atom_1_X5_1;
  int v28 = atom_1_X8_1;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v23 & v32_conj;
  int v34_conj = v21 & v33_conj;
  int v35_conj = v19 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
