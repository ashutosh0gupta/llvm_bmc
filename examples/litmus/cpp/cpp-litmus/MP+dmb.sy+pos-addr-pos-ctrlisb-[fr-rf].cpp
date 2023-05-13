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
atomic_int atom_1_X7_0; 
atomic_int atom_1_X9_1; 

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
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = atomic_load_explicit(&vars[2+v7_W3], memory_order_relaxed);
  int v13_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v13_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v16_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19_W9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v33 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v33, memory_order_seq_cst);
  int v34 = (v6_W2 == 1);
  atomic_store_explicit(&atom_1_X2_1, v34, memory_order_seq_cst);
  int v35 = (v16_W7 == 0);
  atomic_store_explicit(&atom_1_X7_0, v35, memory_order_seq_cst);
  int v36 = (v19_W9 == 1);
  atomic_store_explicit(&atom_1_X9_1, v36, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);

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
  atomic_init(&atom_1_X7_0, 0); 
  atomic_init(&atom_1_X9_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v21 = (v20 == 2);
  int v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X2_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X7_0, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_1_X9_1, memory_order_seq_cst);
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v23 & v30_conj;
  int v32_conj = v21 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
