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
  long v8_W7 = v7_W5 ^ v7_W5;
  long v9_W7 = v8_W7 + 1;
  atomic_store_explicit(&vars[0], v9_W7, memory_order_release);
  long v12_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v27 = (v12_W8 == 2);
  atomic_store_explicit(&atom_0_X8_2, v27, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  long v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v18_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v28 = (v18_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v28, memory_order_seq_cst);
  long v29 = (v15_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v29, memory_order_seq_cst);
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

  long v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v20 = (v19 == 3);
  long v21 = atomic_load_explicit(&atom_0_X8_2, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v24_conj = v22 & v23;
  long v25_conj = v21 & v24_conj;
  long v26_conj = v20 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
