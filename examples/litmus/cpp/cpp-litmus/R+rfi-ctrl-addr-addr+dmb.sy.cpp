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
atomic_int atom_0_X2_1; 
atomic_int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W5 = v6_W3 ^ v6_W3;
  int v10_W6 = atomic_load_explicit(&vars[2+v7_W5], memory_order_relaxed);
  int v11_W8 = v10_W6 ^ v10_W6;
  atomic_store_explicit(&vars[3+v11_W8], 1, memory_order_relaxed);
  int v24 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v24, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[3], 2, memory_order_relaxed);
  dmbsy();
  int v14_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v14_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v25, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  int v16 = (v15 == 2);
  int v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v16 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
