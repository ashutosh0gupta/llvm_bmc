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

atomic_long vars[5]; 
atomic_long atom_1_X0_1; 
atomic_long atom_1_X5_0; 
atomic_long atom_1_X7_1; 
atomic_long atom_1_X11_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  long v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  long v4_W2 = v3_W0 ^ v3_W0;
  long v7_W3 = atomic_load_explicit(&vars[2+v4_W2], memory_order_relaxed);
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  long v10_W5 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  long v13_W7 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  if (v13_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  long v16_W8 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  long v17_W10 = v16_W8 ^ v16_W8;
  long v20_W11 = atomic_load_explicit(&vars[0+v17_W10], memory_order_relaxed);
  long v37 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v37, memory_order_seq_cst);
  long v38 = (v10_W5 == 0);
  atomic_store_explicit(&atom_1_X5_0, v38, memory_order_seq_cst);
  long v39 = (v13_W7 == 1);
  atomic_store_explicit(&atom_1_X7_1, v39, memory_order_seq_cst);
  long v40 = (v20_W11 == 0);
  atomic_store_explicit(&atom_1_X11_0, v40, memory_order_seq_cst);
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X5_0, 0); 
  atomic_init(&atom_1_X7_1, 0); 
  atomic_init(&atom_1_X11_0, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  long v21 = atomic_load_explicit(&vars[3], memory_order_seq_cst);
  long v22 = (v21 == 1);
  long v23 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  long v24 = (v23 == 1);
  long v25 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  long v26 = (v25 == 1);
  long v27 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  long v28 = atomic_load_explicit(&atom_1_X5_0, memory_order_seq_cst);
  long v29 = atomic_load_explicit(&atom_1_X7_1, memory_order_seq_cst);
  long v30 = atomic_load_explicit(&atom_1_X11_0, memory_order_seq_cst);
  long v31_conj = v29 & v30;
  long v32_conj = v28 & v31_conj;
  long v33_conj = v27 & v32_conj;
  long v34_conj = v26 & v33_conj;
  long v35_conj = v24 & v34_conj;
  long v36_conj = v22 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
