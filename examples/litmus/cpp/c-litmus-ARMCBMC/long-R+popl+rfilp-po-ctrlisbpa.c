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
atomic_long atom_0_X4_2; 
atomic_long atom_1_X2_2; 
atomic_long atom_1_X5_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  long v3_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v24 = (v3_W4 == 2);
  atomic_store_explicit(&atom_0_X4_2, v24, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v9_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  long v12_W5 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v25 = (v6_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v25, memory_order_seq_cst);
  long v26 = (v12_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v26, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X4_2, 0); 
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X5_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 1);
  long v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&atom_0_X4_2, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  long v20_conj = v18 & v19;
  long v21_conj = v17 & v20_conj;
  long v22_conj = v16 & v21_conj;
  long v23_conj = v14 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
