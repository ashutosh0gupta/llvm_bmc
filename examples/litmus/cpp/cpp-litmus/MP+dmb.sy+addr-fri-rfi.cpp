/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

// Memory barriers
void dmbsy();
void dmbst();
void dmbld();
void isb();

atomic_int vars[2]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X3_0; 
atomic_int atom_1_X6_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[0+v4_W2], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v10_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v22, memory_order_seq_cst);
  int v23 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v23, memory_order_seq_cst);
  int v24 = (v10_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v24, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X6_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  int v21_conj = v12 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}