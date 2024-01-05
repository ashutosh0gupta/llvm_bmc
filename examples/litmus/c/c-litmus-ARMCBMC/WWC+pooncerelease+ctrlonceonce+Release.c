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
int atom_1_X0_2; 
int atom_2_X0_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[1], 1, memory_order_release);
  int v10 = (v1_W0 == 2);
  atom_1_X0_2 = v10;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v2_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_cmpeq = (v2_W0 == 0);
  if (v3_cmpeq)  goto lbl_label171; else goto lbl_label171;
lbl_label171:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v11 = (v2_W0 == 1);
  atom_2_X0_1 = v11;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_2 = 0; 
  atom_2_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v5 = (v4 == 2);
  int v6 = atom_1_X0_2;
  int v7 = atom_2_X0_1;
  int v8_conj = v6 & v7;
  int v9_conj = v5 & v8_conj;
  if (v9_conj == 1) assert(0);
  return 0;
}
