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
atomic_long atom_1_X7_2; 
atomic_long atom_1_X9_0; 
atomic_long atom_1_X11_0; 

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
  long v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v7_W4 = v6_W2 ^ v6_W2;
  atomic_store_explicit(&vars[3+v7_W4], 1, memory_order_relaxed);
  long v10_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v11_W8 = v10_W7 ^ v10_W7;
  long v14_W9 = atomic_load_explicit(&vars[0+v11_W8], memory_order_relaxed);
  long v17_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v34 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v34, memory_order_seq_cst);
  long v35 = (v10_W7 == 2);
  atomic_store_explicit(&atom_1_X7_2, v35, memory_order_seq_cst);
  long v36 = (v14_W9 == 0);
  atomic_store_explicit(&atom_1_X9_0, v36, memory_order_seq_cst);
  long v37 = (v17_W11 == 0);
  atomic_store_explicit(&atom_1_X11_0, v37, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
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
  atomic_init(&atom_1_X7_2, 0); 
  atomic_init(&atom_1_X9_0, 0); 
  atomic_init(&atom_1_X11_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v18 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v19 = (v18 == 2);
  long v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v23 = (v22 == 1);
  long v24 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X7_2, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X9_0, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X11_0, memory_order_seq_cst);
  long v28_conj = v26 & v27;
  long v29_conj = v25 & v28_conj;
  long v30_conj = v24 & v29_conj;
  long v31_conj = v23 & v30_conj;
  long v32_conj = v21 & v31_conj;
  long v33_conj = v19 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
