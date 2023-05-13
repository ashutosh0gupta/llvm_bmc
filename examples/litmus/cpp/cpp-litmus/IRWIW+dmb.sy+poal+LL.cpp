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
atomic_int atom_1_X0_2; 
atomic_int atom_3_X0_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v16 = (v3_W0 == 2);
  atomic_store_explicit(&atom_1_X0_2, v16, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);

}

void *t3(void *arg){
label_4:;
  int v6_W0 = atomic_load_explicit(&vars[1], memory_order_acquire);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v17 = (v6_W0 == 2);
  atomic_store_explicit(&atom_3_X0_2, v17, memory_order_seq_cst);

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

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);
  pthread_create(&thr3, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v8 = (v7 == 2);
  int v9 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v10 = (v9 == 2);
  int v11 = atomic_load_explicit(&atom_1_X0_2, memory_order_seq_cst);
  int v12 = atomic_load_explicit(&atom_3_X0_2, memory_order_seq_cst);
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v8 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
