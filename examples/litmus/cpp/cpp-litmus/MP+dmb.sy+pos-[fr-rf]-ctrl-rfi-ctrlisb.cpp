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
atomic_int atom_1_X0_1; 
atomic_int atom_1_X2_1; 
atomic_int atom_1_X3_2; 
atomic_int atom_1_X6_1; 
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
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v9_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v12_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v12_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  int v15_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v34 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v34, memory_order_seq_cst);
  int v35 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v35, memory_order_seq_cst);
  int v36 = (v9_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v36, memory_order_seq_cst);
  int v37 = (v12_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v37, memory_order_seq_cst);
  int v38 = (v15_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v38, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 
  atomic_init(&atom_1_X6_1, 0); 
  atomic_init(&atom_1_X7_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v17 = (v16 == 1);
  int v18 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v19 = (v18 == 2);
  int v20 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v21 & v30_conj;
  int v32_conj = v19 & v31_conj;
  int v33_conj = v17 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
