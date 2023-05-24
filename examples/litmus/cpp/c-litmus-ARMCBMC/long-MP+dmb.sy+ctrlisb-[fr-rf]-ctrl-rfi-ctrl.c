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
atomic_long atom_1_X2_0; 
atomic_long atom_1_X4_1; 
atomic_long atom_1_X7_1; 
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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  long v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v9_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v9_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  long v12_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v12_W7) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  long v15_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v37 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v37, memory_order_seq_cst);
  long v38 = (v6_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v38, memory_order_seq_cst);
  long v39 = (v9_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v39, memory_order_seq_cst);
  long v40 = (v12_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v40, memory_order_seq_cst);
  long v41 = (v15_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v41, memory_order_seq_cst);
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
  atomic_init(&atom_1_X2_0, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v16 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v17 = (v16 == 1);
  long v18 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v23 = (v22 == 1);
  long v24 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  long v29_conj = v27 & v28;
  long v30_conj = v26 & v29_conj;
  long v31_conj = v25 & v30_conj;
  long v32_conj = v24 & v31_conj;
  long v33_conj = v23 & v32_conj;
  long v34_conj = v21 & v33_conj;
  long v35_conj = v19 & v34_conj;
  long v36_conj = v17 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
