/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[1]; 
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
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v48 = (v6_W3 == 2);
  atom_0_X3_2 = v48;
  int v49 = (v3_W2 == 2);
  atom_0_X2_2 = v49;
  int v50 = (v3_W2 == 1);
  atom_0_X2_1 = v50;
  int v51 = (v6_W3 == 1);
  atom_0_X3_1 = v51;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v9_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v46 = (v12_W3 == 2);
  atom_1_X3_2 = v46;
  int v47 = (v9_W2 == 2);
  atom_1_X2_2 = v47;
  int v52 = (v12_W3 == 1);
  atom_1_X3_1 = v52;
  int v53 = (v9_W2 == 1);
  atom_1_X2_1 = v53;
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

  int v13 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v14 = (v13 == 2);
  int v15 = atom_1_X3_2;
  int v16 = atom_1_X2_2;
  int v17 = atom_0_X3_2;
  int v18 = atom_0_X2_2;
  int v19 = atom_0_X2_1;
  int v20_disj = v18 | v19;
  int v21_conj = v17 & v20_disj;
  int v22 = atom_0_X3_1;
  int v23 = atom_0_X2_1;
  int v24_conj = v22 & v23;
  int v25_disj = v21_conj | v24_conj;
  int v26_conj = v16 & v25_disj;
  int v27_conj = v15 & v26_conj;
  int v28_conj = v14 & v27_conj;
  int v29 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v29 == 1);
  int v31 = atom_0_X3_1;
  int v32 = atom_0_X2_1;
  int v33 = atom_1_X3_2;
  int v34 = atom_1_X2_2;
  int v35_conj = v33 & v34;
  int v36 = atom_1_X3_1;
  int v37 = atom_1_X2_2;
  int v38 = atom_1_X2_1;
  int v39_disj = v37 | v38;
  int v40_conj = v36 & v39_disj;
  int v41_disj = v35_conj | v40_conj;
  int v42_conj = v32 & v41_disj;
  int v43_conj = v31 & v42_conj;
  int v44_conj = v30 & v43_conj;
  int v45_disj = v28_conj | v44_conj;
  if (v45_disj == 0) assert(0);
  return 0;
}
