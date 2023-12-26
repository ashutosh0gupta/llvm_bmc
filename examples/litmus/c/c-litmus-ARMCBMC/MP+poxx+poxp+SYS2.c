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
int atom_0_X7_0; 
int atom_0_X3_0; 
int atom_0_X2_0; 
int atom_0_X6_0; 
int atom_1_X2_0; 
int atom_1_X1_1; 
int atom_1_X3_0; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[0]);
  int v2_W3 = stx(&vars[0], 1);
  int v3_W6 = ldx(&vars[1]);
  int v4_W7 = stx(&vars[1], 1);
  int v27 = (v4_W7 == 0);
  atom_0_X7_0 = v27;
  int v28 = (v2_W3 == 0);
  atom_0_X3_0 = v28;
  int v29 = (v1_W2 == 0);
  atom_0_X2_0 = v29;
  int v30 = (v3_W6 == 0);
  atom_0_X6_0 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v5_W1 = ldx(&vars[1]);
  int v6_W2 = stx(&vars[1], v5_W1);
  int v7_W3 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v31 = (v6_W2 == 0);
  atom_1_X2_0 = v31;
  int v32 = (v5_W1 == 1);
  atom_1_X1_1 = v32;
  int v33 = (v7_W3 == 0);
  atom_1_X3_0 = v33;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X7_0 = 0; 
  atom_0_X3_0 = 0; 
  atom_0_X2_0 = 0; 
  atom_0_X6_0 = 0; 
  atom_1_X2_0 = 0; 
  atom_1_X1_1 = 0; 
  atom_1_X3_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v8 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v9 = (v8 == 1);
  int v10 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v11 = (v10 == 1);
  int v12 = atom_0_X7_0;
  int v13 = atom_0_X3_0;
  int v14 = atom_0_X2_0;
  int v15 = atom_0_X6_0;
  int v16 = atom_1_X2_0;
  int v17 = atom_1_X1_1;
  int v18 = atom_1_X3_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v14 & v21_conj;
  int v23_conj = v13 & v22_conj;
  int v24_conj = v12 & v23_conj;
  int v25_conj = v11 & v24_conj;
  int v26_conj = v9 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
