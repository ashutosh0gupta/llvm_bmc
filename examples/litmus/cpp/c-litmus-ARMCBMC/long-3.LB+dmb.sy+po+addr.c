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
atomic_long atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  long v16 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v16, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v6_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v17 = (v6_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v17, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v10_W2 = v9_W0 ^ v9_W0;
  atomic_store_explicit(&vars[0+v10_W2], 1, memory_order_relaxed);
  long v18 = (v9_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v18, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v11 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v12 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v13 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v14_conj = v12 & v13;
  long v15_conj = v11 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
