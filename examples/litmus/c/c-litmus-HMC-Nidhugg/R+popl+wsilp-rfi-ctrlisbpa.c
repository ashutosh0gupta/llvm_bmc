/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

atomic_int vars[2]; 
int atom_0_X4_2; 
int atom_1_X3_3; 
int atom_1_X4_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v3_W4 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v21 = (v3_W4 == 2);
  atom_0_X4_2 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[1], 3, memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v6_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_thread_fence(memory_order_seq_cst);
  int v9_W4 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v22 = (v6_W3 == 3);
  atom_1_X3_3 = v22;
  int v23 = (v9_W4 == 0);
  atom_1_X4_0 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X4_2 = 0; 
  atom_1_X3_3 = 0; 
  atom_1_X4_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v13 = (v12 == 3);
  int v14 = atom_0_X4_2;
  int v15 = atom_1_X3_3;
  int v16 = atom_1_X4_0;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v11 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
