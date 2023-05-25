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

atomic_int vars[3]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W2 = v3_W0 & 128;
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  int v8_W5 = v7_W3 & 128;
  int v11_W6 = atomic_load_explicit(&vars[1+v8_W5], memory_order_relaxed);
  int v15 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v15, memory_order_seq_cst);
  int v16 = (v11_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v16, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v13 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  int v14_conj = v12 & v13;
  if (v14_conj == 1) assert(0);
  return 0;
}
