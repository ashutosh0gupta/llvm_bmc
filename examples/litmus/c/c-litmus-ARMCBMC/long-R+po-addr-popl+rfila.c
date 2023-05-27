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
atomic_long atom_0_X8_2; 
atomic_long atom_1_X3_3; 
atomic_long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W4 = v3_W2 ^ v3_W2;
  long v7_W5 = atomic_load_explicit(&vars[2+v4_W4], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  long v10_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v25 = (v10_W8 == 2);
  atomic_store_explicit(&atom_0_X8_2, v25, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  long v13_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v16_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v26 = (v16_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v26, memory_order_seq_cst);
  long v27 = (v13_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v27, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X8_2, 0); 
  atomic_init(&atom_1_X3_3, 0); 
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v18 = (v17 == 3);
  long v19 = atomic_load_explicit(&atom_0_X8_2, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v22_conj = v20 & v21;
  long v23_conj = v19 & v22_conj;
  long v24_conj = v18 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
