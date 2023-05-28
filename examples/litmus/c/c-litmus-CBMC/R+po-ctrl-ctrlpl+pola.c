/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_0_X8_2; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[1];
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W4 = vars[2];
  if (v6_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  FENCE();
  vars[3] = 1;
  int v9_W8 = vars[3];
  int v22 = (v9_W8 == 2);
  v_0_X8_2 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[3] = 2;
  FENCE();
  int v12_W2 = vars[0];
  int v23 = (v12_W2 == 0);
  v_1_X2_0 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X8_2 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[3];
  int v14 = (v13 == 2);
  int v15 = vars[0];
  int v16 = (v15 == 1);
  int v17 = v_0_X8_2;
  int v18 = v_1_X2_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v14 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}