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

atomic_long vars[4]; 
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  long v27 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v27, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v8_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v8_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v11_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v12_W4 = v11_W2 ^ v11_W2;
  long v15_W5 = atomic_load_explicit(&vars[3+v12_W4], memory_order_relaxed);
  long v16_W7 = v15_W5 ^ v15_W5;
  long v17_W7 = v16_W7 + 1;
  atomic_store_explicit(&vars[0], v17_W7, memory_order_relaxed);
  long v28 = (v8_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v28, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v18 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v19 = (v18 == 1);
  long v20 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v21 = (v20 == 1);
  long v22 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v24_conj = v22 & v23;
  long v25_conj = v21 & v24_conj;
  long v26_conj = v19 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
