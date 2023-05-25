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
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_2; 
atomic_long atom_1_X5_0; 
atomic_long atom_1_X7_0; 
atomic_long atom_1_X8_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v7_W4 = v6_W3 ^ v6_W3;
  long v10_W5 = atomic_load_explicit(&vars[0+v7_W4], memory_order_relaxed);
  long v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v16_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v32 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v32, memory_order_seq_cst);
  long v33 = (v6_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v33, memory_order_seq_cst);
  long v34 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v34, memory_order_seq_cst);
  long v35 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v35, memory_order_seq_cst);
  long v36 = (v16_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v36, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X8_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v18 = (v17 == 2);
  long v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v20 = (v19 == 2);
  long v21 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  long v26_conj = v24 & v25;
  long v27_conj = v23 & v26_conj;
  long v28_conj = v22 & v27_conj;
  long v29_conj = v21 & v28_conj;
  long v30_conj = v20 & v29_conj;
  long v31_conj = v18 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
