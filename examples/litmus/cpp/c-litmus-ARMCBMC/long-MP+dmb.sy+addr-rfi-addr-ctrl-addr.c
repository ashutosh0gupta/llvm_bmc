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

atomic_long vars[5]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X5_1; 
atomic_long atom_1_X12_0; 

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
  long v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  long v7_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v8_W6 = v7_W5 ^ v7_W5;
  long v11_W7 = atomic_load_explicit(&vars[3+v8_W6], memory_order_relaxed);
  if (v11_W7) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v14_W9 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  long v15_W11 = v14_W9 ^ v14_W9;
  long v18_W12 = atomic_load_explicit(&vars[0+v15_W11], memory_order_relaxed);
  long v33 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v33, memory_order_seq_cst);
  long v34 = (v7_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v34, memory_order_seq_cst);
  long v35 = (v18_W12 == 0);
  atomic_store_explicit(&atom_1_X12_0, v35, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X12_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v22 = (v21 == 1);
  long v23 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v24 = (v23 == 1);
  long v25 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X12_0, memory_order_seq_cst);
  long v28_conj = v26 & v27;
  long v29_conj = v25 & v28_conj;
  long v30_conj = v24 & v29_conj;
  long v31_conj = v22 & v30_conj;
  long v32_conj = v20 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
