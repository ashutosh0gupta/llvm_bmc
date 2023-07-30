vars[2]
vars[1]
vars[3]
vars[6]
vars[2]
vars[1]
vars[3]
vars[6]
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

long vars[8]; 
int atom_0_X0_1; 
int atom_1_X4_1; 
int atom_2_X0_1; 
int atom_3_X4_1; 
int atom_1_X0_1; 
int atom_0_X3_1; 
int atom_3_X0_1; 
int atom_0_X5_1; 
int atom_1_X2_1; 
int atom_2_X3_1; 
int atom_3_X2_1; 
int atom_2_X5_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  dmbsy();
  int v2_W3 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v3_W5 = atomic_load_explicit(&vars[1], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v36 = (v1_W0 == 1);
  atom_0_X0_1 = v36;
  int v41 = (v2_W3 == 1);
  atom_0_X3_1 = v41;
  int v43 = (v3_W5 == 1);
  atom_0_X5_1 = v43;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v4_W0 = atomic_load_explicit(&vars[3], memory_order_acquire);
  int v5_W2 = atomic_load_explicit(&vars[6], memory_order_acquire);
  int v6_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v37 = (v6_W4 == 1);
  atom_1_X4_1 = v37;
  int v40 = (v4_W0 == 1);
  atom_1_X0_1 = v40;
  int v44 = (v5_W2 == 1);
  atom_1_X2_1 = v44;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v7_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[6], 1, memory_order_release);
  dmbsy();
  int v8_W3 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v9_W5 = atomic_load_explicit(&vars[1], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[7], 1, memory_order_relaxed);
  int v38 = (v7_W0 == 1);
  atom_2_X0_1 = v38;
  int v45 = (v8_W3 == 1);
  atom_2_X3_1 = v45;
  int v47 = (v9_W5 == 1);
  atom_2_X5_1 = v47;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v10_W0 = atomic_load_explicit(&vars[3], memory_order_acquire);
  int v11_W2 = atomic_load_explicit(&vars[6], memory_order_acquire);
  int v12_W4 = atomic_load_explicit(&vars[7], memory_order_relaxed);
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v39 = (v12_W4 == 1);
  atom_3_X4_1 = v39;
  int v42 = (v10_W0 == 1);
  atom_3_X0_1 = v42;
  int v46 = (v11_W2 == 1);
  atom_3_X2_1 = v46;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[7], 0);
  atomic_init(&vars[6], 0);
  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_3_X4_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_0_X3_1 = 0; 
  atom_3_X0_1 = 0; 
  atom_0_X5_1 = 0; 
  atom_1_X2_1 = 0; 
  atom_2_X3_1 = 0; 
  atom_3_X2_1 = 0; 
  atom_2_X5_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v13 = atom_0_X0_1;
  int v14 = atom_1_X4_1;
  int v15 = atom_2_X0_1;
  int v16 = atom_3_X4_1;
  int v17 = atom_1_X0_1;
  int v18 = atom_0_X3_1;
  int v19_disj = v17 | v18;
  int v20 = atom_3_X0_1;
  int v21 = atom_0_X5_1;
  int v22_disj = v20 | v21;
  int v23 = atom_1_X2_1;
  int v24 = atom_2_X3_1;
  int v25_disj = v23 | v24;
  int v26 = atom_3_X2_1;
  int v27 = atom_2_X5_1;
  int v28_disj = v26 | v27;
  int v29_conj = v25_disj & v28_disj;
  int v30_conj = v22_disj & v29_conj;
  int v31_conj = v19_disj & v30_conj;
  int v32_conj = v16 & v31_conj;
  int v33_conj = v15 & v32_conj;
  int v34_conj = v14 & v33_conj;
  int v35_conj = v13 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
