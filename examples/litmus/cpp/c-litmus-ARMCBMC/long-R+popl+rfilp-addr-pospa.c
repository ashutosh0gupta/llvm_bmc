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
atomic_long atom_0_X4_2; 
atomic_long atom_1_X2_2; 
atomic_long atom_1_X4_0; 
atomic_long atom_1_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  long v3_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v27 = (v3_W4 == 2);
  atomic_store_explicit(&atom_0_X4_2, v27, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v7_W3 = v6_W2 ^ v6_W2;
  long v10_W4 = atomic_load_explicit(&vars[0+v7_W3], memory_order_relaxed);
  long v13_W6 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v28 = (v6_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v28, memory_order_seq_cst);
  long v29 = (v10_W4 == 0);
  atomic_store_explicit(&atom_1_X4_0, v29, memory_order_seq_cst);
  long v30 = (v13_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v30, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X4_2, 0); 
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X4_0, 0); 
  atomic_init(&atom_1_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v15 = (v14 == 1);
  long v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&atom_0_X4_2, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  long v22_conj = v20 & v21;
  long v23_conj = v19 & v22_conj;
  long v24_conj = v18 & v23_conj;
  long v25_conj = v17 & v24_conj;
  long v26_conj = v15 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
