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

atomic_long vars[6]; 
atomic_long atom_0_X0_1; 
atomic_long atom_0_X4_1; 
atomic_long atom_1_X0_1; 
atomic_long atom_2_X0_1; 
atomic_long atom_2_X4_1; 
atomic_long atom_3_X0_1; 

void *t0(void *arg){
label_1:;
  long v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v5_W2 = v4_W2 + 1;
  atomic_store_explicit(&vars[1], v5_W2, memory_order_relaxed);
  long v8_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  long v9_W6 = v8_W4 ^ v8_W4;
  atomic_store_explicit(&vars[3+v9_W6], 1, memory_order_relaxed);
  long v36 = (v3_W0 == 1);
  atomic_store_explicit(&atom_0_X0_1, v36, memory_order_seq_cst);
  long v37 = (v8_W4 == 1);
  atomic_store_explicit(&atom_0_X4_1, v37, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v12_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  long v38 = (v12_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v38, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  long v15_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v16_W2 = v15_W0 ^ v15_W0;
  long v17_W2 = v16_W2 + 1;
  atomic_store_explicit(&vars[4], v17_W2, memory_order_relaxed);
  long v20_W4 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  long v21_W6 = v20_W4 ^ v20_W4;
  atomic_store_explicit(&vars[0+v21_W6], 1, memory_order_relaxed);
  long v39 = (v15_W0 == 1);
  atomic_store_explicit(&atom_2_X0_1, v39, memory_order_seq_cst);
  long v40 = (v20_W4 == 1);
  atomic_store_explicit(&atom_2_X4_1, v40, memory_order_seq_cst);
  return NULL;
}

void *t3(void *arg){
label_4:;
  long v24_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  atomic_store_explicit(&vars[5], 1, memory_order_release);
  long v41 = (v24_W0 == 1);
  atomic_store_explicit(&atom_3_X0_1, v41, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X0_1, 0); 
  atomic_init(&atom_0_X4_1, 0); 
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_2_X0_1, 0); 
  atomic_init(&atom_2_X4_1, 0); 
  atomic_init(&atom_3_X0_1, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  long v25 = atomic_load_explicit(&atom_0_X0_1, memory_order_seq_cst);
  long v26 = atomic_load_explicit(&atom_0_X4_1, memory_order_seq_cst);
  long v27 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_2_X0_1, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_2_X4_1, memory_order_seq_cst);
  long v30 = atomic_load_explicit(&atom_3_X0_1, memory_order_seq_cst);
  long v31_conj = v29 & v30;
  long v32_conj = v28 & v31_conj;
  long v33_conj = v27 & v32_conj;
  long v34_conj = v26 & v33_conj;
  long v35_conj = v25 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
