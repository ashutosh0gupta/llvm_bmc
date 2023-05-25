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
atomic_int atom_1_X2_1; 
atomic_int atom_1_X3_2; 
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
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v9_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v12_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v12_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v15_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v29 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v29, memory_order_seq_cst);
  int v30 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v30, memory_order_seq_cst);
  int v31 = (v9_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v31, memory_order_seq_cst);
  int v32 = (v15_W8 == 1);
  atomic_store_explicit(&atom_1_X8_1, v32, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
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
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X8_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X8_1, memory_order_seq_cst);
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
