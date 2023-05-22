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

atomic_int vars[2]; 
atomic_int atom_0_X3_3; 
atomic_int atom_1_X2_3; 
atomic_int atom_1_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v22 = (v3_W3 == 3);
  atomic_store_explicit(&atom_0_X3_3, v22, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 3, memory_order_release);
  int v6_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = atomic_load_explicit(&vars[1+v7_W3], memory_order_relaxed);
  if (v10_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v13_W6 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v23 = (v6_W2 == 3);
  atomic_store_explicit(&atom_1_X2_3, v23, memory_order_seq_cst);
  int v24 = (v13_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v24, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X3_3, 0); 
  atomic_init(&atom_1_X2_3, 0); 
  atomic_init(&atom_1_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v15 = (v14 == 3);
  int v16 = atomic_load_explicit(&atom_0_X3_3, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X2_3, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
