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
  long v4_W3 = v3_W2 ^ v3_W2;
  long v5_W3 = v4_W3 + 1;
  atomic_store_explicit(&vars[2], v5_W3, memory_order_relaxed);
  long v8_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v9_W6 = v8_W5 ^ v8_W5;
  atomic_store_explicit(&vars[0+v9_W6], 1, memory_order_relaxed);
  long v22 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v22, memory_order_seq_cst);
  long v23 = (v8_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v23, memory_order_seq_cst);
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

  long v10 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v11 = (v10 == 2);
  long v12 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v13 = (v12 == 2);
  long v14 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v15 = (v14 == 1);
  long v16 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v18_conj = v16 & v17;
  long v19_conj = v15 & v18_conj;
  long v20_conj = v13 & v19_conj;
  long v21_conj = v11 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
