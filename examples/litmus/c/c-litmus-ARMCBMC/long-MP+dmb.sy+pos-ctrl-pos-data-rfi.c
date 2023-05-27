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

atomic_long vars[3]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X2_1; 
atomic_long atom_1_X8_1; 

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
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v9_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v12_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v13_W6 = v12_W5 ^ v12_W5;
  long v14_W6 = v13_W6 + 1;
  atomic_store_explicit(&vars[0], v14_W6, memory_order_relaxed);
  long v17_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v29 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v29, memory_order_seq_cst);
  long v30 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v30, memory_order_seq_cst);
  long v31 = (v17_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v31, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X8_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v18 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v19 = (v18 == 2);
  long v20 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  long v25_conj = v23 & v24;
  long v26_conj = v22 & v25_conj;
  long v27_conj = v21 & v26_conj;
  long v28_conj = v19 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
