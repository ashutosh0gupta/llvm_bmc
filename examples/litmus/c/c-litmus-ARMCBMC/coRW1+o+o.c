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

long vars[1]; 
int atom_0_X0_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v3 = (v1_W0 == 1);
  atom_0_X0_1 = v3;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 

  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);

  pthread_join(thr0, NULL);

  int v2 = atom_0_X0_1;
  if (v2 == 1) assert(0);
  return 0;
}
