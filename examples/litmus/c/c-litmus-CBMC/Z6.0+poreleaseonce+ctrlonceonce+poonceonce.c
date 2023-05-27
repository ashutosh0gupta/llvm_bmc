/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_2_X1_0; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[1] = 1;
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label126; else goto lbl_label126;
lbl_label126:;
  vars[2] = 1;
  int v14 = (v3_W0 == 1);
  v_1_X0_1 = v14;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 2;
  int v7_W1 = vars[1];
  int v15 = (v7_W1 == 0);
  v_2_X1_0 = v15;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_2_X1_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v8 = vars[2];
  int v9 = (v8 == 2);
  int v10 = v_1_X0_1;
  int v11 = v_2_X1_0;
  int v12_conj = v10 & v11;
  int v13_conj = v9 & v12_conj;
  if (v13_conj == 1) assert(0);
  return 0;
}
