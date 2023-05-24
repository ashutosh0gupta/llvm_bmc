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
atomic_long atom_1_X2_2; 
atomic_long atom_1_X4_0; 
atomic_long atom_1_X6_1; 
atomic_long atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W3 = v3_W2 ^ v3_W2;
  long v7_W4 = atomic_load_explicit(&vars[2+v4_W3], memory_order_relaxed);
  long v10_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v10_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  long v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v30 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v30, memory_order_seq_cst);
  long v31 = (v7_W4 == 0);
  atomic_store_explicit(&atom_1_X4_0, v31, memory_order_seq_cst);
  long v32 = (v10_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v32, memory_order_seq_cst);
  long v33 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v33, memory_order_seq_cst);
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
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X4_0, 0); 
  atomic_init(&atom_1_X6_1, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v15 = (v14 == 1);
  long v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v17 = (v16 == 2);
  long v18 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  long v24_conj = v22 & v23;
  long v25_conj = v21 & v24_conj;
  long v26_conj = v20 & v25_conj;
  long v27_conj = v19 & v26_conj;
  long v28_conj = v17 & v27_conj;
  long v29_conj = v15 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
