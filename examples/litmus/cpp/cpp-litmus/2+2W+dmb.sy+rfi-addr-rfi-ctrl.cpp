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
atomic_int atom_1_X2_2; 
atomic_int atom_1_X6_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  atomic_store_explicit(&vars[2+v4_W3], 1, memory_order_relaxed);
  int v7_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v7_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v20 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v20, memory_order_seq_cst);
  int v21 = (v7_W6 == 1);
  atomic_store_explicit(&atom_1_X6_1, v21, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X6_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v9 = (v8 == 2);
  int v10 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v11 = (v10 == 2);
  int v12 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v15 = atomic_load_explicit(&atom_1_X6_1, memory_order_seq_cst);
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v11 & v17_conj;
  int v19_conj = v9 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}