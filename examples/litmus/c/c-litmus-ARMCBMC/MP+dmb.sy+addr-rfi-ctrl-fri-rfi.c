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

long vars[3]; 
long atom_1_X0_1; 
long atom_1_X5_1; 
long atom_1_X6_0; 
long atom_1_X9_1; 

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
  int v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  int v7_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v7_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v13_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v30, memory_order_seq_cst);
  int v31 = (v7_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v31, memory_order_seq_cst);
  int v32 = (v10_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v32, memory_order_seq_cst);
  int v33 = (v13_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v33, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X6_0, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v15 = (v14 == 2);
  int v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v19 = (v18 == 1);
  int v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  int v29_conj = v15 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
