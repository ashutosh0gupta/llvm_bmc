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
atomic_long atom_1_X2_2; 
atomic_long atom_1_X8_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W3 = v3_W2 ^ v3_W2;
  long v7_W4 = atomic_load_explicit(&vars[2+v4_W3], memory_order_relaxed);
  if (v7_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v10_W6 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v10_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  long v13_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v23 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v23, memory_order_seq_cst);
  long v24 = (v13_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v24, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v15 = (v14 == 1);
  long v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  long v20_conj = v18 & v19;
  long v21_conj = v17 & v20_conj;
  long v22_conj = v15 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
