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
atomic_int atom_0_X0_1; 
atomic_int atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label100; else goto lbl_label100;
lbl_label100:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v11 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v11, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  int v7_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v12 = (v7_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v12, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v9 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v10_conj = v8 & v9;
  if (v10_conj == 1) assert(0);
  return 0;
}
