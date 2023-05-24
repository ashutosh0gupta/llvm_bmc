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
atomic_long atom_0_X2_0; 
atomic_long atom_1_X2_1; 
atomic_long atom_1_X3_1; 
atomic_long atom_1_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v29 = (v3_W2 == 0);
  atomic_store_explicit(&atom_0_X2_0, v29, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  long v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v9_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v12_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v12_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  long v15_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v30 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v30, memory_order_seq_cst);
  long v31 = (v9_W3 == 1);
  atomic_store_explicit(&atom_1_X3_1, v31, memory_order_seq_cst);
  long v32 = (v15_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v32, memory_order_seq_cst);
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
  atomic_init(&atom_1_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v17 = (v16 == 1);
  long v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&atom_0_X2_0, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  long v22 = atomic_load_explicit(&atom_1_X3_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  long v24_conj = v22 & v23;
  long v25_conj = v21 & v24_conj;
  long v26_conj = v20 & v25_conj;
  long v27_conj = v19 & v26_conj;
  long v28_conj = v17 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
