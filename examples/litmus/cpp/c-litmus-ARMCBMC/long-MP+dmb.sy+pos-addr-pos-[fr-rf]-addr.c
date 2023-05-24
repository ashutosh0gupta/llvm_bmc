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

atomic_long vars[3]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X2_1; 
atomic_long atom_1_X4_0; 
atomic_long atom_1_X6_0; 
atomic_long atom_1_X7_1; 
atomic_long atom_1_X9_0; 

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
  long v7_W3 = v6_W2 ^ v6_W2;
  long v10_W4 = atomic_load_explicit(&vars[2+v7_W3], memory_order_relaxed);
  long v13_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v16_W7 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v17_W8 = v16_W7 ^ v16_W7;
  long v20_W9 = atomic_load_explicit(&vars[0+v17_W8], memory_order_relaxed);
  long v41 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v41, memory_order_seq_cst);
  long v42 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v42, memory_order_seq_cst);
  long v43 = (v10_W4 == 0);
  atomic_store_explicit(&atom_1_X4_0, v43, memory_order_seq_cst);
  long v44 = (v13_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v44, memory_order_seq_cst);
  long v45 = (v16_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v45, memory_order_seq_cst);
  long v46 = (v20_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v46, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X4_0, 0); 
  atomic_init(&atom_1_X6_0, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v21 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v22 = (v21 == 1);
  long v23 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v24 = (v23 == 1);
  long v25 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v26 = (v25 == 1);
  long v27 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  long v30 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  long v31 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  long v32 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  long v33_conj = v31 & v32;
  long v34_conj = v30 & v33_conj;
  long v35_conj = v29 & v34_conj;
  long v36_conj = v28 & v35_conj;
  long v37_conj = v27 & v36_conj;
  long v38_conj = v26 & v37_conj;
  long v39_conj = v24 & v38_conj;
  long v40_conj = v22 & v39_conj;
  if (v40_conj == 1) assert(0);
  return 0;
}
