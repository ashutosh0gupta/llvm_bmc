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

long vars[4]; 
long atom_1_X0_1; 
long atom_1_X4_1; 
long atom_1_X7_1; 
long atom_1_X8_0; 

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
  if (v6_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v9_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v9_W7) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  int v12_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v32 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v32, memory_order_seq_cst);
  int v33 = (v6_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v33, memory_order_seq_cst);
  int v34 = (v9_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v34, memory_order_seq_cst);
  int v35 = (v12_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v35, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v18 & v28_conj;
  int v30_conj = v16 & v29_conj;
  int v31_conj = v14 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
