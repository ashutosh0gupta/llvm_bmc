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
atomic_int atom_2_X1_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label39; else goto lbl_label39;
lbl_label39:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v14 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v14, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v7_W1 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v15 = (v7_W1 == 0);
  atomic_store_explicit(&atom_2_X1_0, v15, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X1_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v8 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v9 = (v8 == 2);
  int v10 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v11 = atomic_load_explicit(&atom_2_X1_0, memory_order_seq_cst);
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  if (v13_conj == 1) assert(0);
  return 0;
}
