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
atomic_long atom_0_X6_2; 
atomic_long atom_1_X3_3; 
atomic_long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  long v3_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W5 = v3_W3 ^ v3_W3;
  long v5_W5 = v4_W5 + 1;
  atomic_store_explicit(&vars[0], v5_W5, memory_order_release);
  long v8_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v23 = (v8_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v23, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  long v11_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v14_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v24 = (v14_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v24, memory_order_seq_cst);
  long v25 = (v11_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v25, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_2, 0); 
  atomic_init(&atom_1_X3_3, 0); 
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v16 = (v15 == 4);
  long v17 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v20_conj = v18 & v19;
  long v21_conj = v17 & v20_conj;
  long v22_conj = v16 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}