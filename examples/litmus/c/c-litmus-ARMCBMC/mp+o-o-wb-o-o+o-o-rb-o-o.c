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

long vars[4]; 
long atom_1_X0_3; 
long atom_1_X4_0; 
long atom_1_X6_0; 
long atom_1_X2_4; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbld();
  int v9_W4 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v12_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v28 = (v3_W0 == 3);
  atomic_store_explicit(&atom_1_X0_3, v28, memory_order_seq_cst);
  int v29 = (v9_W4 == 0);
  atomic_store_explicit(&atom_1_X4_0, v29, memory_order_seq_cst);
  int v30 = (v12_W6 == 0);
  atomic_store_explicit(&atom_1_X6_0, v30, memory_order_seq_cst);
  int v31 = (v6_W2 == 4);
  atomic_store_explicit(&atom_1_X2_4, v31, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[0], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&atom_1_X0_3, 0); 
  atomic_init(&atom_1_X4_0, 0); 
  atomic_init(&atom_1_X6_0, 0); 
  atomic_init(&atom_1_X2_4, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = atomic_load_explicit(&atom_1_X0_3, memory_order_seq_cst);
  int v14 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  int v15 = atomic_load_explicit(&atom_1_X0_3, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_1_X2_4, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X4_0, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_1_X2_4, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X6_0, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_disj = v18 | v21_conj;
  int v23_conj = v17 & v22_disj;
  int v24_disj = v16 | v23_conj;
  int v25_conj = v15 & v24_disj;
  int v26_disj = v14 | v25_conj;
  int v27_conj = v13 & v26_disj;
  if (v27_conj == 1) assert(0);
  return 0;
}
