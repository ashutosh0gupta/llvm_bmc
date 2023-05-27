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

long vars[4]; 
long atom_0_X0_1; 
long atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[1+v4_W2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v12 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v12, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v7_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v8_W2 = v7_W0 ^ v7_W0;
  atomic_store_explicit(&vars[3+v8_W2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v13 = (v7_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v13, memory_order_seq_cst);
  return NULL;
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

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v10 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v11_conj = v9 & v10;
  if (v11_conj == 1) assert(0);
  return 0;
}
