/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X8_1; 
volatile int v_1_X12_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = vars[2+v4_W2];
  int v8_W5 = v7_W3 ^ v7_W3;
  vars[3+v8_W5] = 1;
  int v11_W8 = vars[3];
  int v12_W9 = v11_W8 ^ v11_W8;
  int v15_W10 = vars[4+v12_W9];
  if (v15_W10) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v18_W12 = vars[0];
  int v33 = (v3_W0 == 1);
  v_1_X0_1 = v33;
  int v34 = (v11_W8 == 1);
  v_1_X8_1 = v34;
  int v35 = (v18_W12 == 0);
  v_1_X12_0 = v35;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X8_1 = 0;
  v_1_X12_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = vars[3];
  int v20 = (v19 == 1);
  int v21 = vars[0];
  int v22 = (v21 == 1);
  int v23 = vars[1];
  int v24 = (v23 == 1);
  int v25 = v_1_X0_1;
  int v26 = v_1_X8_1;
  int v27 = v_1_X12_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v22 & v30_conj;
  int v32_conj = v20 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
