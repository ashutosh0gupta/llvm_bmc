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

atomic_long vars[6]; 
atomic_long atom_0_X0_1; 
atomic_long atom_0_X5_0; 
atomic_long atom_0_X7_1; 
atomic_long atom_0_X3_1; 
atomic_long atom_1_X2_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  atomic_store_explicit(&vars[4], v3_W0, memory_order_relaxed);
  long v6_W3 = atomic_load_explicit(&vars[3], memory_order_acquire);
  long v9_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v12_W7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  long v28 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v28, memory_order_seq_cst);
  long v29 = (v9_W5 == 0);
  atomic_store_explicit(&atom_0_X5_0, v29, memory_order_seq_cst);
  long v30 = (v12_W7 == 1);
  atomic_store_explicit(&atom_0_X7_1, v30, memory_order_seq_cst);
  long v31 = (v6_W3 == 1);
  atomic_store_explicit(&atom_0_X3_1, v31, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  dmbsy();
  long v15_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  long v32 = (v15_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v32, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_release);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_0_X5_0, 0); 
  atomic_init(&atom_0_X7_1, 0); 
  atomic_init(&atom_0_X3_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v16 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_0_X5_0, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_0_X7_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&vars[4], memory_order_seq_cst);
  long v20 = (v19 == 2);
  long v21 = atomic_load_explicit(&atom_0_X3_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v23_disj = v21 | v22;
  long v24_conj = v20 & v23_disj;
  long v25_conj = v18 & v24_conj;
  long v26_conj = v17 & v25_conj;
  long v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
