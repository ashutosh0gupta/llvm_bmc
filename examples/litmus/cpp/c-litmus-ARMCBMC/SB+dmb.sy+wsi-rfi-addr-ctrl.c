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

atomic_int vars[3]; 
atomic_int atom_0_X2_0; 
atomic_int atom_1_X3_2; 
atomic_int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v25 = (v3_W2 == 0);
  atomic_store_explicit(&atom_0_X2_0, v25, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W4 = v6_W3 ^ v6_W3;
  int v10_W5 = atomic_load_explicit(&vars[2+v7_W4], memory_order_relaxed);
  if (v10_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v26 = (v6_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v26, memory_order_seq_cst);
  int v27 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v27, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_0, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&atom_0_X2_0, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v15 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
