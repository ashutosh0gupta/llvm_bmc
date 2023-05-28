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
atomic_long atom_0_X2_1; 
atomic_long atom_0_X5_1; 
atomic_long atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  long v6_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v7_W6 = v6_W5 ^ v6_W5;
  long v8_W6 = v7_W6 + 1;
  atomic_store_explicit(&vars[2], v8_W6, memory_order_relaxed);
  long v26 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v26, memory_order_seq_cst);
  long v27 = (v6_W5 == 1);
  atomic_store_explicit(&atom_0_X5_1, v27, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  long v11_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v28 = (v11_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v28, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_0_X5_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v12 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v13 = (v12 == 1);
  long v14 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v15 = (v14 == 1);
  long v16 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_0_X5_1, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  long v21_conj = v19 & v20;
  long v22_conj = v18 & v21_conj;
  long v23_conj = v17 & v22_conj;
  long v24_conj = v15 & v23_conj;
  long v25_conj = v13 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
