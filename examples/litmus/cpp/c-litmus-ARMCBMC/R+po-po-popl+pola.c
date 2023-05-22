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

atomic_int vars[4]; 
atomic_int atom_0_X8_2; 
atomic_int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  int v6_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v22 = (v6_W8 == 2);
  atomic_store_explicit(&atom_0_X8_2, v22, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[3], 2, memory_order_release);
  int v9_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v23 = (v9_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v23, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X8_2, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v11 = (v10 == 2);
  int v12 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&atom_0_X8_2, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v13 & v19_conj;
  int v21_conj = v11 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
