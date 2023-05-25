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
atomic_long atom_1_X3_2; 
atomic_long atom_1_X4_2; 
atomic_long atom_1_X5_0; 
atomic_long atom_1_X7_0; 

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
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v9_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v12_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v15_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v31 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v31, memory_order_seq_cst);
  long v32 = (v6_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v32, memory_order_seq_cst);
  long v33 = (v9_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v33, memory_order_seq_cst);
  long v34 = (v12_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v34, memory_order_seq_cst);
  long v35 = (v15_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v35, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X4_2, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v17 = (v16 == 1);
  long v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v19 = (v18 == 2);
  long v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  long v25_conj = v23 & v24;
  long v26_conj = v22 & v25_conj;
  long v27_conj = v21 & v26_conj;
  long v28_conj = v20 & v27_conj;
  long v29_conj = v19 & v28_conj;
  long v30_conj = v17 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
