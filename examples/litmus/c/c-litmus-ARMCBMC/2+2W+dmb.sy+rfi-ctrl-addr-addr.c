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

long vars[4]; 
int atom_1_X2_2; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v1_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v2_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v3_W5 = v2_W3 ^ v2_W3;
  int v4_W6 = atomic_load_explicit(&vars[3+v3_W5], memory_order_relaxed);
  int v5_W8 = v4_W6 ^ v4_W6;
  atomic_store_explicit(&vars[0+v5_W8], 1, memory_order_relaxed);
  int v13 = (v1_W2 == 2);
  atom_1_X2_2 = v13;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X2_2 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 2);
  int v8 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atom_1_X2_2;
  int v11_conj = v9 & v10;
  int v12_conj = v7 & v11_conj;
  if (v12_conj == 1) assert(0);
  return 0;
}
