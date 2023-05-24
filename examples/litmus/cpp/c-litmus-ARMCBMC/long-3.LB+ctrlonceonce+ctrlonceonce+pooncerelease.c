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
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 
atomic_long atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label245; else goto lbl_label245;
lbl_label245:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v17 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v17, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v7_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v8_cmpeq = (v7_W0 == 0);
  if (v8_cmpeq)  goto lbl_label246; else goto lbl_label246;
lbl_label246:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v18 = (v7_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v18, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v11_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  long v19 = (v11_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v19, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v12 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v13 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v14 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v15_conj = v13 & v14;
  long v16_conj = v12 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
