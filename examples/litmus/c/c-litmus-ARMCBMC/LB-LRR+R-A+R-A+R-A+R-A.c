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

long vars[5]; 
int atom_0_X0_1; 
int atom_4_X2_0; 
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_3_X0_1; 
int atom_4_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v30 = (v3_W0 == 1);
  atom_0_X0_1 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  atomic_store_explicit(&vars[2], 1, memory_order_release);
  int v32 = (v6_W0 == 1);
  atom_1_X0_1 = v32;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = atomic_load_explicit(&vars[2], memory_order_acquire);
  atomic_store_explicit(&vars[3], 1, memory_order_release);
  int v33 = (v9_W0 == 1);
  atom_2_X0_1 = v33;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v12_W0 = atomic_load_explicit(&vars[3], memory_order_acquire);
  atomic_store_explicit(&vars[4], 1, memory_order_release);
  int v34 = (v12_W0 == 1);
  atom_3_X0_1 = v34;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v15_W0 = atomic_load_explicit(&vars[4], memory_order_acquire);
  int v18_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v31 = (v18_W2 == 0);
  atom_4_X2_0 = v31;
  int v35 = (v15_W0 == 1);
  atom_4_X0_1 = v35;
  return NULL;
}

void *t5(void *arg){
label_6:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 

  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_4_X2_0 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_3_X0_1 = 0; 
  atom_4_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);

  int v19 = atom_0_X0_1;
  int v20 = atom_4_X2_0;
  int v21 = atom_1_X0_1;
  int v22 = atom_2_X0_1;
  int v23 = atom_3_X0_1;
  int v24 = atom_4_X0_1;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v19 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
