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
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_0; 
atomic_long atom_1_X6_1; 
atomic_long atom_1_X8_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v10_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v11_W7 = v10_W6 ^ v10_W6;
  long v14_W8 = atomic_load_explicit(&vars[0+v11_W7], memory_order_relaxed);
  long v22 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v22, memory_order_seq_cst);
  long v23 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v23, memory_order_seq_cst);
  long v24 = (v10_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v24, memory_order_seq_cst);
  long v25 = (v14_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v25, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X6_1, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v15 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v16 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  long v19_conj = v17 & v18;
  long v20_conj = v16 & v19_conj;
  long v21_conj = v15 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
