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

atomic_int vars[4]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X2_1; 
atomic_int atom_1_X10_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = atomic_load_explicit(&vars[2+v7_W3], memory_order_relaxed);
  if (v10_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W6 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v14_W8 = v13_W6 ^ v13_W6;
  int v15_W8 = v14_W8 + 1;
  atomic_store_explicit(&vars[0], v15_W8, memory_order_relaxed);
  int v18_W10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v30, memory_order_seq_cst);
  int v31 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v31, memory_order_seq_cst);
  int v32 = (v18_W10 == 1);
  atomic_store_explicit(&atom_1_X10_1, v32, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X10_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X10_1, memory_order_seq_cst);
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v20 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
