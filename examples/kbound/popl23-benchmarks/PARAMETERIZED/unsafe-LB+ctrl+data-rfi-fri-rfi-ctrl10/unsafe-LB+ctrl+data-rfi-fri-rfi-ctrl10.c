/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

// A workaround
long vars[3];

// Parameterized code
int atom_0_X0_1_1; 
int atom_0_X0_1_2;
int atom_0_X0_1_3;
int atom_0_X0_1_4;
int atom_0_X0_1_5;  
int atom_0_X0_1_6; 
int atom_0_X0_1_7;
int atom_0_X0_1_8;
int atom_0_X0_1_9;
int atom_0_X0_1_10;

int atom_1_X0_1; 
int atom_1_X4_1; 
int atom_1_X6_2; 

// Parameterized code
void *t0_1(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_1 = v25;
  return NULL;
}

// Parameterized code
void *t0_2(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_2 = v25;
  return NULL;
}

// Parameterized code
void *t0_3(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_3 = v25;
  return NULL;
}

// Parameterized code
void *t0_4(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_4 = v25;
  return NULL;
}

// Parameterized code
void *t0_5(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_5 = v25;
  return NULL;
}

// Parameterized code
void *t0_6(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_6 = v25;
  return NULL;
}

// Parameterized code
void *t0_7(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_7 = v25;
  return NULL;
}

// Parameterized code
void *t0_8(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_8 = v25;
  return NULL;
}

// Parameterized code
void *t0_9(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_9 = v25;
  return NULL;
}

// Parameterized code
void *t0_10(void *arg){
label_1:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v25 = (v3_W0 == 1);
  // Parameterized code
  atom_0_X0_1_10 = v25;
  return NULL;
}
void *t1(void *arg){
label_2:;
  int v6_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v7_W2 = v6_W0 ^ v6_W0;
  int v8_W2 = v7_W2 + 1;
  atomic_store_explicit(&vars[2], v8_W2, memory_order_relaxed);
  int v11_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  int v14_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  if (v14_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v26 = (v6_W0 == 1);
  atom_1_X0_1 = v26;
  int v27 = (v11_W4 == 1);
  atom_1_X4_1 = v27;
  int v28 = (v14_W6 == 2);
  atom_1_X6_2 = v28;
  return NULL;
}

int main(int argc, char *argv[]){

  // Parameterized code
  pthread_t thr0_1, thr0_2, thr0_3, thr0_4, thr0_5, thr0_6, thr0_7, thr0_8, thr0_9, thr0_10; 
  
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  
  // Parameterized code
  atom_0_X0_1_1 = 0;
  atom_0_X0_1_2 = 0;
  atom_0_X0_1_3 = 0;
  atom_0_X0_1_4 = 0;
  atom_0_X0_1_5 = 0;
  atom_0_X0_1_6 = 0;
  atom_0_X0_1_7 = 0;
  atom_0_X0_1_8 = 0;
  atom_0_X0_1_9 = 0;
  atom_0_X0_1_10 = 0;     
  
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X6_2 = 0; 

  // Parameterized code
  pthread_create(&thr0_1, NULL, t0_1, NULL);
  pthread_create(&thr0_2, NULL, t0_2, NULL);
  pthread_create(&thr0_3, NULL, t0_3, NULL);
  pthread_create(&thr0_4, NULL, t0_4, NULL);
  pthread_create(&thr0_5, NULL, t0_5, NULL);
  pthread_create(&thr0_6, NULL, t0_6, NULL);
  pthread_create(&thr0_7, NULL, t0_7, NULL);
  pthread_create(&thr0_8, NULL, t0_8, NULL);
  pthread_create(&thr0_9, NULL, t0_9, NULL);
  pthread_create(&thr0_10, NULL, t0_10, NULL);
  
  pthread_create(&thr1, NULL, t1, NULL);

  // Parameterized code
  pthread_join(thr0_1, NULL);
  pthread_join(thr0_2, NULL);
  pthread_join(thr0_3, NULL);
  pthread_join(thr0_4, NULL);
  pthread_join(thr0_5, NULL);
  pthread_join(thr0_6, NULL);
  pthread_join(thr0_7, NULL);
  pthread_join(thr0_8, NULL);
  pthread_join(thr0_9, NULL);
  pthread_join(thr0_10, NULL);
  
  pthread_join(thr1, NULL);

  int v15 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v16 = (v15 == 2);
  
  // Parameterized code
  int v17_1 = atom_0_X0_1_1;
  int v17_2 = atom_0_X0_1_2;
  int v17_3 = atom_0_X0_1_3;
  int v17_4 = atom_0_X0_1_4;
  int v17_5 = atom_0_X0_1_5;
  int v17_6 = atom_0_X0_1_6;
  int v17_7 = atom_0_X0_1_7;
  int v17_8 = atom_0_X0_1_8;
  int v17_9 = atom_0_X0_1_9;
  int v17_10 = atom_0_X0_1_10;
  
  int v18 = atom_1_X0_1;
  int v19 = atom_1_X4_1;
  int v20 = atom_1_X6_2;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  
  // Parameterized code
  int v23_conj = v17_1 & v17_2 & v17_3 & v17_4 & v17_5 & v17_6 & v17_7 & v17_8 & v17_9 & v17_10 & v22_conj;
  
  int v24_conj = v16 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
