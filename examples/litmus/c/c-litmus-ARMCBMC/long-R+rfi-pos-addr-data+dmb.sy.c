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
atomic_long atom_0_X3_1; 
atomic_long atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v6_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v7_W4 = v6_W3 ^ v6_W3;
  long v10_W5 = atomic_load_explicit(&vars[1+v7_W4], memory_order_relaxed);
  long v11_W7 = v10_W5 ^ v10_W5;
  long v12_W7 = v11_W7 + 1;
  atomic_store_explicit(&vars[2], v12_W7, memory_order_relaxed);
  long v27 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v27, memory_order_seq_cst);
  long v28 = (v6_W3 == 1);
  atomic_store_explicit(&atom_0_X3_1, v28, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  long v15_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v29 = (v15_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v29, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_0_X3_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v17 = (v16 == 1);
  long v18 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v19 = (v18 == 2);
  long v20 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_0_X3_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  long v23_conj = v21 & v22;
  long v24_conj = v20 & v23_conj;
  long v25_conj = v19 & v24_conj;
  long v26_conj = v17 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}