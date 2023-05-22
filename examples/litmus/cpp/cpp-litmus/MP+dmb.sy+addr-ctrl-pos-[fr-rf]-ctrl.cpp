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

atomic_int vars[4]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X5_0; 
atomic_int atom_1_X7_0; 
atomic_int atom_1_X8_1; 
atomic_int atom_1_X9_0; 

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
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v13_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v16_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v16_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v19_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v38 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v38, memory_order_seq_cst);
  int v39 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v39, memory_order_seq_cst);
  int v40 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v40, memory_order_seq_cst);
  int v41 = (v16_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v41, memory_order_seq_cst);
  int v42 = (v19_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v42, memory_order_seq_cst);
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
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X8_1, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v25 = (v24 == 1);
  int v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v29 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  int v30 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  int v31_conj = v29 & v30;
  int v32_conj = v28 & v31_conj;
  int v33_conj = v27 & v32_conj;
  int v34_conj = v26 & v33_conj;
  int v35_conj = v25 & v34_conj;
  int v36_conj = v23 & v35_conj;
  int v37_conj = v21 & v36_conj;
  if (v37_conj == 1) assert(0);
  return 0;
}
