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
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X3_2; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  long v23 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v23, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v11_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v11_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v24 = (v8_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v24, memory_order_seq_cst);
  long v25 = (v11_W3 == 2);
  atomic_store_explicit(&atom_1_X3_2, v25, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X3_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v12 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v13 = (v12 == 1);
  long v14 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v15 = (v14 == 2);
  long v16 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v17 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v18 = atomic_load_explicit(&atom_1_X3_2, memory_order_seq_cst);
  long v19_conj = v17 & v18;
  long v20_conj = v16 & v19_conj;
  long v21_conj = v15 & v20_conj;
  long v22_conj = v13 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
