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
int atom_0_X1_1; 
int atom_0_X5_0; 
int atom_1_X1_1; 
int atom_1_X5_0; 
int atom_2_X1_1; 
int atom_2_X5_0; 

void *t0(void *arg){
label_1:;
  int v1_W1 = ldx(&vars[1]);
  int v2_W2 = stx(&vars[1], v1_W1);
  if (v2_W2) goto lbl_Fail0; else goto label_2;
label_2:;
  int v3_W5 = ldx(&vars[2]);
  int v4_W2 = stx(&vars[2], 1);
  if (v4_W2) goto lbl_Fail0; else goto label_3;
label_3:;
  goto lbl_Exit0;
lbl_Fail0:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit0;
lbl_Exit0:;
  int v36 = (v1_W1 == 1);
  atom_0_X1_1 = v36;
  int v37 = (v3_W5 == 0);
  atom_0_X5_0 = v37;
  return NULL;
}

void *t1(void *arg){
label_4:;
  int v5_W1 = ldx(&vars[2]);
  int v6_W2 = stx(&vars[2], v5_W1);
  if (v6_W2) goto lbl_Fail1; else goto label_5;
label_5:;
  int v7_W5 = ldx(&vars[3]);
  int v8_W2 = stx(&vars[3], 1);
  if (v8_W2) goto lbl_Fail1; else goto label_6;
label_6:;
  goto lbl_Exit1;
lbl_Fail1:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit1;
lbl_Exit1:;
  int v38 = (v5_W1 == 1);
  atom_1_X1_1 = v38;
  int v39 = (v7_W5 == 0);
  atom_1_X5_0 = v39;
  return NULL;
}

void *t2(void *arg){
label_7:;
  int v9_W1 = ldx(&vars[3]);
  int v10_W2 = stx(&vars[3], v9_W1);
  if (v10_W2) goto lbl_Fail2; else goto label_8;
label_8:;
  int v11_W5 = ldx(&vars[1]);
  int v12_W2 = stx(&vars[1], 1);
  if (v12_W2) goto lbl_Fail2; else goto label_9;
label_9:;
  goto lbl_Exit2;
lbl_Fail2:;
  atomic_store_explicit(&vars[0], 0, memory_order_relaxed);
  goto  lbl_Exit2;
lbl_Exit2:;
  int v40 = (v9_W1 == 1);
  atom_2_X1_1 = v40;
  int v41 = (v11_W5 == 0);
  atom_2_X5_0 = v41;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 1);
  atom_0_X1_1 = 0; 
  atom_0_X5_0 = 0; 
  atom_1_X1_1 = 0; 
  atom_1_X5_0 = 0; 
  atom_2_X1_1 = 0; 
  atom_2_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v13 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v14 = (v13 == 1);
  int v15 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v16 = (v15 == 1);
  int v17 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  int v18 = (v17 == 1);
  int v19 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  int v20 = (v19 == 1);
  int v21 = atom_0_X1_1;
  int v22 = atom_0_X5_0;
  int v23 = atom_1_X1_1;
  int v24 = atom_1_X5_0;
  int v25 = atom_2_X1_1;
  int v26 = atom_2_X5_0;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v21 & v30_conj;
  int v32_conj = v20 & v31_conj;
  int v33_conj = v18 & v32_conj;
  int v34_conj = v16 & v33_conj;
  int v35_conj = v14 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
