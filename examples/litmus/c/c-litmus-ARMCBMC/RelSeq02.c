vars[0]
vars[0]
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
// ARM-CBMC specific functions to support exclusive accesses
void ldx(int *);
void ldax(int *);
void stx(int *, int);
void stlx(int *, int);

long vars[2]; 
int atom_1_X1_2; 
int atom_1_X2_0; 
int atom_2_X2_3; 
int atom_2_X3_0; 
int atom_3_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 0, memory_order_release);
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W1 = ldx(&vars[0]);
  int v2_W2 = stx(&vars[0], 0);
  int v18 = (v1_W1 == 2);
  atom_1_X1_2 = v18;
  int v19 = (v2_W2 == 0);
  atom_1_X2_0 = v19;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v3_W2 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v4_W3 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v20 = (v3_W2 == 3);
  atom_2_X2_3 = v20;
  int v21 = (v4_W3 == 0);
  atom_2_X3_0 = v21;
  return NULL;
}

void *t3(void *arg){
label_4:;
  atomic_store_explicit(&vars[1], 0, memory_order_release);
  int v5_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v22 = (v5_W3 == 0);
  atom_3_X3_0 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X1_2 = 0; 
  atom_1_X2_0 = 0; 
  atom_2_X2_3 = 0; 
  atom_2_X3_0 = 0; 
  atom_3_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 3);
  int v8 = atom_1_X1_2;
  int v9 = atom_1_X2_0;
  int v10 = atom_2_X2_3;
  int v11 = atom_2_X3_0;
  int v12 = atom_3_X3_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v9 & v14_conj;
  int v16_conj = v8 & v15_conj;
  int v17_conj = v7 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
