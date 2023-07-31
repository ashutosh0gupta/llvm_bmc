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
int atom_0_X0_1; 
int atom_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_cmpeq = (v1_W0 == 0);
  if (v2_cmpeq)  goto lbl_label11; else goto label_2;
label_2:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  goto  lbl_label11;
lbl_label11:;
  int v8 = (v1_W0 == 1);
  atom_0_X0_1 = v8;
  return NULL;
}

void *t1(void *arg){
label_3:;
  int v3_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label12; else goto label_4;
label_4:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  goto  lbl_label12;
lbl_label12:;
  int v9 = (v3_W0 == 1);
  atom_1_X0_1 = v9;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[0], 0);
  atomic_init(&vars[1], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atom_0_X0_1;
  int v6 = atom_1_X0_1;
  int v7_conj = v5 & v6;
  if (v7_conj == 1) assert(0);
  return 0;
}
