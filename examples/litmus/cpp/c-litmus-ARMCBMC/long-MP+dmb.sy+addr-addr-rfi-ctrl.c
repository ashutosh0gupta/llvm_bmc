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
atomic_long atom_1_X8_1; 
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
  long v4_W2 = v3_W0 ^ v3_W0;
  long v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  long v8_W5 = v7_W3 ^ v7_W3;
  atomic_store_explicit(&vars[3+v8_W5], 1, memory_order_relaxed);
  long v11_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v11_W8) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v14_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v29 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v29, memory_order_seq_cst);
  long v30 = (v11_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v30, memory_order_seq_cst);
  long v31 = (v14_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v31, memory_order_seq_cst);
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
  atomic_init(&atom_1_X8_1, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v15 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v16 = (v15 == 1);
  long v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v18 = (v17 == 1);
  long v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  long v24_conj = v22 & v23;
  long v25_conj = v21 & v24_conj;
  long v26_conj = v20 & v25_conj;
  long v27_conj = v18 & v26_conj;
  long v28_conj = v16 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
