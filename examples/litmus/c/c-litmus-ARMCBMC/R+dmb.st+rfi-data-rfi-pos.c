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
long atom_1_X2_2; 
long atom_1_X5_1; 
long atom_1_X6_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v5_W3 = v4_W3 + 1;
  atomic_store_explicit(&vars[0], v5_W3, memory_order_relaxed);
  int v8_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v11_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v23, memory_order_seq_cst);
  int v24 = (v8_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v24, memory_order_seq_cst);
  int v25 = (v11_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v25, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X6_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v13 = (v12 == 2);
  int v14 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v15 = (v14 == 2);
  int v16 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v13 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
