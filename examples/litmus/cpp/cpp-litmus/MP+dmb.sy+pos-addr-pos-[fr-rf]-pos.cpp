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
atomic_int atom_1_X2_1; 
atomic_int atom_1_X4_0; 
atomic_int atom_1_X6_0; 
atomic_int atom_1_X7_1; 
atomic_int atom_1_X8_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = atomic_load_explicit(&vars[0+v7_W3], memory_order_relaxed);
  int v13_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v37 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v37, memory_order_seq_cst);
  int v38 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v38, memory_order_seq_cst);
  int v39 = (v10_W4 == 0);
  atomic_store_explicit(&atom_1_X4_0, v39, memory_order_seq_cst);
  int v40 = (v13_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v40, memory_order_seq_cst);
  int v41 = (v16_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v41, memory_order_seq_cst);
  int v42 = (v19_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v42, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X4_0, 0); 
  atomic_init(&atom_1_X6_0, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X8_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v21 = (v20 == 2);
  int v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  int v29 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v24 & v33_conj;
  int v35_conj = v23 & v34_conj;
  int v36_conj = v21 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}