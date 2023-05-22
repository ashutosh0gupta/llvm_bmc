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

atomic_int vars[6]; 
atomic_int atom_0_X0_1; 
atomic_int atom_1_X0_1; 
atomic_int atom_2_X0_1; 
atomic_int atom_3_X0_1; 
atomic_int atom_4_X0_1; 
atomic_int atom_5_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v30 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v30, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v31 = (v6_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v31, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v32 = (v9_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v32, memory_order_seq_cst);

}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v33 = (v12_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v33, memory_order_seq_cst);

}

void *t4(void *arg){
label_5:;
  int v15_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  int v34 = (v15_W0 == 1);
  atomic_store_explicit(&atom_4_X0_1, v34, memory_order_seq_cst);

}

void *t5(void *arg){
label_6:;
  int v18_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v35 = (v18_W0 == 1);
  atomic_store_explicit(&atom_5_X0_1, v35, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 
  atomic_init(&atom_3_X0_1, 0); 
  atomic_init(&atom_4_X0_1, 0); 
  atomic_init(&atom_5_X0_1, 0); 

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

  int v19 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v20 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_4_X0_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_5_X0_1, memory_order_seq_cst);
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v19 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}