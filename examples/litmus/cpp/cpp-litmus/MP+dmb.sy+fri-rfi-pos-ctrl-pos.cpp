/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

// Memory barriers
void dmbsy();
void dmbst();
void dmbld();
void isb();

atomic_int vars[2]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X3_2; 
atomic_int atom_1_X4_2; 
atomic_int atom_1_X5_0; 
atomic_int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v9_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v12_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v31, memory_order_seq_cst);
  int v32 = (v6_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v32, memory_order_seq_cst);
  int v33 = (v9_W4 == 2);
  atomic_store_explicit(&atom_1_X4_2, v33, memory_order_seq_cst);
  int v34 = (v12_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v34, memory_order_seq_cst);
  int v35 = (v15_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v35, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X4_2, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X4_2, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v19 & v28_conj;
  int v30_conj = v17 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
