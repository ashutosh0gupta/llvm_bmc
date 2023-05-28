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

atomic_long vars[2]; 
atomic_long atom_0_X7_2; 
atomic_long atom_0_X2_3; 
atomic_long atom_1_X3_3; 
atomic_long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W3 = v3_W2 ^ v3_W2;
  long v7_W4 = atomic_load_explicit(&vars[1+v4_W3], memory_order_relaxed);
  long v8_W6 = v7_W4 ^ v7_W4;
  long v9_W6 = v8_W6 + 1;
  atomic_store_explicit(&vars[0], v9_W6, memory_order_release);
  long v12_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v29 = (v12_W7 == 2);
  atomic_store_explicit(&atom_0_X7_2, v29, memory_order_seq_cst);
  long v30 = (v3_W2 == 3);
  atomic_store_explicit(&atom_0_X2_3, v30, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  long v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v18_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v31 = (v18_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v31, memory_order_seq_cst);
  long v32 = (v15_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v32, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X7_2, 0); 
  atomic_init(&atom_0_X2_3, 0); 
  atomic_init(&atom_1_X3_3, 0); 
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v20 = (v19 == 3);
  long v21 = atomic_load_explicit(&atom_0_X7_2, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_0_X2_3, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v25_conj = v23 & v24;
  long v26_conj = v22 & v25_conj;
  long v27_conj = v21 & v26_conj;
  long v28_conj = v20 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
