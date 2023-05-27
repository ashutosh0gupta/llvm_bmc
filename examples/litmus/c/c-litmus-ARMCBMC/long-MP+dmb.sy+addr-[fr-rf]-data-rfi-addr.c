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

atomic_long vars[4]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_0; 
atomic_long atom_1_X5_1; 
atomic_long atom_1_X8_1; 
atomic_long atom_1_X10_0; 

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
  long v4_W2 = v3_W0 ^ v3_W0;
  long v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  long v10_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v11_W6 = v10_W5 ^ v10_W5;
  long v12_W6 = v11_W6 + 1;
  atomic_store_explicit(&vars[3], v12_W6, memory_order_relaxed);
  long v15_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v16_W9 = v15_W8 ^ v15_W8;
  long v19_W10 = atomic_load_explicit(&vars[0+v16_W9], memory_order_relaxed);
  long v41 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v41, memory_order_seq_cst);
  long v42 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v42, memory_order_seq_cst);
  long v43 = (v10_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v43, memory_order_seq_cst);
  long v44 = (v15_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v44, memory_order_seq_cst);
  long v45 = (v19_W10 == 0);
  atomic_store_explicit(&atom_1_X10_0, v45, memory_order_seq_cst);
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

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X8_1, 0); 
  atomic_init(&atom_1_X10_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v20 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v23 = (v22 == 1);
  long v24 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v25 = (v24 == 1);
  long v26 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v27 = (v26 == 1);
  long v28 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v30 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v31 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  long v32 = atomic_load_explicit(&atom_1_X10_0, memory_order_seq_cst);
  long v33_conj = v31 & v32;
  long v34_conj = v30 & v33_conj;
  long v35_conj = v29 & v34_conj;
  long v36_conj = v28 & v35_conj;
  long v37_conj = v27 & v36_conj;
  long v38_conj = v25 & v37_conj;
  long v39_conj = v23 & v38_conj;
  long v40_conj = v21 & v39_conj;
  if (v40_conj == 1) assert(0);
  return 0;
}
