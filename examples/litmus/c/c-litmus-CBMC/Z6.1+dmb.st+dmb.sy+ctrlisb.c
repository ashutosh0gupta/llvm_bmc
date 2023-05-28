/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v3_W0 = vars[2];
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  vars[0] = 1;
  int v11 = (v3_W0 == 1);
  v_2_X0_1 = v11;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v4 = vars[0];
  int v5 = (v4 == 2);
  int v6 = vars[1];
  int v7 = (v6 == 2);
  int v8 = v_2_X0_1;
  int v9_conj = v7 & v8;
  int v10_conj = v5 & v9_conj;
  if (v10_conj == 1) assert(0);
  return 0;
}
