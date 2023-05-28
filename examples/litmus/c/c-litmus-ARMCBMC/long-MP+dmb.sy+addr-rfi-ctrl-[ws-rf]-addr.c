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
atomic_long atom_1_X5_1; 
atomic_long atom_1_X8_2; 
atomic_long atom_1_X10_0; 

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
  if (v7_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  long v10_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v11_W9 = v10_W8 ^ v10_W8;
  long v14_W10 = atomic_load_explicit(&vars[0+v11_W9], memory_order_relaxed);
  long v34 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v34, memory_order_seq_cst);
  long v35 = (v7_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v35, memory_order_seq_cst);
  long v36 = (v10_W8 == 2);
  atomic_store_explicit(&atom_1_X8_2, v36, memory_order_seq_cst);
  long v37 = (v14_W10 == 0);
  atomic_store_explicit(&atom_1_X10_0, v37, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
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
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X8_2, 0); 
  atomic_init(&atom_1_X10_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v15 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v18 = (v17 == 1);
  long v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v22 = (v21 == 1);
  long v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X8_2, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X10_0, memory_order_seq_cst);
  long v27_conj = v25 & v26;
  long v28_conj = v24 & v27_conj;
  long v29_conj = v23 & v28_conj;
  long v30_conj = v22 & v29_conj;
  long v31_conj = v20 & v30_conj;
  long v32_conj = v18 & v31_conj;
  long v33_conj = v16 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
