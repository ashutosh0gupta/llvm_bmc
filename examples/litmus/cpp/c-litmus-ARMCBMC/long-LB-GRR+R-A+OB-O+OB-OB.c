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

atomic_long vars[5]; 
atomic_long atom_3_X2_0; 
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 
atomic_long atom_2_X0_1; 
atomic_long atom_3_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  long v26 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v26, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v6_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v27 = (v6_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v27, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  long v28 = (v9_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v28, memory_order_seq_cst);
  return NULL;
}

void *t3(void *arg){
label_4:;
  long v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  long v15_W2 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  long v25 = (v15_W2 == 0);
  atomic_store_explicit(&atom_3_X2_0, v25, memory_order_seq_cst);
  long v29 = (v12_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v29, memory_order_seq_cst);
  return NULL;
}

void *t4(void *arg){
label_5:;
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_3_X2_0, 0); 
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 
  atomic_init(&atom_3_X0_1, 0); 

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

  long v16 = atomic_load_explicit(&atom_3_X2_0, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  long v21_conj = v19 & v20;
  long v22_conj = v18 & v21_conj;
  long v23_conj = v17 & v22_conj;
  long v24_conj = v16 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
