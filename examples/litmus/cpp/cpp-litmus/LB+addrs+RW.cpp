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

atomic_int vars[4]; 
atomic_int atom_0_X0_1; 
atomic_int atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[1+v4_W2], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v18 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v18, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  int v10_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11_W2 = v10_W0 ^ v10_W0;
  int v14_W3 = atomic_load_explicit(&vars[3+v11_W2], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v19 = (v10_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v19, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v17_conj = v15 & v16;
  if (v17_conj == 1) assert(0);
  return 0;
}
