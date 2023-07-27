/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

// A workaround
long vars[2];
int atom_1_X0_2; 
int atom_1_X2_0; 
int atom_3_X0_2; 
int atom_3_X2_0; 

// Parameterized code
void *t0_1(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

void *t0_2(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

void *t0_3(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

void *t0_4(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

void *t0_5(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  return NULL;
}

// Parameterized code
void *t2_1(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

void *t2_2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

void *t2_3(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

void *t2_4(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

void *t2_5(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v6_W2 = atomic_load_explicit(&vars[1], memory_order_acquire);
  int v26 = (v3_W0 == 2);
  atom_1_X0_2 = v26;
  int v27 = (v6_W2 == 0);
  atom_1_X2_0 = v27;
  return NULL;
}


void *t3(void *arg){
label_4:;
  int v9_W0 = atomic_load_explicit(&vars[1], memory_order_acquire);
  int v12_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v28 = (v9_W0 == 2);
  atom_3_X0_2 = v28;
  int v29 = (v12_W2 == 0);
  atom_3_X2_0 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  // Parameterized code
  pthread_t thr0_1, thr0_2, thr0_3, thr0_4, thr0_5; 
  pthread_t thr2_1, thr2_2, thr2_3, thr2_4, thr2_5;
  
  pthread_t thr1;  
  pthread_t thr3; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_2 = 0; 
  atom_1_X2_0 = 0; 
  atom_3_X0_2 = 0; 
  atom_3_X2_0 = 0; 

  // Parameterized code
  pthread_create(&thr0_1, NULL, t0_1, NULL);
  pthread_create(&thr0_2, NULL, t0_2, NULL);
  pthread_create(&thr0_3, NULL, t0_3, NULL);
  pthread_create(&thr0_4, NULL, t0_4, NULL);
  pthread_create(&thr0_5, NULL, t0_5, NULL);
  pthread_create(&thr2_1, NULL, t2_1, NULL);
  pthread_create(&thr2_2, NULL, t2_2, NULL);
  pthread_create(&thr2_3, NULL, t2_3, NULL);
  pthread_create(&thr2_4, NULL, t2_4, NULL);
  pthread_create(&thr2_5, NULL, t2_5, NULL);
  
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  // Parameterized code  
  pthread_join(thr0_1, NULL);
  pthread_join(thr0_2, NULL);
  pthread_join(thr0_3, NULL);
  pthread_join(thr0_4, NULL);
  pthread_join(thr0_5, NULL);
  pthread_join(thr2_1, NULL);
  pthread_join(thr2_2, NULL);
  pthread_join(thr2_3, NULL);
  pthread_join(thr2_4, NULL);
  pthread_join(thr2_5, NULL);
  
  pthread_join(thr1, NULL);
  pthread_join(thr3, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v14 = (v13 == 2);
  int v15 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atom_1_X0_2;
  int v18 = atom_1_X2_0;
  int v19 = atom_3_X0_2;
  int v20 = atom_3_X2_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
