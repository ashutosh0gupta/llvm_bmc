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
atomic_long atom_1_X4_2; 
atomic_long atom_1_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 & 128;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[2], v5_W2, memory_order_relaxed);
  long v8_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v9_W5 = v8_W4 & 128;
  long v12_W6 = atomic_load_explicit(&vars[1+v9_W5], memory_order_relaxed);
  long v21 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v21, memory_order_seq_cst);
  long v22 = (v8_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v22, memory_order_seq_cst);
  long v23 = (v12_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v23, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_2, 0); 
  atomic_init(&atom_1_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v13 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v14 = (v13 == 2);
  long v15 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v16 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  long v18_conj = v16 & v17;
  long v19_conj = v15 & v18_conj;
  long v20_conj = v14 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
