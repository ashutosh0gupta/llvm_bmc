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
atomic_long atom_1_X0_1; 
atomic_long atom_1_X4_1; 
atomic_long atom_1_X6_0; 

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
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v7_W5 = v6_W4 ^ v6_W4;
  long v10_W6 = atomic_load_explicit(&vars[0+v7_W5], memory_order_relaxed);
  long v25 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v25, memory_order_seq_cst);
  long v26 = (v6_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v26, memory_order_seq_cst);
  long v27 = (v10_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v27, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v11 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v12 = (v11 == 1);
  long v13 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v14 = (v13 == 1);
  long v15 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v16 = (v15 == 1);
  long v17 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  long v19 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  long v20_conj = v18 & v19;
  long v21_conj = v17 & v20_conj;
  long v22_conj = v16 & v21_conj;
  long v23_conj = v14 & v22_conj;
  long v24_conj = v12 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
