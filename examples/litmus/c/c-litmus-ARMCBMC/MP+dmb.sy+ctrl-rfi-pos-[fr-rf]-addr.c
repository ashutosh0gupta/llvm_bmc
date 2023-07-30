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

long vars[3]; 
int atom_1_X0_1; 
int atom_1_X4_1; 
int atom_1_X5_1; 
int atom_1_X6_2; 
int atom_1_X8_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  if (v1_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v2_W4 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v3_W5 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v4_W6 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v5_W7 = v4_W6 ^ v4_W6;
  int v6_W8 = atomic_load_explicit(&vars[0+v5_W7], memory_order_relaxed);
  int v25 = (v1_W0 == 1);
  atom_1_X0_1 = v25;
  int v26 = (v2_W4 == 1);
  atom_1_X4_1 = v26;
  int v27 = (v3_W5 == 1);
  atom_1_X5_1 = v27;
  int v28 = (v4_W6 == 2);
  atom_1_X6_2 = v28;
  int v29 = (v6_W8 == 0);
  atom_1_X8_0 = v29;
  return NULL;
}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_relaxed);
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_1_X0_1 = 0; 
  atom_1_X4_1 = 0; 
  atom_1_X5_1 = 0; 
  atom_1_X6_2 = 0; 
  atom_1_X8_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v7 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v8 = (v7 == 1);
  int v9 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atom_1_X0_1;
  int v14 = atom_1_X4_1;
  int v15 = atom_1_X5_1;
  int v16 = atom_1_X6_2;
  int v17 = atom_1_X8_0;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  int v21_conj = v13 & v20_conj;
  int v22_conj = v12 & v21_conj;
  int v23_conj = v10 & v22_conj;
  int v24_conj = v8 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
