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
int atom_0_X6_0; 
int atom_0_X3_0; 
int atom_0_X2_0; 
int atom_0_X5_0; 
int atom_1_X6_0; 
int atom_1_X3_0; 
int atom_1_X2_0; 
int atom_1_X5_0; 

void *t0(void *arg){
label_1:;
  int v1_W2 = ldx(&vars[0]);
  int v2_W3 = stx(&vars[0], 1);
  int v3_W5 = ldx(&vars[1]);
  int v4_W6 = stx(&vars[1], v3_W5);
  int v30 = (v4_W6 == 0);
  atom_0_X6_0 = v30;
  int v31 = (v2_W3 == 0);
  atom_0_X3_0 = v31;
  int v32 = (v1_W2 == 0);
  atom_0_X2_0 = v32;
  int v33 = (v3_W5 == 0);
  atom_0_X5_0 = v33;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v5_W2 = ldx(&vars[1]);
  int v6_W3 = stx(&vars[1], 1);
  int v7_W5 = ldx(&vars[0]);
  int v8_W6 = stx(&vars[0], v7_W5);
  int v34 = (v8_W6 == 0);
  atom_1_X6_0 = v34;
  int v35 = (v6_W3 == 0);
  atom_1_X3_0 = v35;
  int v36 = (v5_W2 == 0);
  atom_1_X2_0 = v36;
  int v37 = (v7_W5 == 0);
  atom_1_X5_0 = v37;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X6_0 = 0; 
  atom_0_X3_0 = 0; 
  atom_0_X2_0 = 0; 
  atom_0_X5_0 = 0; 
  atom_1_X6_0 = 0; 
  atom_1_X3_0 = 0; 
  atom_1_X2_0 = 0; 
  atom_1_X5_0 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  int v10 = (v9 == 1);
  int v11 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  int v12 = (v11 == 1);
  int v13 = atom_0_X6_0;
  int v14 = atom_0_X3_0;
  int v15 = atom_0_X2_0;
  int v16 = atom_0_X5_0;
  int v17 = atom_1_X6_0;
  int v18 = atom_1_X3_0;
  int v19 = atom_1_X2_0;
  int v20 = atom_1_X5_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v15 & v24_conj;
  int v26_conj = v14 & v25_conj;
  int v27_conj = v13 & v26_conj;
  int v28_conj = v12 & v27_conj;
  int v29_conj = v10 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
