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
// ARM-CBMC specific functions to support exclusive accesses
void ldx(int *);
void ldax(int *);
void stx(int *, int);
void stlx(int *, int);

int vars[1]; 
int atom_1_X3_2; 
int atom_1_X2_2; 
int atom_0_X3_2; 
int atom_0_X2_2; 
int atom_0_X2_1; 
int atom_0_X3_1; 
int atom_1_X3_1; 
int atom_1_X2_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v2_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v40 = (v2_W3 == 2);
  atom_0_X3_2 = v40;
  int v41 = (v1_W2 == 2);
  atom_0_X2_2 = v41;
  int v42 = (v1_W2 == 1);
  atom_0_X2_1 = v42;
  int v43 = (v2_W3 == 1);
  atom_0_X3_1 = v43;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v38 = (v4_W3 == 2);
  atom_1_X3_2 = v38;
  int v39 = (v3_W2 == 2);
  atom_1_X2_2 = v39;
  int v44 = (v4_W3 == 1);
  atom_1_X3_1 = v44;
  int v45 = (v3_W2 == 1);
  atom_1_X2_1 = v45;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[0], 0);
  atom_1_X3_2 = 0; 
  atom_1_X2_2 = 0; 
  atom_0_X3_2 = 0; 
  atom_0_X2_2 = 0; 
  atom_0_X2_1 = 0; 
  atom_0_X3_1 = 0; 
  atom_1_X3_1 = 0; 
  atom_1_X2_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atom_1_X3_2;
  int v8 = atom_1_X2_2;
  int v9 = atom_0_X3_2;
  int v10 = atom_0_X2_2;
  int v11 = atom_0_X2_1;
  int v12_disj = v10 | v11;
  int v13_conj = v9 & v12_disj;
  int v14 = atom_0_X3_1;
  int v15 = atom_0_X2_1;
  int v16_conj = v14 & v15;
  int v17_disj = v13_conj | v16_conj;
  int v18_conj = v8 & v17_disj;
  int v19_conj = v7 & v18_conj;
  int v20_conj = v6 & v19_conj;
  int v21 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v21 == 1);
  int v23 = atom_0_X3_1;
  int v24 = atom_0_X2_1;
  int v25 = atom_1_X3_2;
  int v26 = atom_1_X2_2;
  int v27_conj = v25 & v26;
  int v28 = atom_1_X3_1;
  int v29 = atom_1_X2_2;
  int v30 = atom_1_X2_1;
  int v31_disj = v29 | v30;
  int v32_conj = v28 & v31_disj;
  int v33_disj = v27_conj | v32_conj;
  int v34_conj = v24 & v33_disj;
  int v35_conj = v23 & v34_conj;
  int v36_conj = v22 & v35_conj;
  int v37_disj = v20_conj | v36_conj;
  if (v37_disj == 0) assert(0);
  return 0;
}
