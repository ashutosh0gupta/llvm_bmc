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

atomic_long vars[2]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X2_1; 
atomic_long atom_1_X3_2; 
atomic_long atom_1_X4_2; 
atomic_long atom_1_X6_0; 
atomic_long atom_1_X8_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v12_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v13_W5 = v12_W4 ^ v12_W4;
  long v16_W6 = atomic_load_explicit(&vars[0+v13_W5], memory_order_relaxed);
  long v19_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v37 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v37, memory_order_seq_cst);
  long v38 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v38, memory_order_seq_cst);
  long v39 = (v9_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v39, memory_order_seq_cst);
  long v40 = (v12_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v40, memory_order_seq_cst);
  long v41 = (v16_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v41, memory_order_seq_cst);
  long v42 = (v19_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v42, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X4_2, 0); 
  atomic_init(&atom_1_X6_0, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v23 = (v22 == 2);
  long v24 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  long v30_conj = v28 & v29;
  long v31_conj = v27 & v30_conj;
  long v32_conj = v26 & v31_conj;
  long v33_conj = v25 & v32_conj;
  long v34_conj = v24 & v33_conj;
  long v35_conj = v23 & v34_conj;
  long v36_conj = v21 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
