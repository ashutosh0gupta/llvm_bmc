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
atomic_int atom_1_X8_2; 
atomic_int atom_1_X10_0; 
atomic_int atom_1_X12_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  int v8_W5 = v7_W3 ^ v7_W3;
  atomic_store_explicit(&vars[3+v8_W5], 1, memory_order_relaxed);
  int v11_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v12_W9 = v11_W8 ^ v11_W8;
  int v15_W10 = atomic_load_explicit(&vars[0+v12_W9], memory_order_relaxed);
  int v18_W12 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v35 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v35, memory_order_seq_cst);
  int v36 = (v11_W8 == 2);
  atomic_store_explicit(&atom_1_X8_2, v36, memory_order_seq_cst);
  int v37 = (v15_W10 == 0);
  atomic_store_explicit(&atom_1_X10_0, v37, memory_order_seq_cst);
  int v38 = (v18_W12 == 0);
  atomic_store_explicit(&atom_1_X12_0, v38, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X8_2, 0); 
  atomic_init(&atom_1_X10_0, 0); 
  atomic_init(&atom_1_X12_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v19 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v24 = (v23 == 1);
  int v25 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X8_2, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X10_0, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_1_X12_0, memory_order_seq_cst);
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v22 & v32_conj;
  int v34_conj = v20 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
