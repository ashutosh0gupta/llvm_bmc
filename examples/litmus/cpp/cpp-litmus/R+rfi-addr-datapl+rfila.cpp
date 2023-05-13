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
atomic_int atom_0_X7_2; 
atomic_int atom_0_X2_3; 
atomic_int atom_1_X3_3; 
atomic_int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = atomic_load_explicit(&vars[1+v4_W3], memory_order_relaxed);
  int v8_W6 = v7_W4 ^ v7_W4;
  int v9_W6 = v8_W6 + 1;
  atomic_store_explicit(&vars[0], v9_W6, memory_order_release);
  int v12_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v29 = (v12_W7 == 2);
  atomic_store_explicit(&atom_0_X7_2, v29, memory_order_seq_cst);
  int v30 = (v3_W2 == 3);
  atomic_store_explicit(&atom_0_X2_3, v30, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v18_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v18_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v31, memory_order_seq_cst);
  int v32 = (v15_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v32, memory_order_seq_cst);

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

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v20 = (v19 == 3);
  int v21 = atomic_load_explicit(&atom_0_X7_2, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_0_X2_3, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
