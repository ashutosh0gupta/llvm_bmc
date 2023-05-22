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

atomic_int vars[8]; 
atomic_int atom_0_X0_1; 
atomic_int atom_1_X0_1; 
atomic_int atom_2_X0_1; 
atomic_int atom_3_X0_1; 
atomic_int atom_4_X0_1; 
atomic_int atom_5_X0_1; 
atomic_int atom_6_X0_1; 
atomic_int atom_7_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v40 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v40, memory_order_seq_cst);

}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v41 = (v6_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v41, memory_order_seq_cst);

}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v42 = (v9_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v42, memory_order_seq_cst);

}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v43 = (v12_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v43, memory_order_seq_cst);

}

void *t4(void *arg){
label_5:;
  int v15_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  int v44 = (v15_W0 == 1);
  atomic_store_explicit(&atom_4_X0_1, v44, memory_order_seq_cst);

}

void *t5(void *arg){
label_6:;
  int v18_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);
  int v45 = (v18_W0 == 1);
  atomic_store_explicit(&atom_5_X0_1, v45, memory_order_seq_cst);

}

void *t6(void *arg){
label_7:;
  int v21_W0 = atomic_load_explicit(&vars[6], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[7], 1, memory_order_relaxed);
  int v46 = (v21_W0 == 1);
  atomic_store_explicit(&atom_6_X0_1, v46, memory_order_seq_cst);

}

void *t7(void *arg){
label_8:;
  int v24_W0 = atomic_load_explicit(&vars[7], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v47 = (v24_W0 == 1);
  atomic_store_explicit(&atom_7_X0_1, v47, memory_order_seq_cst);

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

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);
  pthread_create(&thr3, t3, NULL);
  pthread_create(&thr4, t4, NULL);
  pthread_create(&thr5, t5, NULL);
  pthread_create(&thr6, t6, NULL);
  pthread_create(&thr7, t7, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);
  pthread_join(thr6, NULL);
  pthread_join(thr7, NULL);

  int v25 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v27 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  int v28 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  int v29 = atomic_load_explicit(&atom_4_X0_1, memory_order_seq_cst);
  int v30 = atomic_load_explicit(&atom_5_X0_1, memory_order_seq_cst);
  int v31 = atomic_load_explicit(&atom_6_X0_1, memory_order_seq_cst);
  int v32 = atomic_load_explicit(&atom_7_X0_1, memory_order_seq_cst);
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