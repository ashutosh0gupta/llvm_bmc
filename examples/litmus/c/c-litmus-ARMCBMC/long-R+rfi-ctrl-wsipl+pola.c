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

atomic_long vars[2]; 
atomic_long atom_0_X6_3; 
atomic_long atom_0_X2_1; 
atomic_long atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  long v6_W6 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v21 = (v6_W6 == 3);
  atomic_store_explicit(&atom_0_X6_3, v21, memory_order_seq_cst);
  long v22 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v22, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 3, memory_order_release);
  long v9_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v23 = (v9_W2 == 0);
  atomic_store_explicit(&atom_1_X2_0, v23, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_3, 0); 
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_1_X2_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v10 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v11 = (v10 == 1);
  long v12 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v13 = (v12 == 3);
  long v14 = atomic_load_explicit(&atom_0_X6_3, memory_order_seq_cst);
  long v15 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  long v16 = atomic_load_explicit(&atom_1_X2_0, memory_order_seq_cst);
  long v17_conj = v15 & v16;
  long v18_conj = v14 & v17_conj;
  long v19_conj = v13 & v18_conj;
  long v20_conj = v11 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
