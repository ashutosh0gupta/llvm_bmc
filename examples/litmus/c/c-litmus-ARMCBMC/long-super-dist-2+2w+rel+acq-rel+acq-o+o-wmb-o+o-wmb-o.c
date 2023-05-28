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
atomic_long atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  long v19 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v19, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v6_W0 = atomic_load_explicit(&vars[1], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v20 = (v6_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v20, memory_order_seq_cst);
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  return NULL;
}

void *t4(void *arg){
label_5:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);

  long v7 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v8 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v9 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v10 = (v9 == 2);
  long v11 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v12 = (v11 == 2);
  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 1);
  long v15_conj = v12 & v14;
  long v16_conj = v10 & v15_conj;
  long v17_conj = v8 & v16_conj;
  long v18_conj = v7 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
