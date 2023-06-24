/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[8]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_3_X0_1; 
int atom_4_X0_1; 
int atom_5_X0_1; 
int atom_6_X0_1; 
int atom_7_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v40 = (v3_W0 == 1);
  atom_0_X0_1 = v40;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v41 = (v6_W0 == 1);
  atom_1_X0_1 = v41;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v42 = (v9_W0 == 1);
  atom_2_X0_1 = v42;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v43 = (v12_W0 == 1);
  atom_3_X0_1 = v43;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v15_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  int v44 = (v15_W0 == 1);
  atom_4_X0_1 = v44;
  return NULL;
}

void *t5(void *arg){
label_6:;
  int v18_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);
  int v45 = (v18_W0 == 1);
  atom_5_X0_1 = v45;
  return NULL;
}

void *t6(void *arg){
label_7:;
  int v21_W0 = atomic_load_explicit(&vars[6], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[7], 1, memory_order_relaxed);
  int v46 = (v21_W0 == 1);
  atom_6_X0_1 = v46;
  return NULL;
}

void *t7(void *arg){
label_8:;
  int v24_W0 = atomic_load_explicit(&vars[7], memory_order_relaxed);
  atomic_thread_fence(memory_order_seq_cst);
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v47 = (v24_W0 == 1);
  atom_7_X0_1 = v47;
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
  pthread_t thr7; 

  atomic_init(&vars[7], 0);
  atomic_init(&vars[6], 0);
  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_3_X0_1 = 0; 
  atom_4_X0_1 = 0; 
  atom_5_X0_1 = 0; 
  atom_6_X0_1 = 0; 
  atom_7_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);
  pthread_create(&thr6, NULL, t6, NULL);
  pthread_create(&thr7, NULL, t7, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);
  pthread_join(thr6, NULL);
  pthread_join(thr7, NULL);

  int v25 = atom_0_X0_1;
  int v26 = atom_1_X0_1;
  int v27 = atom_2_X0_1;
  int v28 = atom_3_X0_1;
  int v29 = atom_4_X0_1;
  int v30 = atom_5_X0_1;
  int v31 = atom_6_X0_1;
  int v32 = atom_7_X0_1;
  int v33_conj = v31 & v32;
  int v34_conj = v30 & v33_conj;
  int v35_conj = v29 & v34_conj;
  int v36_conj = v28 & v35_conj;
  int v37_conj = v27 & v36_conj;
  int v38_conj = v26 & v37_conj;
  int v39_conj = v25 & v38_conj;
  if (v39_conj == 1) assert(0);
  return 0;
}
