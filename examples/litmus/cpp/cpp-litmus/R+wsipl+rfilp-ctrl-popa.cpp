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
atomic_int atom_0_X3_3; 
atomic_int atom_1_X2_3; 
atomic_int atom_1_X5_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v21 = (v3_W3 == 3);
  atomic_store_explicit(&atom_0_X3_3, v21, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 3, memory_order_release);
  int v6_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v9_W5 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v22 = (v6_W2 == 3);
  atomic_store_explicit(&atom_1_X2_3, v22, memory_order_seq_cst);
  int v23 = (v9_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v23, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X3_3, 0); 
  atomic_init(&atom_1_X2_3, 0); 
  atomic_init(&atom_1_X5_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v11 = (v10 == 3);
  int v12 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v13 = (v12 == 1);
  int v14 = atomic_load_explicit(&atom_0_X3_3, memory_order_seq_cst);
  int v15 = atomic_load_explicit(&atom_1_X2_3, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v11 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
