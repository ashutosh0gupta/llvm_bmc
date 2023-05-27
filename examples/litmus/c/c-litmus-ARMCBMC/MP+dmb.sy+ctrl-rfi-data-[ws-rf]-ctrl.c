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
long atom_1_X7_2; 
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
  int v7_W5 = v6_W4 ^ v6_W4;
  int v8_W5 = v7_W5 + 1;
  atomic_store_explicit(&vars[3], v8_W5, memory_order_relaxed);
  int v11_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v11_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v14_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v34 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v34, memory_order_seq_cst);
  int v35 = (v6_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v35, memory_order_seq_cst);
  int v36 = (v11_W7 == 2);
  atomic_store_explicit(&atom_1_X7_2, v36, memory_order_seq_cst);
  int v37 = (v14_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v37, memory_order_seq_cst);
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
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X7_2, 0); 
  atomic_init(&atom_1_X8_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X7_2, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  int v32_conj = v18 & v31_conj;
  int v33_conj = v16 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
