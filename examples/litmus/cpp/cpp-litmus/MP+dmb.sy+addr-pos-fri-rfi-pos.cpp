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
atomic_int atom_1_X3_0; 
atomic_int atom_1_X5_0; 
atomic_int atom_1_X7_1; 
atomic_int atom_1_X8_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[0+v4_W2], memory_order_relaxed);
  int v10_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v32 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v32, memory_order_seq_cst);
  int v33 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v33, memory_order_seq_cst);
  int v34 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v34, memory_order_seq_cst);
  int v35 = (v13_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v35, memory_order_seq_cst);
  int v36 = (v16_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v36, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X8_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v20 & v29_conj;
  int v31_conj = v18 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
