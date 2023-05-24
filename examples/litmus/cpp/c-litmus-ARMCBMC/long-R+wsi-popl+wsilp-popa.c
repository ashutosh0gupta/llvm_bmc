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
atomic_long atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  long v3_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v16 = (v3_W5 == 2);
  atomic_store_explicit(&atom_0_X5_2, v16, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  long v6_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v17 = (v6_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v17, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X5_2, 0); 
  atomic_init(&atom_1_X3_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v7 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v8 = (v7 == 2);
  long v9 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v10 = (v9 == 3);
  long v11 = atomic_load_explicit(&atom_0_X5_2, memory_order_seq_cst);
  long v12 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v13_conj = v11 & v12;
  long v14_conj = v10 & v13_conj;
  long v15_conj = v8 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
