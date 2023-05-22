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

atomic_int vars[3]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X5_0; 
atomic_int atom_1_X7_0; 
atomic_int atom_1_X8_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = atomic_load_explicit(&vars[0+v7_W4], memory_order_relaxed);
  int v13_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v16_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v30, memory_order_seq_cst);
  int v31 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v31, memory_order_seq_cst);
  int v32 = (v13_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v32, memory_order_seq_cst);
  int v33 = (v16_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v33, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
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
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X8_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v18 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
