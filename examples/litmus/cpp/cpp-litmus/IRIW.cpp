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
atomic_int atom_1_X2_0; 
atomic_int atom_3_X0_1; 
atomic_int atom_3_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v20, memory_order_seq_cst);
  int v21 = (v6_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v21, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t3(void *arg){
label_4:;
  int v9_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v9_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v22, memory_order_seq_cst);
  int v23 = (v12_W2 == 0);
  atomic_store_explicit(&atom_3_X2_0, v23, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 
  atomic_init(&atom_3_X0_1, 0); 
  atomic_init(&atom_3_X2_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);
  pthread_create(&thr3, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v13 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v14 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v15 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_3_X2_0, memory_order_seq_cst);
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}