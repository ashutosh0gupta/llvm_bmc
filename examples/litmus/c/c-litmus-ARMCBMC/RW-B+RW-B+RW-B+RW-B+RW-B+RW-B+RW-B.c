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

long vars[7]; 
int atom_0_X0_1; 
int atom_1_X0_1; 
int atom_2_X0_1; 
int atom_3_X0_1; 
int atom_4_X0_1; 
int atom_5_X0_1; 
int atom_6_X0_1; 

void *t0(void *arg){
label_1:;
  int v1_W0 = atomic_load_explicit(&vars[1], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[0], 1, memory_order_relaxed);
  int v21 = (v1_W0 == 1);
  atom_0_X0_1 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v2_W0 = atomic_load_explicit(&vars[0], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[2], 1, memory_order_relaxed);
  int v22 = (v2_W0 == 1);
  atom_1_X0_1 = v22;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v3_W0 = atomic_load_explicit(&vars[2], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[3], 1, memory_order_relaxed);
  int v23 = (v3_W0 == 1);
  atom_2_X0_1 = v23;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v4_W0 = atomic_load_explicit(&vars[3], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[4], 1, memory_order_relaxed);
  int v24 = (v4_W0 == 1);
  atom_3_X0_1 = v24;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v5_W0 = atomic_load_explicit(&vars[4], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[5], 1, memory_order_relaxed);
  int v25 = (v5_W0 == 1);
  atom_4_X0_1 = v25;
  return NULL;
}

void *t5(void *arg){
label_6:;
  int v6_W0 = atomic_load_explicit(&vars[5], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[6], 1, memory_order_relaxed);
  int v26 = (v6_W0 == 1);
  atom_5_X0_1 = v26;
  return NULL;
}

void *t6(void *arg){
label_7:;
  int v7_W0 = atomic_load_explicit(&vars[6], memory_order_relaxed);
  dmbsy();
  atomic_store_explicit(&vars[1], 1, memory_order_relaxed);
  int v27 = (v7_W0 == 1);
  atom_6_X0_1 = v27;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 
  pthread_t thr6; 

  atomic_init(&vars[6], 0);
  atomic_init(&vars[5], 0);
  atomic_init(&vars[4], 0);
  atomic_init(&vars[3], 0);
  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);
  atom_0_X0_1 = 0; 
  atom_1_X0_1 = 0; 
  atom_2_X0_1 = 0; 
  atom_3_X0_1 = 0; 
  atom_4_X0_1 = 0; 
  atom_5_X0_1 = 0; 
  atom_6_X0_1 = 0; 

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);
  pthread_create(&thr6, NULL, t6, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);
  pthread_join(thr6, NULL);

  int v8 = atom_0_X0_1;
  int v9 = atom_1_X0_1;
  int v10 = atom_2_X0_1;
  int v11 = atom_3_X0_1;
  int v12 = atom_4_X0_1;
  int v13 = atom_5_X0_1;
  int v14 = atom_6_X0_1;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  int v17_conj = v11 & v16_conj;
  int v18_conj = v10 & v17_conj;
  int v19_conj = v9 & v18_conj;
  int v20_conj = v8 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
