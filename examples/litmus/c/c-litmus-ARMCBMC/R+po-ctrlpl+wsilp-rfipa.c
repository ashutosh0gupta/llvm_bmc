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
int atom_0_X5_2; 
int atom_1_X4_4; 
int atom_1_X3_3; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 4, memory_order_relaxed);
  int v1_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v1_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[0], 1, memory_order_release);
  int v2_W5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v13 = (v2_W5 == 2);
  atom_0_X5_2 = v13;
  return NULL;
}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 3, memory_order_relaxed);
  int v3_W3 = atomic_load_explicit(&vars[0], memory_order_acquire);
  int v4_W4 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v14 = (v4_W4 == 4);
  atom_1_X4_4 = v14;
  int v15 = (v3_W3 == 3);
  atom_1_X3_3 = v15;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X5_2 = 0; 
  atom_1_X4_4 = 0; 
  atom_1_X3_3 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 4);
  int v7 = atom_0_X5_2;
  int v8 = atom_1_X4_4;
  int v9 = atom_1_X3_3;
  int v10_conj = v8 & v9;
  int v11_conj = v7 & v10_conj;
  int v12_conj = v6 & v11_conj;
  if (v12_conj == 1) assert(0);
  return 0;
}
