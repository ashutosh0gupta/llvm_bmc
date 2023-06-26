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
  int v3_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  dmbsy();
  int v6_W3 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v9_W5 = atomic_load_explicit(&vars[1], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v60 = (v3_W0 == 1);
  atom_0_X0_1 = v60;
  int v65 = (v6_W3 == 1);
  atom_0_X3_1 = v65;
  int v67 = (v9_W5 == 1);
  atom_0_X5_1 = v67;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_acquire);
  int v15_W2 = atomic_load_explicit(&vars[6], memory_order_acquire);
  int v18_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v61 = (v18_W4 == 1);
  atom_1_X4_1 = v61;
  int v64 = (v12_W0 == 1);
  atom_1_X0_1 = v64;
  int v68 = (v15_W2 == 1);
  atom_1_X2_1 = v68;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v21_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[6], 1, memory_order_release);
  dmbsy();
  int v24_W3 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v27_W5 = atomic_load_explicit(&vars[1], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[7], 1, memory_order_relaxed);
  int v62 = (v21_W0 == 1);
  atom_2_X0_1 = v62;
  int v69 = (v24_W3 == 1);
  atom_2_X3_1 = v69;
  int v71 = (v27_W5 == 1);
  atom_2_X5_1 = v71;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v30_W0 = atomic_load_explicit(&vars[3], memory_order_acquire);
  int v33_W2 = atomic_load_explicit(&vars[6], memory_order_acquire);
  int v36_W4 = atomic_load_explicit(&vars[7], memory_order_relaxed);
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v63 = (v36_W4 == 1);
  atom_3_X4_1 = v63;
  int v66 = (v30_W0 == 1);
  atom_3_X0_1 = v66;
  int v70 = (v33_W2 == 1);
  atom_3_X2_1 = v70;
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

  int v37 = atom_0_X0_1;
  int v38 = atom_1_X4_1;
  int v39 = atom_2_X0_1;
  int v40 = atom_3_X4_1;
  int v41 = atom_1_X0_1;
  int v42 = atom_0_X3_1;
  int v43_disj = v41 | v42;
  int v44 = atom_3_X0_1;
  int v45 = atom_0_X5_1;
  int v46_disj = v44 | v45;
  int v47 = atom_1_X2_1;
  int v48 = atom_2_X3_1;
  int v49_disj = v47 | v48;
  int v50 = atom_3_X2_1;
  int v51 = atom_2_X5_1;
  int v52_disj = v50 | v51;
  int v53_conj = v49_disj & v52_disj;
  int v54_conj = v46_disj & v53_conj;
  int v55_conj = v43_disj & v54_conj;
  int v56_conj = v40 & v55_conj;
  int v57_conj = v39 & v56_conj;
  int v58_conj = v38 & v57_conj;
  int v59_conj = v37 & v58_conj;
  if (v59_conj == 1) assert(0);
  return 0;
}
