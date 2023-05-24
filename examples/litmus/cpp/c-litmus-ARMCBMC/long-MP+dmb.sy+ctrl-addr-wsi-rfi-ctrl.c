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

atomic_long vars[4]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X8_2; 
atomic_long atom_1_X9_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v7_W4 = v6_W2 ^ v6_W2;
  atomic_store_explicit(&vars[3+v7_W4], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
  long v10_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v10_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  long v13_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v28 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v28, memory_order_seq_cst);
  long v29 = (v10_W8 == 2);
  atomic_store_explicit(&atom_1_X8_2, v29, memory_order_seq_cst);
  long v30 = (v13_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v30, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X8_2, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v14 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v15 = (v14 == 2);
  long v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v17 = (v16 == 1);
  long v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X8_2, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  long v23_conj = v21 & v22;
  long v24_conj = v20 & v23_conj;
  long v25_conj = v19 & v24_conj;
  long v26_conj = v17 & v25_conj;
  long v27_conj = v15 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
