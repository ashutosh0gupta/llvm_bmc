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
atomic_long atom_1_X2_2; 
atomic_long atom_1_X6_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W3 = v3_W2 ^ v3_W2;
  atomic_store_explicit(&vars[2+v4_W3], 1, memory_order_relaxed);
  long v7_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v8_W7 = v7_W6 ^ v7_W6;
  atomic_store_explicit(&vars[0+v8_W7], 1, memory_order_relaxed);
  long v21 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v21, memory_order_seq_cst);
  long v22 = (v7_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v22, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X6_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v9 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v10 = (v9 == 2);
  long v11 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v12 = (v11 == 2);
  long v13 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v14 = (v13 == 1);
  long v15 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v16 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  long v17_conj = v15 & v16;
  long v18_conj = v14 & v17_conj;
  long v19_conj = v12 & v18_conj;
  long v20_conj = v10 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
