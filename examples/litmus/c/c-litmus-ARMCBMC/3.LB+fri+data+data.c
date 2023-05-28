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
long atom_0_X0_1; 
long atom_1_X0_2; 
long atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  int v22 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v22, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7_W2 = v6_W0 ^ v6_W0;
  int v8_W2 = v7_W2 + 1;
  atomic_store_explicit(&vars[1], v8_W2, memory_order_relaxed);
  int v23 = (v6_W0 == 2);
  atomic_store_explicit(&atom_1_X0_2, v23, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v11_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12_W2 = v11_W0 ^ v11_W0;
  int v13_W2 = v12_W2 + 1;
  atomic_store_explicit(&vars[0], v13_W2, memory_order_relaxed);
  int v24 = (v11_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v24, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_2, 0); 
  atomic_init(&atom_2_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v15 = (v14 == 2);
  int v16 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X0_2, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}