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
atomic_long atom_1_X2_2; 
atomic_long atom_1_X5_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v6_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v6_W5) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v19 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v19, memory_order_seq_cst);
  long v20 = (v6_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v20, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X5_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v7 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v8 = (v7 == 2);
  long v9 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v10 = (v9 == 2);
  long v11 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v12 = (v11 == 1);
  long v13 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v14 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v15_conj = v13 & v14;
  long v16_conj = v12 & v15_conj;
  long v17_conj = v10 & v16_conj;
  long v18_conj = v8 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
