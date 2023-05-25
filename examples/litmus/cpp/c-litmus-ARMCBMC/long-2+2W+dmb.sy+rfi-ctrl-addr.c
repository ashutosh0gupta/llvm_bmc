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

atomic_long vars[3]; 
atomic_long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v6_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v7_W5 = v6_W3 ^ v6_W3;
  atomic_store_explicit(&vars[0+v7_W5], 1, memory_order_relaxed);
  long v15 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v15, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v8 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v9 = (v8 == 2);
  long v10 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v11 = (v10 == 2);
  long v12 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v13_conj = v11 & v12;
  long v14_conj = v9 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
