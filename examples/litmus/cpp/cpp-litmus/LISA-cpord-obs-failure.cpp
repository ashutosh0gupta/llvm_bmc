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

atomic_int vars[7]; 
atomic_int atom_0_X0_1; 
atomic_int atom_0_X3_1; 
atomic_int atom_1_X0_1; 
atomic_int atom_2_X1_0; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  atomic_store_explicit(&vars[2], v3_W0, memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], v6_W3, memory_order_relaxed);
  int v29 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v29, memory_order_seq_cst);
  int v30 = (v6_W3 == 1);
  atomic_store_explicit(&atom_0_X3_1, v30, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v31 = (v9_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v31, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[4], 2, memory_order_relaxed);
  dmbsy();
  int v12_W1 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  int v32 = (v12_W1 == 0);
  atomic_store_explicit(&atom_2_X1_0, v32, memory_order_seq_cst);

}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t4(void *arg){
label_5:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);

}

void *t5(void *arg){
label_6:;
  atomic_store_explicit(&vars[6], 2, memory_order_relaxed);
  dmbst();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 

  atomic_init(&vars[6], 0);
  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_0_X3_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X1_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);
  pthread_create(&thr3, t3, NULL);
  pthread_create(&thr4, t4, NULL);
  pthread_create(&thr5, t5, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);

  int v13 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v14 = atomic_load_explicit(&atom_0_X3_1, memory_order_seq_cst);
  int v15 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v16 = atomic_load_explicit(&vars[4], memory_order_seq_cst);
  int v17 = (v16 == 2);
  int v18 = atomic_load_explicit(&atom_2_X1_0, memory_order_seq_cst);
  int v19 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v20 = (v19 == 2);
  int v21 = atomic_load_explicit(&vars[6], memory_order_seq_cst);
  int v22 = (v21 == 2);
  int v23_conj = v20 & v22;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v15 & v25_conj;
  int v27_conj = v14 & v26_conj;
  int v28_conj = v13 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
