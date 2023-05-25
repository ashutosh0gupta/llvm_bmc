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
atomic_long atom_2_X2_0; 
atomic_long atom_3_X1_0; 
atomic_long atom_1_X0_1; 
atomic_long atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  long v22 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v22, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v6_W0 = atomic_load_explicit(&vars[2], memory_order_acquire);
  long v9_W2 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v20 = (v9_W2 == 0);
  atomic_store_explicit(&atom_2_X2_0, v20, memory_order_seq_cst);
  long v23 = (v6_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v23, memory_order_seq_cst);
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  dmbsy();
  long v12_W1 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v21 = (v12_W1 == 0);
  atomic_store_explicit(&atom_3_X1_0, v21, memory_order_seq_cst);
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
  atomic_init(&atom_2_X2_0, 0); 
  atomic_init(&atom_3_X1_0, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  long v13 = atomic_load_explicit(&atom_2_X2_0, memory_order_seq_cst);
  long v14 = atomic_load_explicit(&atom_3_X1_0, memory_order_seq_cst);
  long v15 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v16 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v17_conj = v15 & v16;
  long v18_conj = v14 & v17_conj;
  long v19_conj = v13 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
