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

int vars[3]; 
int atom_0_X3_3; 
int atom_1_X7_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  int v1_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v1_W3 == 3);
  atom_0_X3_3 = v12;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 3, memory_order_release);
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v3_W4 = v2_W2 ^ v2_W2;
  int v4_W5 = atomic_load_explicit(&vars[2+v3_W4], memory_order_relaxed);
  if (v4_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  isb();
  int v5_W7 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v13 = (v5_W7 == 0);
  atom_1_X7_0 = v13;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X3_3 = 0; 
  atom_1_X7_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v6 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v7 = (v6 == 3);
  int v8 = atom_0_X3_3;
  int v9 = atom_1_X7_0;
  int v10_conj = v8 & v9;
  int v11_conj = v7 & v10_conj;
  if (v11_conj == 1) assert(0);
  return 0;
}
