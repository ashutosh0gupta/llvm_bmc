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

long vars[3]; 
int atom_0_X2_1; 
int atom_0_X6_0; 
int atom_1_X1_1; 
int atom_1_X5_0; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[1]);
  int v2_W3 = stx(&vars[1], 2);
  if (v2_W3) goto lbl_Fail0; else goto label_2;
label_2:;
  int v3_W6 = ldx(&vars[2]);
  int v4_W3 = stx(&vars[2], 1);
  if (v4_W3) goto lbl_Fail0; else goto label_3;
label_3:;
  goto lbl_Exit0;
lbl_Fail0:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit0;
lbl_Exit0:;
  int v25 = (v1_W2 == 1);
  atom_0_X2_1 = v25;
  int v26 = (v3_W6 == 0);
  atom_0_X6_0 = v26;
  return NULL;
}

void *t1(void *arg){
label_4:;
  int v5_W1 = ldx(&vars[2]);
  int v6_W2 = stx(&vars[2], v5_W1);
  if (v6_W2) goto lbl_Fail1; else goto label_5;
label_5:;
  int v7_W5 = ldx(&vars[1]);
  int v8_W2 = stx(&vars[1], 1);
  if (v8_W2) goto lbl_Fail1; else goto label_6;
label_6:;
  goto lbl_Exit1;
lbl_Fail1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit1;
lbl_Exit1:;
  int v27 = (v5_W1 == 1);
  atom_1_X1_1 = v27;
  int v28 = (v7_W5 == 0);
  atom_1_X5_0 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 1);
  atom_0_X2_1 = 0; 
  atom_0_X6_0 = 0; 
  atom_1_X1_1 = 0; 
  atom_1_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v11 == 2);
  int v13 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atom_0_X2_1;
  int v16 = atom_0_X6_0;
  int v17 = atom_1_X1_1;
  int v18 = atom_1_X5_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v14 & v21_conj;
  int v23_conj = v12 & v22_conj;
  int v24_conj = v10 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
