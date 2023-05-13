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

atomic_int vars[3]; 
atomic_int atom_1_X0_1; 
atomic_int atom_2_X0_1; 
atomic_int atom_2_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_release);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v15 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v15, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  int v6_W0 = atomic_load_explicit(&vars[2], memory_order_acquire);
  int v9_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v16 = (v6_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v16, memory_order_seq_cst);
  int v17 = (v9_W2 == 0);
  atomic_store_explicit(&atom_2_X2_0, v17, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 
  atomic_init(&atom_2_X2_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v11 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  int v12 = atomic_load_explicit(&atom_2_X2_0, memory_order_seq_cst);
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
