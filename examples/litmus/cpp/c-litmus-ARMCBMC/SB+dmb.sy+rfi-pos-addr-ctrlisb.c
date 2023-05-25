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
long atom_0_X2_0; 
long atom_1_X2_1; 
long atom_1_X3_1; 
long atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v30 = (v3_W2 == 0);
  atomic_store_explicit(&atom_0_X2_0, v30, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10_W4 = v9_W3 ^ v9_W3;
  int v13_W5 = atomic_load_explicit(&vars[2+v10_W4], memory_order_relaxed);
  if (v13_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v16_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v31, memory_order_seq_cst);
  int v32 = (v9_W3 == 1);
  atomic_store_explicit(&atom_1_X3_1, v32, memory_order_seq_cst);
  int v33 = (v16_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v33, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_0, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X3_1, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v20 = (v19 == 1);
  int v21 = atomic_load_explicit(&atom_0_X2_0, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X3_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v18 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
