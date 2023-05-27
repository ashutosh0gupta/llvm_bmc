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

long vars[2]; 
long atom_0_X6_2; 
long atom_0_X2_3; 
long atom_1_X3_3; 
long atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W5 = v6_W3 ^ v6_W3;
  int v8_W5 = v7_W5 + 1;
  atomic_store_explicit(&vars[0], v8_W5, memory_order_release);
  int v11_W6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v28 = (v11_W6 == 2);
  atomic_store_explicit(&atom_0_X6_2, v28, memory_order_seq_cst);
  int v29 = (v3_W2 == 3);
  atomic_store_explicit(&atom_0_X2_3, v29, memory_order_seq_cst);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v14_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v17_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v30 = (v17_W3 == 3);
  atomic_store_explicit(&atom_1_X3_3, v30, memory_order_seq_cst);
  int v31 = (v14_W2 == 2);
  atomic_store_explicit(&atom_1_X2_2, v31, memory_order_seq_cst);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_0_X6_2, 0); 
  atomic_init(&atom_0_X2_3, 0); 
  atomic_init(&atom_1_X3_3, 0); 
  atomic_init(&atom_1_X2_2, 0); 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v19 = (v18 == 3);
  int v20 = atomic_load_explicit(&atom_0_X6_2, memory_order_seq_cst);
  int v21 = atomic_load_explicit(&atom_0_X2_3, memory_order_seq_cst);
  int v22 = atomic_load_explicit(&atom_1_X3_3, memory_order_seq_cst);
  int v23 = atomic_load_explicit(&atom_1_X2_2, memory_order_seq_cst);
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
