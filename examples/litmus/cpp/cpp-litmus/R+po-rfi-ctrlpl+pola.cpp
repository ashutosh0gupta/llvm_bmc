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

atomic_int vars[3]; 
atomic_int atom_0_X7_2; 
atomic_int atom_0_X4_1; 
atomic_int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v3_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v6_W7 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v24 = (v6_W7 == 2);
  atomic_store_explicit(&atom_0_X7_2, v24, memory_order_seq_cst);
  int v25 = (v3_W4 == 1);
  atomic_store_explicit(&atom_0_X4_1, v25, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  int v9_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v26 = (v9_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v26, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X7_2, 0); 
  atomic_init(&atom_0_X4_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v11 = (v10 == 1);
  int v12 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v15 = (v14 == 2);
  int v16 = atomic_load_explicit(&atom_0_X7_2, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_0_X4_1, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v13 & v21_conj;
  int v23_conj = v11 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}