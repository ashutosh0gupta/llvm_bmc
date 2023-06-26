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
int atom_1_X3_0; 
int atom_1_X5_0; 
int atom_1_X6_1; 
int atom_1_X7_1; 
int atom_1_X8_0; 

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
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  int v10_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v13_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v16_W7 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v16_W7) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v19_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v40 = (v3_W0 == 1);
  atom_1_X0_1 = v40;
  int v41 = (v7_W3 == 0);
  atom_1_X3_0 = v41;
  int v42 = (v10_W5 == 0);
  atom_1_X5_0 = v42;
  int v43 = (v13_W6 == 1);
  atom_1_X6_1 = v43;
  int v44 = (v16_W7 == 1);
  atom_1_X7_1 = v44;
  int v45 = (v19_W8 == 0);
  atom_1_X8_0 = v45;
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
  atom_1_X3_0 = 0; 
  atom_1_X5_0 = 0; 
  atom_1_X6_1 = 0; 
  atom_1_X7_1 = 0; 
  atom_1_X8_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v25 = (v24 == 1);
  int v26 = atom_1_X0_1;
  int v27 = atom_1_X3_0;
  int v28 = atom_1_X5_0;
  int v29 = atom_1_X6_1;
  int v30 = atom_1_X7_1;
  int v31 = atom_1_X8_0;
  int v32_conj = v30 & v31;
  int v33_conj = v29 & v32_conj;
  int v34_conj = v28 & v33_conj;
  int v35_conj = v27 & v34_conj;
  int v36_conj = v26 & v35_conj;
  int v37_conj = v25 & v36_conj;
  int v38_conj = v23 & v37_conj;
  int v39_conj = v21 & v38_conj;
  if (v39_conj == 1) assert(0);
  return 0;
}
