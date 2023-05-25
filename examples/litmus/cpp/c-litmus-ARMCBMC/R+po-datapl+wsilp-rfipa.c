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
long atom_0_X5_2; 
long atom_1_X4_4; 
long atom_1_X3_3; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W4 = v3_W2 ^ v3_W2;
  int v5_W4 = v4_W4 + 1;
  atomic_store_explicit(&vars[0], v5_W4, memory_order_release);
  int v8_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v8_W5 == 2);
  atomic_store_explicit(&atom_0_X5_2, v23, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v11_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v14_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v14_W4 == 4);
  atomic_store_explicit(&atom_1_X4_4, v24, memory_order_seq_cst);
  int v25 = (v11_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v25, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X5_2, 0); 
  atomic_init(&atom_1_X4_4, 0); 
  atomic_init(&atom_1_X3_3, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v16 = (v15 == 4);
  int v17 = atomic_load_explicit(&atom_0_X5_2, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X4_4, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
