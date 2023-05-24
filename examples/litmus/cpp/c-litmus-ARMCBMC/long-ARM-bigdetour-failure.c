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

atomic_long vars[4]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_0; 
atomic_long atom_1_X5_1; 
atomic_long atom_1_X8_0; 
atomic_long atom_3_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W2 = v3_W0 & 128;
  long v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  long v10_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v11_W7 = v10_W5 & 128;
  long v14_W8 = atomic_load_explicit(&vars[0+v11_W7], memory_order_relaxed);
  long v27 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v27, memory_order_seq_cst);
  long v28 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v28, memory_order_seq_cst);
  long v29 = (v10_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v29, memory_order_seq_cst);
  long v30 = (v14_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v30, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  return NULL;
}

void *t3(void *arg){
label_4:;
  long v17_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  long v31 = (v17_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v31, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X8_0, 0); 
  atomic_init(&atom_3_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  long v18 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  long v23_conj = v21 & v22;
  long v24_conj = v20 & v23_conj;
  long v25_conj = v19 & v24_conj;
  long v26_conj = v18 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
