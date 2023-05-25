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

long vars[3]; 
long atom_0_X7_2; 
long atom_1_X3_3; 
long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v9_W7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v24 = (v9_W7 == 2);
  atomic_store_explicit(&atom_0_X7_2, v24, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v12_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v15_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v25 = (v15_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v25, memory_order_seq_cst);
  int v26 = (v12_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v26, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X7_2, 0); 
  atomic_init(&atom_1_X3_3, 0); 
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v17 = (v16 == 3);
  int v18 = atomic_load_explicit(&atom_0_X7_2, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
