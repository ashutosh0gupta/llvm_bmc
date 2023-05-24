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

atomic_long vars[4]; 
atomic_long atom_0_X6_2; 
atomic_long atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  long v6_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v22 = (v6_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v22, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  long v9_W2 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v12_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v23 = (v12_W4 == 0);
  atomic_store_explicit(&atom_1_X4_0, v23, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_2, 0); 
  atomic_init(&atom_1_X4_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 1);
  long v15 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  long v19_conj = v17 & v18;
  long v20_conj = v16 & v19_conj;
  long v21_conj = v14 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
