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

atomic_int vars[3]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X4_1; 
atomic_int atom_1_X5_1; 
atomic_int atom_1_X7_0; 
atomic_int atom_1_X9_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10_W6 = v9_W5 ^ v9_W5;
  int v13_W7 = atomic_load_explicit(&vars[0+v10_W6], memory_order_relaxed);
  int v16_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v35 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v35, memory_order_seq_cst);
  int v36 = (v6_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v36, memory_order_seq_cst);
  int v37 = (v9_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v37, memory_order_seq_cst);
  int v38 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v38, memory_order_seq_cst);
  int v39 = (v16_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v39, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v23 & v30_conj;
  int v32_conj = v22 & v31_conj;
  int v33_conj = v20 & v32_conj;
  int v34_conj = v18 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
