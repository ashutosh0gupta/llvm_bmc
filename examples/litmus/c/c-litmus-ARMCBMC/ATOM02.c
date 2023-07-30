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
int atom_0_X3_0; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v1_W3 = ldx(&vars[2]);
  int v2_W4 = stx(&vars[2], v1_W3);
  if (v2_W4) goto lbl_Fail0; else goto label_2;
label_2:;
  goto lbl_Exit0;
lbl_Fail0:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto label lbl_Exit0;
lbl_Exit0:;
  int v17 = (v1_W3 == 0);
  atom_0_X3_0 = v17;
  return NULL;
}

void *t1(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v3_W3 = ldx(&vars[1]);
  int v4_W4 = stx(&vars[1], v3_W3);
  if (v4_W4) goto lbl_Fail1; else goto label_4;
label_4:;
  goto lbl_Exit1;
lbl_Fail1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto label lbl_Exit1;
lbl_Exit1:;
  int v18 = (v3_W3 == 0);
  atom_1_X3_0 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 1);
  atom_0_X3_0 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v6 = (v5 == 1);
  int v7 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v8 = (v7 == 1);
  int v9 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atom_0_X3_0;
  int v12 = atom_1_X3_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v8 & v14_conj;
  int v16_conj = v6 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
