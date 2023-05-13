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
atomic_int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbld();
  atomic_store_explicit(&vars[1], 1, memory_order_release);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_acquire);
  dmbsy();
  int v6_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v10 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v10, memory_order_seq_cst);
  int v11 = (v6_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v11, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v8 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v9_conj = v7 & v8;
  if (v9_conj == 1) assert(0);
  return 0;
}
