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

long vars[4];
int atom_1_X0_1; 
int atom_1_X2_2; 
int atom_1_X11_1; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v2_W2 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v2_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v3_W3 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W5 = v3_W3 ^ v3_W3;
  int v5_W6 = atomic_load_explicit(&vars[3+v4_W5], memory_order_relaxed);
  int v6_W8 = v5_W6 ^ v5_W6;
  atomic_store_explicit(&vars[0+v6_W8], 1, memory_order_relaxed);
  int v7_W11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v19 = (v1_W0 == 1);
  atom_1_X0_1 = v19;
  int v20 = (v2_W2 == 2);
  atom_1_X2_2 = v20;
  int v21 = (v7_W11 == 1);
  atom_1_X11_1 = v21;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[1], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X2_2 = 0; 
  atom_1_X11_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 2);
  int v10 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11 = (v10 == 2);
  int v12 = atom_1_X0_1;
  int v13 = atom_1_X2_2;
  int v14 = atom_1_X11_1;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  int v17_conj = v11 & v16_conj;
  int v18_conj = v9 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
