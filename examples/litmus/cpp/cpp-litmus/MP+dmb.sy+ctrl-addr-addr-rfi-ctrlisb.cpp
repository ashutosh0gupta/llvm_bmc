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
atomic_int atom_1_X0_1; 
atomic_int atom_1_X10_1; 
atomic_int atom_1_X11_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);

}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = atomic_load_explicit(&vars[3+v7_W4], memory_order_relaxed);
  int v11_W7 = v10_W5 ^ v10_W5;
  atomic_store_explicit(&vars[4+v11_W7], 1, memory_order_relaxed);
  int v14_W10 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  if (v14_W10) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  isb();
  int v17_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v32 = (v3_W0 == 1);
  atomic_store_explicit(&atom_1_X0_1, v32, memory_order_seq_cst);
  int v33 = (v14_W10 == 1);
  atomic_store_explicit(&atom_1_X10_1, v33, memory_order_seq_cst);
  int v34 = (v17_W11 == 0);
  atomic_store_explicit(&atom_1_X11_0, v34, memory_order_seq_cst);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atomic_init(&atom_1_X0_1, 0); 
  atomic_init(&atom_1_X10_1, 0); 
  atomic_init(&atom_1_X11_0, 0); 

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = atomic_load_explicit(&vars[4], memory_order_seq_cst);
  int v19 = (v18 == 1);
  int v20 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v21 = (v20 == 1);
  int v22 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v23 = (v22 == 1);
  int v24 = atomic_load_explicit(&atom_1_X0_1, memory_order_seq_cst);
  int v25 = atomic_load_explicit(&atom_1_X10_1, memory_order_seq_cst);
  int v26 = atomic_load_explicit(&atom_1_X11_0, memory_order_seq_cst);
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v21 & v29_conj;
  int v31_conj = v19 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
