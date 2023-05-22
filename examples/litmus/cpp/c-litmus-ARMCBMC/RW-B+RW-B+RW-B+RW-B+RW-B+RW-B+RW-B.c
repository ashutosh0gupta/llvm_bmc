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

atomic_int vars[7]; 
atomic_int atom_0_X0_1; 
atomic_int atom_1_X0_1; 
atomic_int atom_2_X0_1; 
atomic_int atom_3_X0_1; 
atomic_int atom_4_X0_1; 
atomic_int atom_5_X0_1; 
atomic_int atom_6_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v35 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v35, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v36 = (v6_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v36, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v37 = (v9_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v37, memory_order_seq_cst);
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v38 = (v12_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v38, memory_order_seq_cst);
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v15_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  int v39 = (v15_W0 == 1);
  atomic_store_explicit(&atom_4_X0_1, v39, memory_order_seq_cst);
  return NULL;
}

void *t5(void *arg){
label_6:;
  int v18_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);
  int v40 = (v18_W0 == 1);
  atomic_store_explicit(&atom_5_X0_1, v40, memory_order_seq_cst);
  return NULL;
}

void *t6(void *arg){
label_7:;
  int v21_W0 = atomic_load_explicit(&vars[6], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v41 = (v21_W0 == 1);
  atomic_store_explicit(&atom_6_X0_1, v41, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 
  pthread_t thr6; 

  atomic_init(&vars[6], 0);
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
  atomic_init(&atom_6_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);
  pthread_create(&thr6, NULL, t6, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);
  pthread_join(thr6, NULL);

  int v22 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v24 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_4_X0_1, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_5_X0_1, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_6_X0_1, memory_order_seq_cst);
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v23 & v32_conj;
  int v34_conj = v22 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
