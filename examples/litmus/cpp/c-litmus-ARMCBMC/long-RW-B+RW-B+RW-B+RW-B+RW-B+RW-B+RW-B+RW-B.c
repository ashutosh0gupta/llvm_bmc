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

atomic_long vars[8]; 
atomic_long atom_0_X0_1; 
atomic_long atom_1_X0_1; 
atomic_long atom_2_X0_1; 
atomic_long atom_3_X0_1; 
atomic_long atom_4_X0_1; 
atomic_long atom_5_X0_1; 
atomic_long atom_6_X0_1; 
atomic_long atom_7_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  long v40 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v40, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v6_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  long v41 = (v6_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v41, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  long v42 = (v9_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v42, memory_order_seq_cst);
  return NULL;
}

void *t3(void *arg){
label_4:;
  long v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  long v43 = (v12_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v43, memory_order_seq_cst);
  return NULL;
}

void *t4(void *arg){
label_5:;
  long v15_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  long v44 = (v15_W0 == 1);
  atomic_store_explicit(&atom_4_X0_1, v44, memory_order_seq_cst);
  return NULL;
}

void *t5(void *arg){
label_6:;
  long v18_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);
  long v45 = (v18_W0 == 1);
  atomic_store_explicit(&atom_5_X0_1, v45, memory_order_seq_cst);
  return NULL;
}

void *t6(void *arg){
label_7:;
  long v21_W0 = atomic_load_explicit(&vars[6], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[7], 1, memory_order_relaxed);
  long v46 = (v21_W0 == 1);
  atomic_store_explicit(&atom_6_X0_1, v46, memory_order_seq_cst);
  return NULL;
}

void *t7(void *arg){
label_8:;
  long v24_W0 = atomic_load_explicit(&vars[7], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  long v47 = (v24_W0 == 1);
  atomic_store_explicit(&atom_7_X0_1, v47, memory_order_seq_cst);
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
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 
  atomic_init(&atom_3_X0_1, 0); 
  atomic_init(&atom_4_X0_1, 0); 
  atomic_init(&atom_5_X0_1, 0); 
  atomic_init(&atom_6_X0_1, 0); 
  atomic_init(&atom_7_X0_1, 0); 

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

  long v25 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_4_X0_1, memory_order_seq_cst);
  long v30 = atomic_load_explicit(&atom_5_X0_1, memory_order_seq_cst);
  long v31 = atomic_load_explicit(&atom_6_X0_1, memory_order_seq_cst);
  long v32 = atomic_load_explicit(&atom_7_X0_1, memory_order_seq_cst);
  long v33_conj = v31 & v32;
  long v34_conj = v30 & v33_conj;
  long v35_conj = v29 & v34_conj;
  long v36_conj = v28 & v35_conj;
  long v37_conj = v27 & v36_conj;
  long v38_conj = v26 & v37_conj;
  long v39_conj = v25 & v38_conj;
  if (v39_conj == 1) assert(0);
  return 0;
}
