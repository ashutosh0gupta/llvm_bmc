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
atomic_int atom_1_X3_0; 
atomic_int atom_1_X5_1; 
atomic_int atom_1_X8_1; 
atomic_int atom_1_X10_0; 

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
  int v10_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v11_W6 = v10_W5 ^ v10_W5;
  int v12_W6 = v11_W6 + 1;
  atomic_store_explicit(&vars[3], v12_W6, memory_order_relaxed);
  int v15_W8 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v16_W9 = v15_W8 ^ v15_W8;
  int v19_W10 = atomic_load_explicit(&vars[0+v16_W9], memory_order_relaxed);
  int v41 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v41, memory_order_seq_cst);
  int v42 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v42, memory_order_seq_cst);
  int v43 = (v10_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v43, memory_order_seq_cst);
  int v44 = (v15_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v44, memory_order_seq_cst);
  int v45 = (v19_W10 == 0);
  atomic_store_explicit(&atom_1_X10_0, v45, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);

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

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v25 = (v24 == 1);
  int v26 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v27 = (v26 == 1);
  int v28 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v29 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  int v30 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  int v31 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  int v32 = atomic_load_explicit(&atom_1_X10_0, memory_order_seq_cst);
  int v33_conj = v31 & v32;
  int v34_conj = v30 & v33_conj;
  int v35_conj = v29 & v34_conj;
  int v36_conj = v28 & v35_conj;
  int v37_conj = v27 & v36_conj;
  int v38_conj = v25 & v37_conj;
  int v39_conj = v23 & v38_conj;
  int v40_conj = v21 & v39_conj;
  if (v40_conj == 1) assert(0);
  return 0;
}
