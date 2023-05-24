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
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_2; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  long v25 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v25, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v11_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v12_W4 = v11_W3 ^ v11_W3;
  long v13_W4 = v12_W4 + 1;
  atomic_store_explicit(&vars[0], v13_W4, memory_order_relaxed);
  long v26 = (v8_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v26, memory_order_seq_cst);
  long v27 = (v11_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v27, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v15 = (v14 == 1);
  long v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  long v21_conj = v19 & v20;
  long v22_conj = v18 & v21_conj;
  long v23_conj = v17 & v22_conj;
  long v24_conj = v15 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
