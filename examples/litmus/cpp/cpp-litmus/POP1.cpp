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
atomic_int atom_0_X4_2; 
atomic_int atom_0_X5_1; 
atomic_int atom_2_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 0, memory_order_release);
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  int v3_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v6_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v21 = (v3_W4 == 2);
  atomic_store_explicit(&atom_0_X4_2, v21, memory_order_seq_cst);
  int v22 = (v6_W5 == 1);
  atomic_store_explicit(&atom_0_X5_1, v22, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 0, memory_order_relaxed);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 0, memory_order_relaxed);
  dmbsy();
  int v9_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v23 = (v9_W3 == 0);
  atomic_store_explicit(&atom_2_X3_0, v23, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X4_2, 0); 
  atomic_init(&atom_0_X5_1, 0); 
  atomic_init(&atom_2_X3_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v11 = (v10 == 2);
  int v12 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v13 = (v12 == 2);
  int v14 = atomic_load_explicit(&atom_0_X4_2, memory_order_seq_cst);
  int v15 = atomic_load_explicit(&atom_0_X5_1, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_2_X3_0, memory_order_seq_cst);
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v11 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
