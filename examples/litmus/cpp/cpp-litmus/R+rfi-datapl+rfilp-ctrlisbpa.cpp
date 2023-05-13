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
atomic_int atom_0_X5_2; 
atomic_int atom_0_X2_1; 
atomic_int atom_1_X2_2; 
atomic_int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_W3 = v3_W2 ^ v3_W2;
  int v5_W3 = v4_W3 + 1;
  atomic_store_explicit(&vars[1], v5_W3, memory_order_release);
  int v8_W5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v28 = (v8_W5 == 2);
  atomic_store_explicit(&atom_0_X5_2, v28, memory_order_seq_cst);
  int v29 = (v3_W2 == 1);
  atomic_store_explicit(&atom_0_X2_1, v29, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  int v11_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v11_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v14_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v30 = (v11_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v30, memory_order_seq_cst);
  int v31 = (v14_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v31, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X5_2, 0); 
  atomic_init(&atom_0_X2_1, 0); 
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X3_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v18 = (v17 == 2);
  int v19 = atomic_load_explicit(&atom_0_X5_2, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_0_X2_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  int v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
