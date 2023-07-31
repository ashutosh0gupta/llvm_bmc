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
int atom_0_X2_0; 
int atom_1_X1_1; 
int atom_1_X5_0; 
int atom_2_X2_1; 
int atom_2_X5_0; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[1]);
  int v2_W3 = stx(&vars[1], 1);
  if (v2_W3) goto lbl_Fail0; else goto label_2;
label_2:;
  goto lbl_Exit0;
lbl_Fail0:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit0;
lbl_Exit0:;
  int v29 = (v1_W2 == 0);
  atom_0_X2_0 = v29;
  return NULL;
}

void *t1(void *arg){
label_3:;
  int v3_W1 = ldx(&vars[1]);
  int v4_W2 = stx(&vars[1], v3_W1);
  if (v4_W2) goto lbl_Fail1; else goto label_4;
label_4:;
  int v5_W5 = ldx(&vars[2]);
  int v6_W2 = stx(&vars[2], 1);
  if (v6_W2) goto lbl_Fail1; else goto label_5;
label_5:;
  goto lbl_Exit1;
lbl_Fail1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit1;
lbl_Exit1:;
  int v30 = (v3_W1 == 1);
  atom_1_X1_1 = v30;
  int v31 = (v5_W5 == 0);
  atom_1_X5_0 = v31;
  return NULL;
}

void *t2(void *arg){
label_6:;
  int v7_W2 = ldx(&vars[2]);
  int v8_W3 = stx(&vars[2], 2);
  if (v8_W3) goto lbl_Fail2; else goto label_7;
label_7:;
  int v9_W5 = ldx(&vars[1]);
  int v10_W3 = stx(&vars[1], v9_W5);
  if (v10_W3) goto lbl_Fail2; else goto label_8;
label_8:;
  goto lbl_Exit2;
lbl_Fail2:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit2;
lbl_Exit2:;
  int v32 = (v7_W2 == 1);
  atom_2_X2_1 = v32;
  int v33 = (v9_W5 == 0);
  atom_2_X5_0 = v33;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 1);
  atom_0_X2_0 = 0; 
  atom_1_X1_1 = 0; 
  atom_1_X5_0 = 0; 
  atom_2_X2_1 = 0; 
  atom_2_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v11 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v16 = (v15 == 2);
  int v17 = atom_0_X2_0;
  int v18 = atom_1_X1_1;
  int v19 = atom_1_X5_0;
  int v20 = atom_2_X2_1;
  int v21 = atom_2_X5_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v16 & v25_conj;
  int v27_conj = v14 & v26_conj;
  int v28_conj = v12 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
