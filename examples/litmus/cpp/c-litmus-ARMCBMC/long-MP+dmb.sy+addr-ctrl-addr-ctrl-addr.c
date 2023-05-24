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

atomic_long vars[6]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X13_0; 

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
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v10_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v11_W7 = v10_W5 ^ v10_W5;
  long v14_W8 = atomic_load_explicit(&vars[4+v11_W7], memory_order_relaxed);
  if (v14_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  long v17_W10 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  long v18_W12 = v17_W10 ^ v17_W10;
  long v21_W13 = atomic_load_explicit(&vars[0+v18_W12], memory_order_relaxed);
  long v31 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v31, memory_order_seq_cst);
  long v32 = (v21_W13 == 0);
  atomic_store_explicit(&atom_1_X13_0, v32, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X13_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v22 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v23 = (v22 == 1);
  long v24 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v25 = (v24 == 1);
  long v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X13_0, memory_order_seq_cst);
  long v28_conj = v26 & v27;
  long v29_conj = v25 & v28_conj;
  long v30_conj = v23 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
