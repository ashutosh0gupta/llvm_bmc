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
atomic_long atom_1_X2_1; 
atomic_long atom_1_X8_0; 

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
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v9_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v12_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v12_W5) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  long v15_W6 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v15_W6) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  isb();
  long v18_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v30 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v30, memory_order_seq_cst);
  long v31 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v31, memory_order_seq_cst);
  long v32 = (v18_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v32, memory_order_seq_cst);
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
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v22 = (v21 == 1);
  long v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  long v26_conj = v24 & v25;
  long v27_conj = v23 & v26_conj;
  long v28_conj = v22 & v27_conj;
  long v29_conj = v20 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
