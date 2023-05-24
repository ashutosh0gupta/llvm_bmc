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
atomic_long atom_0_X2_1; 
atomic_long atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v7_W5 = v6_W3 ^ v6_W3;
  long v10_W6 = atomic_load_explicit(&vars[2+v7_W5], memory_order_relaxed);
  long v11_W8 = v10_W6 ^ v10_W6;
  long v12_W8 = v11_W8 + 1;
  atomic_store_explicit(&vars[3], v12_W8, memory_order_relaxed);
  long v25 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v25, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
  dmbsy();
  long v15_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v26 = (v15_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v26, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v16 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  long v22_conj = v20 & v21;
  long v23_conj = v19 & v22_conj;
  long v24_conj = v17 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
