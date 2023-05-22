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

atomic_int vars[4]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X9_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v11_W7 = v10_W5 ^ v10_W5;
  int v12_W7 = v11_W7 + 1;
  atomic_store_explicit(&vars[0], v12_W7, memory_order_relaxed);
  int v15_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v25, memory_order_seq_cst);
  int v26 = (v15_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v26, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v19 = (v18 == 1);
  int v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v17 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}