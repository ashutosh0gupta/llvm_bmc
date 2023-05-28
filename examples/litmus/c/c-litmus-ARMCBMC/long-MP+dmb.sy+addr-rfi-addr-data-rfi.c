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
atomic_long atom_1_X0_1; 
atomic_long atom_1_X5_1; 
atomic_long atom_1_X11_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  atomic_store_explicit(&vars[2+v4_W2], 1, memory_order_relaxed);
  long v7_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v8_W6 = v7_W5 ^ v7_W5;
  long v11_W7 = atomic_load_explicit(&vars[3+v8_W6], memory_order_relaxed);
  long v12_W9 = v11_W7 ^ v11_W7;
  long v13_W9 = v12_W9 + 1;
  atomic_store_explicit(&vars[0], v13_W9, memory_order_relaxed);
  long v16_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v31 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v31, memory_order_seq_cst);
  long v32 = (v7_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v32, memory_order_seq_cst);
  long v33 = (v16_W11 == 1);
  atomic_store_explicit(&atom_1_X11_1, v33, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_1_X11_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v17 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v18 = (v17 == 2);
  long v19 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v20 = (v19 == 1);
  long v21 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  long v22 = (v21 == 1);
  long v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v24 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  long v25 = atomic_load_explicit(&atom_1_X11_1, memory_order_seq_cst);
  long v26_conj = v24 & v25;
  long v27_conj = v23 & v26_conj;
  long v28_conj = v22 & v27_conj;
  long v29_conj = v20 & v28_conj;
  long v30_conj = v18 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
