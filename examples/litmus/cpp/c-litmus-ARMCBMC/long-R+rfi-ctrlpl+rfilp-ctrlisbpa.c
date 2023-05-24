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

atomic_long vars[2]; 
atomic_long atom_0_X5_2; 
atomic_long atom_0_X2_1; 
atomic_long atom_1_X2_2; 
atomic_long atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  long v6_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v26 = (v6_W5 == 2);
  atomic_store_explicit(&atom_0_X5_2, v26, memory_order_seq_cst);
  long v27 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v27, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  long v9_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v9_W2) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  long v12_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v28 = (v9_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v28, memory_order_seq_cst);
  long v29 = (v12_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v29, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X5_2, 0); 
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X3_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 1);
  long v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&atom_0_X5_2, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v21_conj = v19 & v20;
  long v22_conj = v18 & v21_conj;
  long v23_conj = v17 & v22_conj;
  long v24_conj = v16 & v23_conj;
  long v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
