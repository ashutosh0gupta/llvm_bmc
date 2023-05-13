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
atomic_int atom_1_X2_1; 
atomic_int atom_1_X3_0; 
atomic_int atom_1_X5_0; 
atomic_int atom_1_X6_1; 
atomic_int atom_1_X7_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v15_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v36 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v36, memory_order_seq_cst);
  int v37 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v37, memory_order_seq_cst);
  int v38 = (v9_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v38, memory_order_seq_cst);
  int v39 = (v12_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v39, memory_order_seq_cst);
  int v40 = (v15_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v40, memory_order_seq_cst);
  int v41 = (v18_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v41, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X2_1, 0); 
  atomic_init(&atom_1_X3_0, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X6_1, 0); 
  atomic_init(&atom_1_X7_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v22 = (v21 == 1);
  int v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v23 & v32_conj;
  int v34_conj = v22 & v33_conj;
  int v35_conj = v20 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
