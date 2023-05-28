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

long vars[2]; 
long atom_1_X0_1; 
long atom_1_X4_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 4, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v8_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  int v15 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v15, memory_order_seq_cst);
  int v16 = (v8_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v16, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v10 = (v9 == 4);
  int v11 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v12 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
