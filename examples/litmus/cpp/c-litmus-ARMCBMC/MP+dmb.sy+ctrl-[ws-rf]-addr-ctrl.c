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

atomic_int vars[4]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X4_2; 
atomic_int atom_1_X8_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7_W5 = v6_W4 ^ v6_W4;
  int v10_W6 = atomic_load_explicit(&vars[3+v7_W5], memory_order_relaxed);
  if (v10_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v13_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v28, memory_order_seq_cst);
  int v29 = (v6_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v29, memory_order_seq_cst);
  int v30 = (v13_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v30, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
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
  atomic_init(&atom_1_X4_2, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v15 = (v14 == 1);
  int v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v17 & v25_conj;
  int v27_conj = v15 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
