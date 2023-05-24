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
atomic_long atom_1_X0_2; 
atomic_long atom_3_X0_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label252; else goto lbl_label252;
lbl_label252:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  long v17 = (v3_W0 == 2);
  atomic_store_explicit(&atom_1_X0_2, v17, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

void *t3(void *arg){
label_4:;
  long v7_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  long v18 = (v7_W0 == 2);
  atomic_store_explicit(&atom_3_X0_2, v18, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_2, 0); 
  atomic_init(&atom_3_X0_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  long v8 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v9 = (v8 == 2);
  long v10 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v11 = (v10 == 2);
  long v12 = atomic_load_explicit(&atom_1_X0_2, memory_order_seq_cst);
  long v13 = atomic_load_explicit(&atom_3_X0_2, memory_order_seq_cst);
  long v14_conj = v12 & v13;
  long v15_conj = v11 & v14_conj;
  long v16_conj = v9 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
