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
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  long v26 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v26, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W2 = v8_W0 ^ v8_W0;
  long v12_W3 = atomic_load_explicit(&vars[2+v9_W2], memory_order_relaxed);
  long v15_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v16_W6 = v15_W5 ^ v15_W5;
  atomic_store_explicit(&vars[0+v16_W6], 1, memory_order_relaxed);
  long v27 = (v8_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v27, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v18 = (v17 == 1);
  long v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v23_conj = v21 & v22;
  long v24_conj = v20 & v23_conj;
  long v25_conj = v18 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
