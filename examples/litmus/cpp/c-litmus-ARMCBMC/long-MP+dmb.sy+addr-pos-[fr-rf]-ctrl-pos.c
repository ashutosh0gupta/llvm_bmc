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
atomic_long atom_1_X3_0; 
atomic_long atom_1_X5_0; 
atomic_long atom_1_X6_1; 
atomic_long atom_1_X7_0; 
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
  long v4_W2 = v3_W0 ^ v3_W0;
  long v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  long v10_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v13_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v13_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v16_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v19_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v40 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v40, memory_order_seq_cst);
  long v41 = (v7_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v41, memory_order_seq_cst);
  long v42 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v42, memory_order_seq_cst);
  long v43 = (v13_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v43, memory_order_seq_cst);
  long v44 = (v16_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v44, memory_order_seq_cst);
  long v45 = (v19_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v45, memory_order_seq_cst);
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
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X6_1, 0); 
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X9_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v23 = (v22 == 1);
  long v24 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v25 = (v24 == 1);
  long v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  long v30 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  long v31 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  long v32_conj = v30 & v31;
  long v33_conj = v29 & v32_conj;
  long v34_conj = v28 & v33_conj;
  long v35_conj = v27 & v34_conj;
  long v36_conj = v26 & v35_conj;
  long v37_conj = v25 & v36_conj;
  long v38_conj = v23 & v37_conj;
  long v39_conj = v21 & v38_conj;
  if (v39_conj == 1) assert(0);
  return 0;
}
