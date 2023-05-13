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
atomic_int atom_0_X2_0; 
atomic_int atom_1_X2_1; 
atomic_int atom_1_X3_0; 
atomic_int atom_1_X5_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v26 = (v3_W2 == 0);
  atomic_store_explicit(&atom_0_X2_0, v26, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v27 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v27, memory_order_seq_cst);
  int v28 = (v9_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v28, memory_order_seq_cst);
  int v29 = (v12_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v29, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_0, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&atom_0_X2_0, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
