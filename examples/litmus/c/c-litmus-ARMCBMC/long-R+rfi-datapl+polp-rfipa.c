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
atomic_long atom_0_X2_2; 
atomic_long atom_1_X5_2; 
atomic_long atom_1_X4_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W3 = v3_W2 ^ v3_W2;
  long v5_W3 = v4_W3 + 1;
  atomic_store_explicit(&vars[1], v5_W3, memory_order_release);
  long v8_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v28 = (v8_W5 == 2);
  atomic_store_explicit(&atom_0_X5_2, v28, memory_order_seq_cst);
  long v29 = (v3_W2 == 2);
  atomic_store_explicit(&atom_0_X2_2, v29, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v11_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v14_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v30 = (v14_W5 == 2);
  atomic_store_explicit(&atom_1_X5_2, v30, memory_order_seq_cst);
  long v31 = (v11_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v31, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X5_2, 0); 
  atomic_init(&atom_0_X2_2, 0); 
  atomic_init(&atom_1_X5_2, 0); 
  atomic_init(&atom_1_X4_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v18 = (v17 == 2);
  long v19 = atomic_load_explicit(&atom_0_X5_2, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_0_X2_2, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X5_2, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v23_conj = v21 & v22;
  long v24_conj = v20 & v23_conj;
  long v25_conj = v19 & v24_conj;
  long v26_conj = v18 & v25_conj;
  long v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
