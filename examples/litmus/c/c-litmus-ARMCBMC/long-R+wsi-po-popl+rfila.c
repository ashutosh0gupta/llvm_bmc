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
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  long v6_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v21 = (v6_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v21, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  long v9_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v12_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v22 = (v12_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v22, memory_order_seq_cst);
  long v23 = (v9_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v23, memory_order_seq_cst);
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

  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 4);
  long v15 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  long v16 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v18_conj = v16 & v17;
  long v19_conj = v15 & v18_conj;
  long v20_conj = v14 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
