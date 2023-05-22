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

atomic_int vars[5]; 
atomic_int atom_3_X2_0; 
atomic_int atom_4_X1_0; 
atomic_int atom_1_X0_1; 
atomic_int atom_2_X0_1; 
atomic_int atom_3_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v27 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v27, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  int v6_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v28 = (v6_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v28, memory_order_seq_cst);

}

void *t3(void *arg){
label_4:;
  int v9_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  int v12_W2 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  int v25 = (v12_W2 == 0);
  atomic_store_explicit(&atom_3_X2_0, v25, memory_order_seq_cst);
  int v29 = (v9_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v29, memory_order_seq_cst);

}

void *t4(void *arg){
label_5:;
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  dmbsy();
  int v15_W1 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v26 = (v15_W1 == 0);
  atomic_store_explicit(&atom_4_X1_0, v26, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_3_X2_0, 0); 
  atomic_init(&atom_4_X1_0, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 
  atomic_init(&atom_3_X0_1, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);
  pthread_create(&thr3, t3, NULL);
  pthread_create(&thr4, t4, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);

  int v16 = atomic_load_explicit(&atom_3_X2_0, memory_order_seq_cst);
  int v17 = atomic_load_explicit(&atom_4_X1_0, memory_order_seq_cst);
  int v18 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}