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
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_0; 
atomic_long atom_1_X5_0; 
atomic_long atom_1_X7_1; 

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
  long v4_W2 = v3_W0 ^ v3_W0;
  long v7_W3 = atomic_load_explicit(&vars[0+v4_W2], memory_order_relaxed);
  long v10_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v24 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v24, memory_order_seq_cst);
  long v25 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v25, memory_order_seq_cst);
  long v26 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v26, memory_order_seq_cst);
  long v27 = (v13_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v27, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v15 = (v14 == 2);
  long v16 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  long v20_conj = v18 & v19;
  long v21_conj = v17 & v20_conj;
  long v22_conj = v16 & v21_conj;
  long v23_conj = v15 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
