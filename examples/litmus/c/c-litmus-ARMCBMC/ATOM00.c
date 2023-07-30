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
int atom_1_X2_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W2 = ldx(&vars[1]);
  int v2_W3 = stx(&vars[1], 2);
  if (v2_W3) goto lbl_Fail1; else goto label_3;
label_3:;
  goto lbl_Exit1;
lbl_Fail1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto label lbl_Exit1;
lbl_Exit1:;
  int v10 = (v1_W2 == 0);
  atom_1_X2_0 = v10;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 1);
  atom_1_X2_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4 = (v3 == 1);
  int v5 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v6 = (v5 == 2);
  int v7 = atom_1_X2_0;
  int v8_conj = v6 & v7;
  int v9_conj = v4 & v8_conj;
  if (v9_conj == 1) assert(0);
  return 0;
}
