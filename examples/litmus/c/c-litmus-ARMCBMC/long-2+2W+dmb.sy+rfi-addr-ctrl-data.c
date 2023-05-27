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
atomic_long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  long v3_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W3 = v3_W2 ^ v3_W2;
  long v7_W4 = atomic_load_explicit(&vars[2+v4_W3], memory_order_relaxed);
  if (v7_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  long v10_W6 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v11_W8 = v10_W6 ^ v10_W6;
  long v12_W8 = v11_W8 + 1;
  atomic_store_explicit(&vars[0], v12_W8, memory_order_relaxed);
  long v20 = (v3_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v20, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  long v13 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v14 = (v13 == 2);
  long v15 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v16 = (v15 == 2);
  long v17 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  long v18_conj = v16 & v17;
  long v19_conj = v14 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
