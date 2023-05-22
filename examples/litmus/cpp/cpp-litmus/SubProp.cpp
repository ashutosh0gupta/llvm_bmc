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

atomic_int vars[4]; 
atomic_int atom_1_X5_1; 
atomic_int atom_2_X4_2; 
atomic_int atom_2_X5_1; 
atomic_int atom_2_X6_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 0, memory_order_release);
  atomic_store_explicit(&vars[2], 0, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 0, memory_order_release);
  int v3_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W7 = v3_W5 ^ v3_W5;
  atomic_store_explicit(&vars[3+v4_W7], 0, memory_order_relaxed);
  int v26 = (v3_W5 == 1);
  atomic_store_explicit(&atom_1_X5_1, v26, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v7_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8_W7 = v7_W4 ^ v7_W4;
  int v11_W5 = atomic_load_explicit(&vars[3+v8_W7], memory_order_relaxed);
  int v12_W8 = v11_W5 ^ v11_W5;
  int v15_W6 = atomic_load_explicit(&vars[0+v12_W8], memory_order_relaxed);
  int v27 = (v7_W4 == 2);
  atomic_store_explicit(&atom_2_X4_2, v27, memory_order_seq_cst);
  int v28 = (v11_W5 == 1);
  atomic_store_explicit(&atom_2_X5_1, v28, memory_order_seq_cst);
  int v29 = (v15_W6 == 0);
  atomic_store_explicit(&atom_2_X6_0, v29, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X5_1, 0); 
  atomic_init(&atom_2_X4_2, 0); 
  atomic_init(&atom_2_X5_1, 0); 
  atomic_init(&atom_2_X6_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&atom_1_X5_1, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_2_X4_2, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_2_X5_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_2_X6_0, memory_order_seq_cst);
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
