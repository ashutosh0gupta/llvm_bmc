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

long vars[3]; 
long atom_0_X2_1; 
long atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = atomic_load_explicit(&vars[1+v4_W3], memory_order_relaxed);
  int v8_W6 = v7_W4 ^ v7_W4;
  int v9_W6 = v8_W6 + 1;
  atomic_store_explicit(&vars[2], v9_W6, memory_order_relaxed);
  int v22 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v22, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbsy();
  int v12_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v12_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v23, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v14 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
