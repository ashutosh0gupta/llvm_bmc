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

atomic_long vars[3]; 
atomic_long atom_0_X6_2; 
atomic_long atom_1_X2_2; 
atomic_long atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W4 = v3_W2 ^ v3_W2;
  long v5_W4 = v4_W4 + 1;
  atomic_store_explicit(&vars[2], v5_W4, memory_order_release);
  long v8_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v26 = (v8_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v26, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  long v11_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v11_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  long v14_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  long v27 = (v11_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v27, memory_order_seq_cst);
  long v28 = (v14_W3 == 0);
  atomic_store_explicit(&atom_1_X3_0, v28, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_2, 0); 
  atomic_init(&atom_1_X2_2, 0); 
  atomic_init(&atom_1_X3_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v15 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v16 = (v15 == 1);
  long v17 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v18 = (v17 == 2);
  long v19 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  long v20 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v21 = atomic_load_explicit(&atom_1_X3_0, memory_order_seq_cst);
  long v22_conj = v20 & v21;
  long v23_conj = v19 & v22_conj;
  long v24_conj = v18 & v23_conj;
  long v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
