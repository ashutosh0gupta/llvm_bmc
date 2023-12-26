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

int vars[1]; 
int atom_0_X1_0; 
int atom_0_X3_0; 

void *t0(void *arg){
label_1:;
  int v1_W1 = ldx(&vars[0]);
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  int v2_W3 = stx(&vars[0], 0);
  int v9 = (v1_W1 == 0);
  atom_0_X1_0 = v9;
  int v10 = (v2_W3 == 0);
  atom_0_X3_0 = v10;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 

  atomic_init(&vars[0], 0);
  atom_0_X1_0 = 0; 
  atom_0_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);

  pthread_join(thr0, NULL);

  int v3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v4 = (v3 == 2);
  int v5 = atom_0_X1_0;
  int v6 = atom_0_X3_0;
  int v7_conj = v5 & v6;
  int v8_conj = v4 & v7_conj;
  if (v8_conj == 1) assert(0);
  return 0;
}
