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
atomic_long atom_1_X4_1; 
atomic_long atom_1_X9_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v6_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  long v9_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v10_W7 = v9_W5 ^ v9_W5;
  long v11_W7 = v10_W7 + 1;
  atomic_store_explicit(&vars[0], v11_W7, memory_order_relaxed);
  long v14_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v29 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v29, memory_order_seq_cst);
  long v30 = (v6_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v30, memory_order_seq_cst);
  long v31 = (v14_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v31, memory_order_seq_cst);
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
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v18 = (v17 == 1);
  long v19 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  long v24_conj = v22 & v23;
  long v25_conj = v21 & v24_conj;
  long v26_conj = v20 & v25_conj;
  long v27_conj = v18 & v26_conj;
  long v28_conj = v16 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
