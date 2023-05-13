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

atomic_int vars[4]; 
atomic_int atom_1_X0_1; 
atomic_int atom_1_X2_0; 
atomic_int atom_1_X4_1; 
atomic_int atom_1_X8_0; 
atomic_int atom_1_X10_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v9_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10_W5 = v9_W4 ^ v9_W4;
  int v13_W6 = atomic_load_explicit(&vars[3+v10_W5], memory_order_relaxed);
  if (v13_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v16_W8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19_W10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v38 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v38, memory_order_seq_cst);
  int v39 = (v6_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v39, memory_order_seq_cst);
  int v40 = (v9_W4 == 1);
  atomic_store_explicit(&atom_1_X4_1, v40, memory_order_seq_cst);
  int v41 = (v16_W8 == 0);
  atomic_store_explicit(&atom_1_X8_0, v41, memory_order_seq_cst);
  int v42 = (v19_W10 == 0);
  atomic_store_explicit(&atom_1_X10_0, v42, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);

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
  atomic_init(&atom_1_X2_0, 0); 
  atomic_init(&atom_1_X4_1, 0); 
  atomic_init(&atom_1_X8_0, 0); 
  atomic_init(&atom_1_X10_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v25 = (v24 == 1);
  int v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_1_X4_1, memory_order_seq_cst);
  int v29 = atomic_load_explicit(&atom_1_X8_0, memory_order_seq_cst);
  int v30 = atomic_load_explicit(&atom_1_X10_0, memory_order_seq_cst);
  int v31_conj = v29 & v30;
  int v32_conj = v28 & v31_conj;
  int v33_conj = v27 & v32_conj;
  int v34_conj = v26 & v33_conj;
  int v35_conj = v25 & v34_conj;
  int v36_conj = v23 & v35_conj;
  int v37_conj = v21 & v36_conj;
  if (v37_conj == 1) assert(0);
  return 0;
}
