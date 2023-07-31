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
int ldx(int *);
int ldax(int *);
int stx(int *, int);
int stlx(int *, int);

long vars[2]; 
int atom_0_X5_2; 
int atom_1_X4_3; 
int atom_1_X2_2; 
int atom_1_X3_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W4 = v1_W2 ^ v1_W2;
  int v3_W4 = v2_W4 + 1;
  atomic_store_explicit(&vars[0], v3_W4, memory_order_release);
  int v4_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v18 = (v4_W5 == 2);
  atom_0_X5_2 = v18;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v5_W2 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v7_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v7_W4 == 3);
  atom_1_X4_3 = v19;
  int v20 = (v5_W2 == 2);
  atom_1_X2_2 = v20;
  int v21 = (v6_W3 == 2);
  atom_1_X3_2 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X5_2 = 0; 
  atom_1_X4_3 = 0; 
  atom_1_X2_2 = 0; 
  atom_1_X3_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 3);
  int v10 = atom_0_X5_2;
  int v11 = atom_1_X4_3;
  int v12 = atom_1_X2_2;
  int v13 = atom_1_X3_2;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  int v16_conj = v10 & v15_conj;
  int v17_conj = v9 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
